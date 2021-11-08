<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술장고</title>


<!-- 제이쿼리 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 스윗얼랏2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


  <!-- Favicons -->
<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" sizes="16x16"/>
<link rel="shortcut icon" href="./imgs/favicon.png" type="image/x-icon"/>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	

        <!--  j쿼리를 사용하는 스크립트코드 -->
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
<script>
 // Initialization
    /* $('#my-element').datepicker([options]) */
    // Access instance of plugin
    $('#my-element').data('datepicker')
</script>

<style type="text/css">

.inputst{
	width: 440px;
	padding: 10px;
	font-size: 1.3rem;
	font-family: 'Pretendard-Regular';
	margin: 15px;
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
.btnSet {
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
.btn-fill_email{
	font-size: 1.2rem;
	text-align: center;
	padding: 15px;
	/* border: 1px solid rgb(128, 128, 128); */
	border-radius: 30px; 
	/* box-shadow: 1px 1px 1px #575757; */ 
	background-color: #F0F0F0;	
	color: #545454;
}
.btn-fill_email:hover {
	cursor: pointer;
	background-color: #EBEBEB;
	color: #000000;
}
.btn-fill_join {
	text-align: center;
	padding: 15px 215px;
	/* border: 1px solid rgb(128, 128, 128); */
	border-radius: 5px; 
	/* box-shadow: 1px 1px 1px #575757; */ 
	font-size: 1.3rem;
	background-color: #F0F0F0;
	color: #545454;
}
.btn-fill_join:hover {
	cursor: pointer;
	background-color: #EBEBEB;
	color: #000000;
}
/*플레이스홀더 인풋클릭시 사라지게함 끝*/

</style>
</head>
<body>
	<!-- <h1>join회원가입페이지</h1> -->
	
<!-- <p class="w-pct50 right" style="margin: 0 auto; padding-bottom: 10px">
		*는 필수 입력 항목입니다.
</p> -->
<!-- <div class="content" style="margin-top: 100px;"> -->
  <!-- ======메인시작  ======= -->
	<main id="main">
	
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center" style="margin: 0px auto; margin-top: -30px;">

<div class="container position-relative" style="text-align: center;">
<h1>본인 인증</h1>
		<form action="join2" method="post">
			<input class="inputst" type="hidden" name="joincode" id="joincode"/>
			<input class="inputst" type="hidden" name="mem_birth"/>
			<div><input class="inputst chk" id='mem_email' type="text" name="mem_email" placeholder="이메일" style="width: 340px;"/>
					<a class="btn-fill_email" onclick="go_email()">인증요청</a>
					<br/>유효성검사 <div class="effectiveness-text"></div>
			</div>
			<br/>중복검사 <span class="overlap-text"></span>
			<div><input class="inputst compare" type="text" placeholder="인증번호" style="width: 340px;"/>
					<a class="btn-fill_email" onclick="go_email2()">입력체크</a>
			</div>
			<span class="compare-text"></span>
			<div><input class="inputst" type="text" name="mem_name" placeholder="성명"/></div>
			<div><input type='date' class="datepicker-here inputst" name="mem_birth2" data-position="right top"/></div>
			<!-- <input class="inputst" type="date" name="mem_birth2"/> -->
			<div class='genderdiv'>
				<div><label><input type="radio" name="mem_gender" value="M" checked="checked" style="margin-right: 10px;"/>남</label></div>
				<div><label><input type="radio" name="mem_gender" value="F" style="margin-right: 10px;"/>여</label></div>
			</div>
			<div><input class="inputst" type="text" name="mem_phone" placeholder="휴대폰번호(-없이 숫자만 입력)"/></div>
		</form>
		<div class="btnSet">
			<a class="btn-fill_join" onclick="go_join()">다음</a>	
			<%-- <a class="btn-empty" href='<c:url value="/" />'>취소</a> --%>
			<!-- href='<c:url value="/" />'은 뒤로가기임. -->
		</div>
	</div>
</section>
</main>	
	
	<script type="text/javascript"><!-- 자바스크립트 시작 -->
	var isCertification = false;//인증번호입력확인
	var isOverlap = false;//중복확인
	
	//이메일 중복검사 : 키업
	$(document).ready(function(){
	    $('#mem_email').keyup(function(){
	        if ( $('#mem_email').val().length > 6) {
	            var mem_email = $(this).val();
	            // ajax 실행
	            $.ajax({
	                type : 'POST',
	                url : 'mem_email_check',
	                data:
	                {
	                	mem_email: mem_email
	                },
	                success : function(result) {
	                    //console.log(result);
	                    if (result == "ok") {
	    					//alert('사용 가능한 아이디 입니다.');
	    					$('.overlap-text').text('사용 가능한 아이디 입니다.').css('color','blue');
	    					isOverlap = true;
	    				}else if(result == "no"){
	    					//alert('이미 사용중인 아이디 입니다.');
	    					$('.overlap-text').text('이미 사용중인 아이디 입니다.').css('color','red');
	    					isOverlap = false;
	    				} else {
	    					$('.overlap-text').text('아이디 중복확인중입니다.').css('color','yello');
	    					isOverlap = false;
	    				}
	                }
	            }); // end ajax
	            
	            
	    		console.log($(this).attr('name'));
	    		console.log($(this).val());
	    		if($(this).attr('name') == 'mem_email'){
	    			//내가 입력중인 input이 mem_email임.
	    			/* if(e.keyCode == 13){
	    				//엔터치면
	    				//id_check();//id_check();는 아래 쓰려고 정의해놓은 function이름
	    				//return;
	    			} else {
	    				$(this).removeClass('chked');
	    			} */
	    			validate( $(this) );//validate()는 아래 쓰려고 정의해놓은 function이름
	    		}
	            
	        }
	    }); // end keyup
	});
	
	
	
	function go_join() {
		if($('[name=mem_email]').val()==''){
			/* alert('이메일을 입력해주세요.'); */
			Swal.fire({
				  icon: 'error',
				  title: '다시 확인해주세요!',
				  text: '이메일을 입력해주세요.!',
				});
			$('[name=mem_email]').focus();
		} else if($('[name=mem_name]').val()==''){
			Swal.fire({
				  icon: 'error',
				  title: '다시 확인해주세요!',
				  text: '성명을 입력해주세요.!',
				});
			/* alert('성명을 입력해주세요.'); */
			$('[name=mem_name]').focus();
		} else if($('[name=mem_birth2]').val()==''){
			/* alert('생년월일을 입력해주세요.'); */
			Swal.fire({
				  icon: 'error',
				  title: '다시 확인해주세요!',
				  text: '생년월일을 입력해주세요.!',
				});
			$('[name=mem_birth2]').focus();
		} else if($('[name=mem_phone]').val()==''){
			/* alert('휴대폰번호 를 입력해주세요.'); */
			Swal.fire({
				  icon: 'error',
				  title: '다시 확인해주세요!',
				  text: '휴대폰번호을 입력해주세요.!',
				});
			$('[name=mem_phone]').focus();
		} else if(isCertification == false){
			/* alert('이메일 인증을 진행해주세요.'); */
			Swal.fire({
				  icon: 'error',
				  title: '다시 확인해주세요!',
				  text: '이메일 인증을 진행해주세요.!',
				});
			$('.compare').focus();
		} else {
			$('[name=mem_birth]').val($('[name=mem_birth2]').val().toString());
			/* alert(typeof $('[name=mem_birth2]').val().toString()+"\n"+typeof $('[name=mem_birth]').val()); */
			$('form').submit();
		}
		
	}
	
	//유효성검사
	//체크항목 입력칸에 키업시 이벤트
	$('.chk').on('keyup', function (e) {
		
		console.log($(this).attr('name'));
		console.log($(this).val());
		if($(this).attr('name') == 'mem_email'){
			//내가 입력중인 input이 mem_email임.
			/* if(e.keyCode == 13){
				//엔터치면
				//id_check();//id_check();는 아래 쓰려고 정의해놓은 function이름
				//return;
			} else {
				$(this).removeClass('chked');
			} */
			validate( $(this) );//validate()는 아래 쓰려고 정의해놓은 function이름
		}
	});
	
	function validate( tag ) {
		/* alert("validate tag : " + tag); */
/* 		var str = "";
		for (key in tag) {
		    str += key + "=" + tag[key] + "\n";
		}

		alert("오브젝트변환 str : " + str); */
		//받을 때 tag로 입력 받는다.
		var data = join2.tag_status( tag );
		/* alert(" validate data : " + data); */
		//join. 은 join_check.js스크립트단에서 var join = {} 하고 선언해서 그 안의 값을 불러오는 내용이다.
		
		//join.tag_status은 걸어놓은 join_check.js에서의 function이름이다.
	
/* 		tag.siblings('div').text ( data.desc );
		tag.siblings('div').removeClass();
		tag.siblings('div').addClass( data.code ); */
		//위를 밑의 한줄로 요약
		display_status(tag.siblings('div'), data);
		
	}
	
	function display_status(div, data) {
		div.text(data.desc);
		div.removeClass();
		div.addClass(data.code);
	}
	
	
	//이메일 인증시 인증코드 입력하게하고~
	function go_email() {
		//이메일 인증 클릭시
		var mail = $("#mem_email").val(); //사용자의 이메일 입력값. 
		
		if (mail == "") {
			Swal.fire({
				  icon: 'error',
				  title: '다시 확인하세요!',
				  text: '메일 주소가 입력되지 않았습니다.',
				});
		} else if(isOverlap == false){
			Swal.fire({
				  icon: 'error',
				  title: '다시 확인하세요!',
				  text: '메일 주소가 사용가능한지 중복확인되지 않았습니다.',
				});
		} else {
			/* alert("입력한 메일 주소 : " + mail); */
			Swal.fire({
				  icon: 'info',
				  title: '인증메일 보내는 중..!',
				  text: '잠시 기다려주세요.',
				  showCancelButton: false,
				  showCloseButton: false,
				  showDenyButton: false,
				  showCancelButton: false,
				  showConfirmButton: false
				});
			$.ajax({
				type : 'post',
				url : 'emailsendcode',
				data : {
					mail:mail
					},
				dataType :'text',
				success: function ( data ) {
					/* alert("이메일로보낸난수코드data : " + data); */
					$('#joincode').val(data);
					/* alert("인증번호가 전송되었습니다."); */
					Swal.fire(
							  '인증번호가 전송되었습니다.',
							  '이메일을 확인한 후 인증번호를 입력해주세요',
							  'success'
							);
					$('#mem_email').attr('readonly',true);//사용가능한 아이디는 이제 못 고치게함.
				},error : function (req,text) {
					alert(text + " : " + req.status);
				}
			});
		}
	}
	
	function go_email2() {
		if ($(".compare").val() == $('#joincode').val()) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
			$(".compare-text").text("인증 성공!").css("color", "blue");
			isCertification = true;  //인증 성공여부 check
		} else {
			$(".compare-text").text("불일치!").css("color", "red");
			isCertification = false; //인증 실패
		}
	}
		
	</script>
	
</body>
</html>