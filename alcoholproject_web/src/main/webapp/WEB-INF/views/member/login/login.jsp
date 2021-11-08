<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술장고</title>

  <!-- Favicons -->
<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" sizes="16x16"/>
<link rel="shortcut icon" href="./imgs/favicon.png" type="image/x-icon"/>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>

<!-- 제이쿼리 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
        
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
        
        <!--  j쿼리를 사용하는 스크립트코드 -->
<link href="css/common.css" rel="stylesheet" type="text/css">
        <link href="css/air-datepicker.css" rel="stylesheet" type="text/css">
        <script src="js/air-datepicker.js"></script>
         <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
  
  
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
<link href="css/common.css" rel="stylesheet" type="text/css">
  
  
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
.emailinputst{
	width: 440px;
	/* padding: 10px; */
	font-size: 1.3rem;
	font-family: 'Pretendard-Regular';
	/* margin: 20px; */
	border-bottom: 3px solid #CCCCCC;
	outline:none;
	color: #595959;
}
input:focus {outline:none;}
.inputst:hover {
	border-bottom: 3px solid #3b7bd4;
	color: #3b7bd4;
}
/*플레이스홀더 인풋클릭시 사라지게함*/
/* lastest version */
input::placeholder {              /* Chrome, Safari, Firefox */
  color: #222;
  opacity: 1;
}
input:-ms-input-placeholder {     /* IE, Edge */
  color: #222;   
  opacity: 1;
}
/* old version */
input:focus::-webkit-input-placeholder {
  color: transparent;
}
input:focus::-moz-placeholder {
  color: transparent;
}
input:focus:-ms-input-placeholder {
  color: transparent;
}
input:focus::-ms-input-placeholder {
  color: transparent;
}
input:hover::-webkit-input-placeholder {
  color: #3b7bd4;
}
input:hover::-moz-placeholder {
  color: #3b7bd4;
}
input:hover:-ms-input-placeholder {
  color: #3b7bd4;
}
input:hover::-ms-input-placeholder {
  color: #3b7bd4;
}
.genderdiv{
	display: flex;
	align-items: center;
	flex-direction: row;
	text-align: center;
	flex-wrap: nowrap;
	justify-content: center;
	font-size: 1.3rem;
}
.genderdiv div {
	padding: 20px;
	margin-left: 50px;
	margin-right: 50px;
}
.btnSet div {
	margin: 50px;
}
.genderdiv div input {
	width: 15px;
	height: 15px;
	padding: 50px;
}
.genderdiv label:hover, .genderdiv input[type="radio"]:hover {
	color: #3b7bd4;
}
.genderdiv input[type="radio"]:checked + label:checked {color: #3b7bd4;}
.btn-fill_post{
	font-size: 1.2rem;
	text-align: center;
	padding: 15px;
	/* border: 1px solid rgb(128, 128, 128); */
	border-radius: 30px; 
	/* box-shadow: 1px 1px 1px #575757; */ 
	background-color: #F0F0F0;
	color: #545454;
}
.btn-fill_post:hover {
	cursor: pointer;
	background-color: #EBEBEB;
	color: #000000;
}
.btn-fill_join {
	text-align: center;
	padding: 15px 205px;
	/* border: 1px solid rgb(128, 128, 128); */
	border-radius: 5px; 
	/* box-shadow: 1px 1px 1px #575757; */ 
	font-size: 1.3rem;
	background-color: #F0F0F0;
	color: #545454;
}
.btn-fill_kakao {
	margin-bottom: 50px;
	background-color: #FDDC3F;
	text-align: center;
	padding: 15px 148px;
	/* border: 1px solid rgb(128, 128, 128); */
	border-radius: 5px; 
	/* box-shadow: 1px 1px 1px #575757; */ 
	font-size: 1.3rem;
	color: #545454;
}
.btn-fill_naver {
	margin-bottom: 50px;
	background-color: #00C73C;
	text-align: center;
	padding: 15px 148px;
	/* border: 1px solid rgb(128, 128, 128); */
	border-radius: 5px; 
	/* box-shadow: 1px 1px 1px #575757; */ 
	font-size: 1.3rem;
	color: #545454;
}
.btn-fill_join:hover {
	cursor: pointer;
	background-color: #EBEBEB;
	color: #000000;
}
.btn-fill_kakao:hover {
	cursor: pointer;
	background-color: #E3C42D;
	color: #000000;
}
.btn-fill_naver:hover {
	cursor: pointer;
	background-color: #00A732;
	color: #000000;
}
/*플레이스홀더 인풋클릭시 사라지게함 끝*/
.postinput{
	margin-left: 0px;
	margin-right: 0px;
	padding-left: 0px;
	padding-right: 0px;
}
.loginsessionclass{
	padding-right: 300px;
	padding-top: 10px;
	font-size: 1.1rem;
}
.loginsearch{
	padding-top: 10px;
	font-size: 1.1rem;
}
.loginsearch .loginsearcha{
	margin-left: 20px;
	margin-right: 20px;
}
.loginsearch .loginsearcha:hover{
	color: #666666;
	cursor: pointer;
}
.loginse{
	width: 15px;
	height: 15px;
}
.loginsessionclass input[type="checkbox"] {
	display: none;
}
.loginsessionclass input[type="checkbox"] + label {
	width: 170px; 
	height: 25px;
	cursor: pointer; 
	color: #a8a8a8;
}
.loginsessionclass input[type="checkbox"]:hover + label {
	color: #8c8c8c;
}
.loginsessionclass input[type="checkbox"]:checked + label {
	color: #000000;
	font-weight: bold;
}
#hero .container {
  padding: 0px;
}
</style>
</head>
<body>
  <!-- ======메인시작  ======= -->
	<main id="main">
	
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center" style="margin: 0px auto;">

<div class="container position-relative" style="text-align: center;">
	  <div class="logo">
      <h1 class="logo me-auto me-lg-0">
			<a href='<c:url value="/"/>'>
			<img alt="logo" src="https://i.ibb.co/LSxNSc3/logo.png" style="height: 40px;"/>
			</a>
<!-- 로그인 -->
      </h1>
		</div>
	<div class="contentdiv">
		<form action="login" method="post">
			<div><input class="inputst" type="text" id='mem_email' name="mem_email" placeholder="이메일"/></div>
			<div><input class="inputst" type="password" id='mem_pw' name="mem_pw" placeholder="비밀번호"/></div>
		</form>
		
		<div class="loginsessionclass">
		
			<input type="checkbox" id="loginse" class="loginse" name="loginse" value="auto" onclick="loginchk()">
    		<label for="loginse"><i class="far fa-check-circle"></i> 로그인 상태 유지</label>
		</div>
		<div class="loginsearch">
    		<a href="emailsearch" class="emailsearch"> 이메일 찾기</a> | 
    		<a href="pwsearch" class="pwsearch"> 비밀번호 찾기</a>
		</div>
		<div class="btnSet">
			<div><a class="btn-fill_join" onclick="go_login()">로그인</a></div>
			<div><a class="btn-fill_kakao" href="kakaologin"><img src="https://i.ibb.co/CHR3g1H/kakao.png" alt="카카오로그인" border="0" style="width: 40px; height: 40px; border-radius: 20px; object-fit: cover; margin-right:20px; margin-bottom: 5px;"/>카카오로그인</a></div>
			<div><a class="btn-fill_naver" href="naverlogin"><img src="https://i.ibb.co/rfxj8f6/naver.png" alt="네이버로그인" border="0" style="width: 40px; height: 40px; border-radius: 20px; object-fit: cover; margin-right:20px; margin-bottom: 5px;"/>네이버로그인</a></div>
			<%-- <a class="btn-empty" href='<c:url value="/" />'>취소</a> --%>
			<!-- href='<c:url value="/" />'은 뒤로가기임. -->
		</div>
	</div>
</div>
  </section><!-- End Hero -->
  </main>
	
	<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  j쿼리를 사용하는 스크립트코드 -->
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- daum.net의 지도 api 사용 스크립트 -->
	
	<script type="text/javascript"><!-- 자바스크립트 시작 -->
	

	/* 로그인상태저장 토글  */
	
	function loginchk(){
	   if($('#loginse').is(':checked') == true){
	      $('#loginse i').removeClass();
	      $('#loginse i').addClass('fas fa-check-circle');
	      
	   }else{
	      $('#loginse i').removeClass();
	      $('#loginse i').addClass('far fa-check-circle');
	   }
	}
	
	/* 일반로그인 */
	
	function go_login() {
		var loginse = "";
		if($('#mem_email').val() == ''){
			alert('이메일을 입력하세요!');
			return;
		}else if($('#mem_pw').val() == ''){
			alert('비밀번호를 입력하세요!');
			return;
		}
		if($("input:checkbox[name=loginse]").is(":checked") == true) {
				loginseresult = $('#loginse').val();
			} else {
				loginseresult = null;	
			}
		$.ajax({
			type:'post',
			url : 'login2',
			data : { mem_email:$('#mem_email').val(), mem_pw:$('#mem_pw').val(), loginse: loginseresult },
			success: function ( response ) {
				if(response){
					//목록을 제외한 화면과 회원가입은 홈으로 연결.
					//그외에는 해당 화면을 그대로 노출할수있게.
					location.href = (document.referrer.match(/member/g) 
							|| !document.referrer.match(/list/g))
							? '<c:url value="/"/>' : document.referrer;
					
				}else{
					alert('아이디와 비밀번호가 일치 하지 않습니다!');
				}
			},
			error : function (req,text) {
				alert(text + " : " + req.status);
			}
		});
	}
	
	
	</script>
	<%-- <div class="container">
		<div style="height: 20%">
			<a href='<c:url value="/" />'><img src="imgs/hanul.logo.png"/></a>
		</div>
		<div id="login" style="padding: 25px 0;">
			<form action="" method="post">
				<input type="text" id='userid' placeholder="아이디 입력"/>
				<!-- 비밀번호까지 입력을 하고 엔터키를 입력했을 때 => keypress() js로 처리 예정 -->
				<input type="password" id='userpw' onkeypress="if(event.keyCode == 13 ){go_login();}"
				placeholder="비밀번호 입력"/>
				<a onclick="go_login()" class="btn-fill" style="display: block; margin: auto;
				width: 60%; height: 42px; line-height: 42px; box-shadow: none;">로그인</a>
			</form>
			<hr style="width: 70%; margin: 25px auto;">
			<a class="social" href="naverlogin"><img alt="네이버로그인" src="imgs/naver_login.png"/></a>
			<a class="social" href="kakaologin"><img alt="네이버로그인" src="imgs/kakao_login.png"/></a>
		</div>
	</div>
	<script type="text/javascript">
		function go_login() {
			if($('#userid').val() == ''){
				alert('아이디를 입력하세요!');
				return;
			}else if($('#userpw').val() == ''){
				alert('비밀번호를 입력하세요!');
				return;
			}
			$.ajax({
				type:'post',
				url : 'iotlogin',
				data : { id:$('#userid').val() ,  pw:$('#userpw').val() },
				success: function ( response ) {
					if(response){
						//목록을 제외한 화면과 회원가입은 홈으로 연결.
						//그외에는 해당 화면을 그대로 노출할수있게.
						location.href = (document.referrer.match(/member/g) 
								|| !document.referrer.match(/list/g))
								? '<c:url value="/"/>' : document.referrer;
						
					}else{
						alert('아이디와 비밀번호가 일치 하지 않습니다!');
					}
				},
				error : function (req,text) {
					alert(text + " : " + req.status);
				}
			});
		}
	</script> --%>
	
	
	
	
	
	  <!-- Vendor JS Files -->
  <script src="./vendor/aos/aos.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="./vendor/glightbox/js/glightbox.min.js"></script>
  <script src="./vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="./vendor/php-email-form/validate.js"></script>
  <script src="./vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="./js/main.js"></script>
</body>
</html>