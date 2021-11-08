/**
 공통 자바스크립트 코드 
 */
 		//class가 chk인 것들이 비어있는지 체크
		function emptyCheck() {
			var ok = true;
			$('.chk').each(function () {
				if($(this).val() == ''){
					alert($(this).attr('title') + '입력해주세요.');
					$(this).focus();
					ok = false;
					return ok;
				}
			});
			return ok;
		}