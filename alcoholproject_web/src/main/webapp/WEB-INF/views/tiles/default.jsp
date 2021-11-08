<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <c:choose>
	<c:when test="${category eq 'login'}">
		<c:set var="title" value="login"></c:set>
	</c:when>
</c:choose>
카테고리가 로그인이면 타이틀을 로그인으로 하는 태그 --%>
<title>IoT</title>
<!-- css가져올 수 있게 경로 넣어줘야함. -->
<link rel="stylesheet" type="text/css" href="css/common.css?v="<%=new java.util.Date().getTime()%> />
<!-- v="<%=new java.util.Date().getTime()%> 부분은 계속 새로업데이트되는 css을 불러오려고 하는 것이다. -->
<link rel='icon' type='image/x-icon' href='imgs/hanul.ico'>
<!-- ' type='image/x-icon' 이것은 고정된건가봄??? -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 제이쿼리 사용 위한 스크립트 넣기 -->
</head>
<body>
	<div id="content">
		<tiles:insertAttribute name="content"/>
		<%--@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" 넣으면 자동완성 가능--%>
	</div>
	
</body>
</html>