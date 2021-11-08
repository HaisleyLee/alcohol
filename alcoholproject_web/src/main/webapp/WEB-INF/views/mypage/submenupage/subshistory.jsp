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

</script>
<style type="text/css">

</style>

</head>
<body>
<div class="mypagecontent">
<h1>구독 내역</h1>
<div>
<table>
<tr>
	<th>일자</th>
	<th>구독박스 내용물</th>
	<th>가격</th>
</tr>
<c:if test="${!empty list}">
<c:forEach items="${list}" var="list">
<tr>
	<td>${list.month}</td>
	<td>${list.al_List}</td>
	<td>${list.price_state}</td>
</tr>
</c:forEach>
</c:if>
<c:if test="${empty list}">
<tr>
	<td colspan="3">조회할 수 있는 구독내역이 없습니다.</td>
</tr>
</c:if>
</table>
</div>

</div>


</body>
</html>