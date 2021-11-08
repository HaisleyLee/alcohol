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
<link href="css/mypagecommon.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	<!--  j쿼리를 사용하는 스크립트코드 -->
<script type="text/javascript">
function go_dropout() {
	$('form').submit();
}
</script>
<style type="text/css">

</style>

</head>
<body>
<div class="mypagecontent">
<h1>탈퇴 요청</h1>
<form action="dropout" method="post" enctype="multipart/form-data">
<input type="hidden" name="mem_id" value="${mem_id}">
- 회원탈퇴는 온라인에서 동의하신 모든 약관을 철회함과 동시에 모든 서비스에 대한 탈퇴를 의미합니다.
- 술장고 이용과 관련된 혜택이 탈퇴와 함께 해지될 수 있습니다.
- 회원탈퇴 시 보유한 적립머니는 즉시 소멸됩니다.
정말 탈퇴하시겠습니까?
<div class="btnSet" style="text-align: center; margin-top: 10px;">
	<a class="btn-fill_join" onclick="go_dropout()">탈퇴</a>	
	<a class="btn-empty" href='<c:url value="/" />'>취소</a>
	<!-- href='<c:url value="/" />'은 뒤로가기임. -->
</div>
</form>
</div>

</body>
</html>