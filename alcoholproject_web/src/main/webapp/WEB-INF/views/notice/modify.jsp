<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- 공지사항 수정 권한은 아이디 1인 관리자만 있음 -->
<c:if test="${loginInfo.mem_id ne 1 }">
	<script type="text/javascript">
			Swal.fire({ 
			icon: 'success',
			title: '로그인해주세요!',
			text: '접근권한이 없습니다.'
		});
		location.href="/login";
	</script>
</c:if>
<!-- 파일을 첨부하여, 서버에 전송하는 처리하기위해 반드시 지켜야할 속성이 있음
	1. method: post (get : 데이터가 노출됨 (파일의 경우 바이트 형태로 이동함)
	2. enctype: multipart/form-data  -->
	<div class="container">
		<div id="wrap">
			<div class="cate">
					<p> 공지사항 > 수정 </p>
			</div>
			<div id="content">
				<form method="post" action="update.notice" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${vo.id }" />
					<input type="hidden" name="attach" id="attach" />
					<table>
						<tr>
							<th>제목</th>
							<td>
								<input id="title" type="text" title="제목" name="title" class="chk" value="${vo.title }" placeholder="제목을 입력하세요." />
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea class="chk" title="내용" name="content">${vo.content }</textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td class="left">
								<label><input type="file" name="file" id="attach-file"/>
								<img src="imgs/select.png" class="file-img" /></label>
								<span id='file-name'>${vo.filename }</span>
								<span id='delete-file' style="display: ${empty vo.filename ? 'none' : 'inline-block'}"><i class="fas fa-times"></i> </span>
								<span id='preview'> </span>
							</td>
						</tr>
						<tr>
							<th>전체 공지 등록</th>
							<td>
								<c:if test="${vo.important eq 'Y' }">
										<div onclick="Impchk()">
										<label>
										<input type="checkbox" id="important" name="important" style="display: none;" checked="checked" />
										<i id="i" class="fas fa-check-circle"></i>
										&nbsp; 전체 공지로 등록합니다.
									</label>
									</div>
								</c:if>
								<c:if test="${vo.important eq 'N' }">
									<div onclick="Impchk()">
									<label>
										<input type="checkbox" id="important" name="important" style="display: none;" />
										<i id="i" class="far fa-check-circle"></i>
										&nbsp; 전체 공지로 등록합니다.
									</label>
									</div>
								</c:if>
							</td>
						</tr>
					</table>
				</form>		
				<div class="btnSet">
					<a onclick="goSubmit()">수정</a>
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
			     text: "공지글 수정을 취소하시겠습니까?",
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
			     text: "공지글을 수정하시겠습니까?",
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