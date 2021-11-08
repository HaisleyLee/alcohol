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
<!-- 공지사항 답변 권한은 아이디 1인 관리자만 있음 -->
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
<!-- 첨부파일 전송시 1.form 태그는 반드시 post
		 encType을 mulitpart/form-data로 지정
	  -->
<div class="container">
	<div id="wrap">
		<div class="cate">
			<p>공지사항 > 답글 작성</p>
		</div>
		<div id="content">
			<form method="post" action="reply_insert.notice" enctype="multipart/form-data">
				<input type="hidden" name="root" value="${vo.root }" />
				<input type="hidden" name="step" value="${vo.step }" />
				<input type="hidden" name="indent" value="${vo.indent}" />
				<input type="hidden" name="writer" value="${loginInfo.mem_id}" />
				
				<table>
					<tr>
						<th>제목</th>
						<td>
							<input id="title" type="text" title="제목" name="title" class="chk"  placeholder="제목을 입력하세요." />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea class="chk" title="내용" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td class="left">
							<label><input type="file" name="file" id="attach-file"/>
							<img src="imgs/select.png" class="file-img" /></label>
							<span id='file-name'></span>
							<span id='delete-file'><i class="fas fa-times"></i> </span>
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
				<a  onclick="if ( emptyCheck()  ) $('form').submit() ">저장</a>
				<a onclick="goBack();">취소</a>
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
	window.history.back();
}
</script>
</body>
</html>