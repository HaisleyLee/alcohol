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
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	
<!--  j쿼리를 사용하는 스크립트코드 -->

<style type="text/css">
.al_div{
	margin-top: 50px;
	margin-bottom: 50px;
}
.al_div div{
	margin: 10px;
}
.kakaosend:hover{
	cursor: pointer;
}
</style>
<c:if test="${empty loginInfo.mem_id}">
	<script type="text/javascript">
			Swal.fire({ 
			icon: 'success',
			title: '로그인해주세요!',
			text: '접근권한이 없습니다.',
		});
		location.href="/login";
	</script>
</c:if>
</head>
<body>


  <!-- ======메인시작  ======= -->
	<main id="main">
	
<div style="margin-top: 150px;"></div>

	<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100" style="text-align: center;">
	<p>My Spare Alcohols</p>
	<h2>다음달 받을 술 미리보기</h2>
		<div class="row" style="text-align: center;">
		<c:forEach var="vo" begin="0" end="1" step="1" items="${list}" varStatus="state">
        <div class="col-lg-6" style="text-align: center;">
				<div class="al_div" style="text-align: center;">
					<div><img src="${vo.al_imgpath}" style="width: auto; height: 400px; border-radius: 200px;"/></div>
					<div>${vo.al_name}</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</main>

</body>
</html>