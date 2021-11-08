<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	
	
  <!-- Favicons -->
<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" sizes="16x16"/>
<link rel="shortcut icon" href="./imgs/favicon.png" type="image/x-icon"/>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>
	
	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<meta name="viewport" content="width=device-width, minimum-scale=1.0">
<meta charset="UTF-8">
<title>술장고</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	<!--  j쿼리를 사용하는 스크립트코드 -->
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- daum.net의 지도 api 사용 스크립트 -->
	
	
  <!-- Vendor CSS Files -->
  <link href="./vendor/animate.css/animate.min.css" rel="stylesheet"/>
  <link href="./vendor/aos/aos.css" rel="stylesheet"/>
  <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
  <link href="./vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
  <link href="./vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
  <link href="./vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>

  <!-- Template Main CSS File -->
  <link href="./css/style.css" rel="stylesheet"/>
	<link rel="stylesheet" href="css/notice/noticetotal.css">
	
<script type="text/javascript">

//마이페이지 사이드메뉴 선택시 조회
var selvalue;
$(document).ready(function(){
	if($('#selvalue').val() == ""){
	} else {
		selvalue = Number($('#selvalue').val());
	}
	$.ajax({
		/* url: '/mypage/sub/'+selvalue, */
		url: 'mypage/sub',
		//selvalue은 선택한 서브메뉴 id임..
		data : {selvalue:selvalue},
		
		success: function( response ){
			$('#mypagemain').html( response );
			
		},error: function(req, text){
			alert(text + ':' + req.status);
		}
	});
	
	
	$('.submenu1 li').on('click', function() {
		selvalue = this.value;
		/* Swal.fire({ 
			icon: 'success',
			title: "selvalue : " + selvalue
		}); */
		mypage_list(selvalue);
	});
	$('.submenu2 li').on('click', function() {
		selvalue = this.value;
		mypage_list(selvalue);
	});
});

function mypage_list(selvalue){
	/* var urlvalue = '/mypage/sub/'+selvalue; */
	/* Swal.fire({ 
		icon: 'success',
		title: "selvalue : "+selvalue
	}); */
	
	$.ajax({
			/* url: '/mypage/sub/'+selvalue, */
			url: 'mypage/sub',
			//selvalue은 선택한 서브메뉴 id임..
			data : {selvalue:selvalue},
			
			success: function( response ){
				$('#mypagemain').html( response );
				
			},error: function(req, text){
				alert(text + ':' + req.status);
			}
		});
}
var subclick1 = 0;
var subclick2 = 0;
/* 서브메뉴슬라이드코드 */
$(document).ready(function(){
	  $(".btn1").click(function(){
		  if(subclick1 == 0){
		    $(".submenu1").slideUp(1000, function(){
		    });
		    subclick1 = 1;
		  } else if(subclick1 == 1){
		    $(".submenu1").slideDown(1000, function(){
		    });
		    subclick1 = 0;
		  }
	  });
	  $(".btn2").click(function(){
			if(subclick2 == 0){
				    $(".submenu2").slideUp(1000, function(){
				    });
				    subclick2 = 1;
				  } else if(subclick2 == 1){
				    $(".submenu2").slideDown(1000, function(){
				    });
				    subclick2 = 0;
				  }
	  });
	  
	});
</script>

<c:if test="${empty loginInfo}">
	<script type="text/javascript">
			Swal.fire({ 
			icon: 'success',
			title: '로그인해주세요!',
			text: '접근권한이 없습니다.'
		});
		location.href="login";
	</script>
</c:if>

<style type="text/css">

html, body{
	background-color: #ffffff;
}

.btn1:hover, .btn2:hover, .submenu1 li:hover, .submenu2 li:hover{
	cursor: pointer;
	opacity: 0.8;
}

/* 서브메뉴관련css */
ul, li {
list-style: none;
padding-left: 0px;
text-align: center;
}
.ul li {
perspective : 300px;
}
.ul ul {
visibility : hidden;
opacity : 0;
transition : .3s ease-in-out;
transform : rotateX (-90deg) rotateY (0);
transform-origin : 0 0;
}
.ul ul li {
/* perspective : 1500px; */
}
.ul ul ul {
transform : rotateX (0) rotateY (-90deg);
}
.ul li : hover> ul {
visibility : visible;
opacity : 1;
transform : rotateX (0) rotateY (0);
}
.submenu1 li , .submenu1 li span, .submenu2 li,.submenu2 li span{
	text-align: left;
}

</style>

</head>
<body>



<input type="text" id="selvalue" name="selvalue" value="${selvalue}"/>

<!-- 세션에 로그인정보 중 아이디가 없으면 로그인하게 이동시킴 -->
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
<c:if test="${!empty selvalue}">
</c:if>

<main id="main" class="container d-flex align-items-center">
    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100" style="margin-top: 100px;">
      <div class="row">
      <div style="margin-top: 50px;"></div>
<p>My Page</p>
<a href="notice"><h1>마이페이지</h1></a>
    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
      <div class="row">
        <div class="col-lg-3" id="sidebar" style="margin-top: 30px;">
		    <p class="btn1" style="font-weight: bold; font-size: 1.1rem;">내 구독 정보</p>
	        <ul class="submenu1" style="padding-left: 10px;">
				<li value="1"><span>구독 내역</span></li>
				<li value="2"><span>구독 환불 신청</span></li>
				<li value="3"><span>취소·환불 내역</span></li>
	        </ul>   
	        <p class="btn2" style="font-weight: bold; font-size: 1.1rem;">회원정보</p>
	        <ul class="submenu2" style="padding-left: 10px;"> 
				<li value="4"><span>회원정보 수정</span></li>
				<li value="6"><span>회원탈퇴</span></li>
				<li value="7"></li>
	        </ul>   
	</div>
	 <div class="col-lg-8" id="mypagemain" style="margin-top: -100px; padding-top: 30px;">
	</div>
	</div>
</div>
</div>
</div>
</main>
</body>
</html>