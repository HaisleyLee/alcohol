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
	function go_refund() {
		if($('input[name=selectedrefund]:checked').val() == null){
			alert('환불 하려는 구독 내역을 하나 이상 선택해주세요.');
			return false;
		}
		/* alert($('input[name=selectedrefund]:checked').val()); */
		$('form').submit();
	}
	
	function Chk() {
		var result = Array();
		var cnt = 0;
		var chkbox = $(".chkselect");
		for(i=0;i<chkbox.length;i++) {
			if(chkbox[i].checked == true) {
				result[cnt] = chkbox[i].value;
				cnt++;
			}
		}
		$('#result').val(result);
	
	}

	function CheckAll() {
		var chkbox = $(".chkselect");
		var chkall = document.getElementById('checkall');
		for(i=0;i<chkbox.length;i++) {
			chkbox[i].checked = chkall.checked;
		}
		Chk();
}

</script>
<style type="text/css">

</style>

</head>
<body>
<div class="mypagecontent">
<h1>환불 요청</h1>
<div>
<form method="post" action="refundgo" enctype="multipart/form-data">
<table>
<tr>
	<th>일자</th>
	<th>구독박스 내용물</th>
	<th>가격</th>
	<th>환불 요청</th>
</tr>
<c:if test="${!empty list}">
<c:forEach items="${list}" var="list">
<tr>
	<td>${list.month}</td>
	<td>${list.al_List}</td>
	<td>${list.price_state}</td>
	<td><input type='checkbox' name='selectedrefund' class="chkselect" value='${list.month}' onclick='Chk();'/></td>
</tr>
</c:forEach>
</c:if>
<c:if test="${empty list}">
<tr>
	<td colspan="4">환불 요청할 수 있는 구독내역이 없습니다.</td>
</tr>
</c:if>
</table>
<div style="text-align: right;">
<label for="checkall">
<input type='checkbox' id='checkall' name='checkall' onclick='CheckAll();' style="margin: 10px; padding: 10px;"> 전체선택 </label> 
<input type='hidden' id='result' name='result'>
<input type='hidden' id='mem_id' name='mem_id' value="${mem_id}">
</div>
</form>
<div class="btnSet">
	환불 받으려는 구독 내역을 모두 체크하세요.
	<a onclick="go_refund()" style="margin-left: 20px;">모두 환불받기</a>
</div>	

</div>

</div>

</body>
</html>