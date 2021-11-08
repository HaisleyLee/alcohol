/**
 * 첨부파일 관련된 함수 선언
 */
		$('#attach-file').on('change', function () {
			var attach = this.files[0];
			if(attach){
				$('#file-name').text( this.files[0].name );
				$('#delete-file').css('display', 'inline-block');
				
				//미리보기 태그가 있고, 첨부된 파일이 이미지 파일인 경우 미리보기 되도록 처리 ↓
				if($('#preview').length > 0 ){
					if(isImage(attach.name)){
						var img = '<img src="" class="file-img" id="preview-img"/>';
						$('#preview').html(img);
						
						var reader = new FileReader();
						reader.onload = function (e) {
							$('#preview-img').attr('src', e.target.result);
						}
						reader.readAsDataURL(attach);
					} else {
						$('#preview').html('');
					}
				}
			} else {//attach가 false일 경우 : 파일을 고르려다가 취소를 누른 경우
					$('#file-name').text("");
					$('#attach-file').val('');
					$('#delete-file').css('display','none');
					//삭제시 이미지 미리보기 태그가 있는 경우 미리보기 이미지 없애기
					if($('#preview').length > 0) $('#preview').html('');
			}
		});
		
		//파일첨부하지않기위한 삭제
		//딜리트파일 클릭시 파일 비우기
		$('#delete-file').on('click', function () {
			$('#file-name').text('');
			$('#attach-file').val('');
			$('#delete-file').css('display','none');
			
			//삭제시 이미지 미리보기 태그가 있는 경우 미리보기 이미지 없애기
			if($('#preview').length > 0) $('#preview').html('');
		});
		
		//선택한 파일이 이미지인지 판단
		function isImage(filename) {
			//abc.txt , abc.png , abc.hwp , .java...
			var ext = filename.substring( filename.lastIndexOf('.')+1).toLowerCase();
			var imgs = ['jpg' , 'jpeg' , 'png' , 'gif' , 'bmp'];
			if( imgs.indexOf(ext.toLowerCase()) > -1) return true;
			else return false;
			
		}