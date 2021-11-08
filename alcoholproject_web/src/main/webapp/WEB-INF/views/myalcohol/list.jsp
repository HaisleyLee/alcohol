<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, minimum-scale=1.0">
<meta charset="UTF-8">
<title>술장고</title>

<style type="text/css">
#columns{
		margin: 0px auto;
        column-width: 250px;
        column-gap: 70px;
      }
      #columns figure{
        display: inline-block;
        /* border:1px solid rgba(0,0,0,0.2); */
        margin: 10%;
        padding: 30px;
/*      box-shadow: 2px 2px 5px rgba(0,0,0,0.5); */
        box-shadow: 5px 5px 20px #bdbdbd;
        border-radius: 20px;
        background-color: #ffffff;
      }
      #columns figure img{
        width: 260px;
      }
      #columns figure figcaption{
        /* border-top:1px solid rgba(0,0,0,0.2); */
        padding:5%;
        margin-top:5%;
      }
.columnsdiv{
	width: 100%;
	text-align: center;
}
.clickpoint:hover{
	cursor: pointer;
	color: gray;
	opacity: 0.8;
	box-shadow: 5px 5px 20px #999999;
	margin-bottom: 10px;
}
</style>

<script type="text/javascript">
var al_id;
	function alcoholclick(al_id) {
		/* Swal.fire({ 
			icon: 'success',
			title: 'Alert가 실행되었습니다.',
			text: '이곳은 내용이 나타나는 곳입니다. \nal_id: ' + al_id,
		}); */
		
		location.href="myalcoholdetail?al_id="+al_id;
		
	}
$(document).ready(function(){
});
</script>

</head>
<body>

<!-- 세션에 로그인정보 중 아이디가 없으면 로그인하게 이동시킴 -->
<c:if test="${empty loginInfo.mem_id}">
	<script type="text/javascript">
		location.href="/login";
	</script>
</c:if>


  <!-- ======메인시작  ======= -->
<main id="main" class="container d-flex align-items-center col-12">

<div style="width: 10%;"></div>

<div class="content" data-aos="fade-up" data-aos-delay="100">

<div style="width: 100%; height: 100px;"></div>
<div style="width: 100%; height: 100px;"></div>
<p>My Alcohol info</p>
<h1>내 술 정보</h1>
<c:if test="${alcheck eq 'T'}">

	<div class="columnsdiv">
	<div id="columns">
	
	<c:if test="${!empty list}">
		<c:forEach items="${list}" var="list">
			  <figure class="clickpoint">
				  <img src="${list.al_imgpath}" onclick="alcoholclick(${list.al_id})">
				  <figcaption><span onclick="alcoholclick(${list.al_id})">${list.al_name}${list.al_id}</span></figcaption>
			  </figure>
		</c:forEach>
	</c:if>
	
  
  </div>
</div>
</c:if>
<c:if test="${alcheck eq 'F'}">
	<div class="columnsdiv">
		술장고 내에 술이 없습니다.
	  </div>
</c:if>
</div>

</main><!-- 메인끝 -->

</body>
</html>