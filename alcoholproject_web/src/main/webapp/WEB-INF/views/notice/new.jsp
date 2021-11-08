<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/notice/new.css" >
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
	.file-img { width:24px } 
	#attach-file, #delete-file { display:none;}
	#delete-file { color:red; }
</style>
</head>
<body>
<!-- 공지사항 새글 작성 권한은 아이디 1인 관리자만 있음 -->
<c:if test="${loginInfo.mem_id ne 1 }">
	<script type="text/javascript">
			Swal.fire({ 
			icon: 'success',
			title: '로그인해주세요!',
			text: '접근권한이 없습니다.',
		});
		location.href="/login";
	</script>
</c:if>
	<div class="container">
		<div id="wrap">
			<div class="cate">
					<p> 공지사항 > 신규 작성 </p>
			</div>
			<div id="content">
				<form method="post" action="insert.notice" enctype="multipart/form-data">
					<input type="hidden" name="writer" value="${loginInfo.mem_id }" />
					<table>
						<tr>
							<th>제목</th>
							<td>
								<input id="title" type="text" title="제목" name="title" class="chk" placeholder="제목을 입력하세요." />
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea class="chk" title="내용" name="content" placeholder="내용을 입력하세요."></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td class="left">
								<label><input type="file" name="file" id="attach-file"/>
								<img src="imgs/select.png" class="file-img" /></label>
								<span id='file-name'></span>
								<span id='delete-file' ><i class="fas fa-times"></i> </span>
								<span id='preview'> </span>
							</td>
						</tr>
						<tr>
							<th>전체 공지 등록</th>
							<td>
									<div onclick="Impchk()">
									<label>
										<input type="checkbox" id="important" name="important" style="display: none;" />
										<i id="i" class="far fa-check-circle"></i>
										&nbsp; 전체 공지로 등록합니다.
									</label>
									</div>
							</td>
						</tr>
					</table>
				</form>		
				<div class="btnSet">
					<a onclick="goSubmit()">작성</a>
					<a onclick="goBack()">취소</a>
				</div>	
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/file_check.js"></script>
	<script type="text/javascript">
	function Impchk(){
		   if($('#important').is(':checked') == true){
		      $('#i').removeClass();
		      $('#i').addClass('far fa-check-circle');
		      
		   }else{
		      $('#i').removeClass();
		      $('#i').addClass('fas fa-check-circle');
		   }
		}
	
	/* 타이틀과 내용이 무조건 입력되게 해야한다. */	
	/* class 가 chk인것들이 비어있는지 체크  */
	 function emptyCheck() {
		var ok = true;
		$('.chk').each(function () {
			if($(this).val()==''){
				swal($(this).attr('title') + '을/를 입력해주세요.');
				$(this).focus();
				ok = false;
				return ok;
			}
		});
		return ok;
	}
		
	 function goBack(){
			swal({
			     title: "취소",
			     text: "공지글 작성을 취소하시겠습니까?",
			     icon: "warning", //"info,success,warning,error" 중 택1
			     buttons: ["NO", "YES"],
			}).then((YES) => {
			     if (YES) {
			    	 window.history.back();
			     }else {
			    	 return false;
			     }
			});
		}
		
		function goSubmit(){
			swal({
			     title: "등록",
			     text: "공지글을 등록하시겠습니까?",
			     icon: "warning", //"info,success,warning,error" 중 택1
			     buttons: ["NO", "YES"],
			}).then((YES) => {
			     if (YES) {
			    	 if ( emptyCheck()  ){$('#attach').val($('#file-name').text()); $('form').submit() }
			     }else {
			    	 return false;
			     }
			});
		}
	</script>
</body>
</html>