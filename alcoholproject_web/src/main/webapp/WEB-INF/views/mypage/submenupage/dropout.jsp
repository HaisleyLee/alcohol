<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<meta name="viewport" content="width=device-width, minimum-scale=1.0">
<meta charset="UTF-8">
<title>술장고</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="css/mypagecommon.css" rel="stylesheet" type="text/css">
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	<!--  j쿼리를 사용하는 스크립트코드 -->
<script type="text/javascript">
var mem_pw;
var inputpw;
function go_dropout(mem_pw) {
	/* alert("mem_pw : " + mem_pw); */
	inputpw = $('.inputpwclass').val();
	/* alert("inputpw : " + inputpw); */
	
	if(mem_pw == inputpw){
		/* alert("비밀번호가 일치합니다."); */
		$('form').submit();
	} else {
		alert("비밀번호가 일치하지 않습니다.");
	}
}
</script>
<style type="text/css">

.inputst{
	width: 440px;
	padding: 10px;
	font-size: 1.3rem;
	font-family: 'Pretendard-Regular';
	margin: 20px;
	border: 0px;
	border-bottom: 3px solid #CCCCCC;
	outline:none;
	color: #595959;
}
.btn-fill_dropout{
	font-size: 1.2rem;
	text-align: center;
	padding: 15px;
	/* border: 1px solid rgb(128, 128, 128); */
	border-radius: 30px; 
	/* box-shadow: 1px 1px 1px #575757; */ 
	background-color: #F0F0F0;	
	color: #545454;
}
</style>

</head>
<body>

  <!-- ======메인시작  ======= -->
	<main id="main">

<div class="mypagecontent">
<h1>탈퇴 요청</h1>
<br/><br/>

<div class="content">
<div class="container position-relative" style="text-align: center;">
	<div class="contentdiv">

<form action="passVerifi" method="post" enctype="multipart/form-data">
<input type="hidden" name="mem_pw" value="${mvo.mem_pw}">
<input type="hidden" name="mem_id" value="${mvo.mem_id}">

			<div style="font-size: 1rem;">
				${mvo.mem_nickname} 님의 회원 계정을 탈퇴하기 위해 비밀번호를 한번 더 확인합니다.
			</div><br/><br/>
				<div style="font-size: 1.2rem;">
				이메일 ${mvo.mem_email}
			</div>
<div>
<input type="password" placeholder="비밀번호" class="inputpwclass inputst" name="inputpw" />
</div>
</form>
		본인 확인을 위해 기존 비밀번호를 입력해주세요.
<div class="btnSet" style="margin: 0px auto; text-align: center;">
	<a class="btn-fill_dropout" onclick="go_dropout('${mvo.mem_pw}')">본인인증</a>
	<a class="btn-empty" href='<c:url value="/" />'>탈퇴취소</a>
	<!-- href='<c:url value="/" />'은 뒤로가기임. -->
		</div>
	</div>
</div>
</div>
</div>

</main>

</body>
</html>