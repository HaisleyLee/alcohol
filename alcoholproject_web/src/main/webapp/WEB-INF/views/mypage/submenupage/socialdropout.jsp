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
var mem_kakao = "";
var input_mem_email = "";
function go_dropout(mem_kakao) {
	/* alert("mem_pw : " + mem_pw); */
	/* alert("inputpw : " + inputpw); */
	input_mem_email = $('[name=input_mem_email]').val();
	mem_kakao = $('[name=mem_kakao]').val();
	//alert("mem_kakao ; " + mem_kakao);
	//alert("input_mem_email ; " + input_mem_email);
	if(mem_kakao == input_mem_email){
		$('form').submit();
	} else {
		alert("비밀번호가 일치하지않습니다.");
	}
}
</script>
<style type="text/css">

</style>

</head>
<body>
<div class="mypagecontent">
<h1>탈퇴 요청</h1>
		<form action="socialdropout" method="post">
			<input type="hidden" name="mem_id" value="${mvo.mem_id}">
			<input type="hidden" name="mem_email" value="${mvo.mem_email}">
			<input class="inputst" type="hidden" name="mem_kakao" placeholder="기존이메일" value="${mvo.mem_kakao}" />
			<div>
				<input class="inputst" type="text" name="input_mem_email" placeholder="소셜이메일 입력" />
			</div>
		</form>
		본인 확인을 위해 소셜로그인한 이메일을 입력해주세요.
<div class="btnSet">
	<a class="btn-fill_dropout" onclick="go_dropout('${mvo.mem_kakao}');">본인인증</a>
	<%-- <a class="btn-empty" href='<c:url value="/" />'>탈퇴취소</a> --%>
	<!-- href='<c:url value="/" />'은 뒤로가기임. -->
</div>
</div>

</body>
</html>