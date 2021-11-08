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
<!-- 파비콘 -->
<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" sizes="16x16">
<link rel="shortcut icon" href="./imgs/favicon.png" type="image/x-icon">
        <!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 스윗얼랏2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<link href="css/common.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/buttoncss.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
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
        <link rel="stylesheet" href="css/buttoncss.css">
          <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>

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

        <!--  j쿼리를 사용하는 스크립트코드 -->
        <link href="css/air-datepicker.css" rel="stylesheet" type="text/css">
        <script src="js/air-datepicker.js"></script>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script type="text/javascript" src="js/profile_file_check.js"></script>
		<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <!--  j쿼리를 사용하는 스크립트코드 -->
        <link href="css/air-datepicker.css" rel="stylesheet" type="text/css">
        <script src="js/air-datepicker.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		  <link href="./css/style.css" rel="stylesheet"/>
       
       
       
       <script type="text/javascript">
      	/* new daum.Postcode({
    	    oncomplete: function(data) {
    	    }
    	}).open(); */

	$('#my-element').data('datepicker');
       
       </script>
       
       
<style type="text/css">
body {
	width: 1140px;
}
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
	font-size: 1.3rem;
	font-family: 'Pretendard-Regular';
	border-bottom: 3px solid #CCCCCC;
	outline:none;
	color: #595959;
}
input:focus {outline:none;}
.inputst:hover {
	border-bottom: 3px solid #3b7bd4;
	color: #3b7bd4;
}
#mem_email {
	border-bottom: 3px solid #000000;
	color: #000000;
}
#mem_email:hover {
	border-bottom: 3px solid #000000;
	color: #000000;
}
input::placeholder {
  color: #222;
  opacity: 1;
}
input:-ms-input-placeholder {
  color: #222;   
  opacity: 1;
}
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
	border-radius: 30px; 
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
	border-radius: 5px; 
	font-size: 1.3rem;
	background-color: #F0F0F0;
	color: #545454;
}
.btn-fill_join:hover {
	cursor: pointer;
	background-color: #EBEBEB;
	color: #000000;
}
.postinput{
	margin-left: 0px;
	margin-right: 0px;
	padding-left: 0px;
	padding-right: 0px;
}
#delete-file:hover{
	cursor: pointer;
	color: #858585;
}
form p{
	text-align: center;
	font-size: 0.8rem; 
	margin-bottom: -10px;
	padding-bottom: -10px;
	
}
.genderdiv input[type=radio] {
	display: inline-block;
}
</style>
</head>
<body>
  <!-- ======메인시작  ======= -->
	<main id="main">
	
  <!-- ======= Hero Section ======= -->
  <section  class="d-flex" style="margin: 0px auto;">

<div class="container" style="text-align: center;">
<h1>카카오 회원 추가 정보 기입</h1>
		<form action="socialupdatego" method="post" enctype="multipart/form-data">
			<input class="inputst" type="hidden" name="mem_birth" value="${!empty vo.mem_birth ? vo.mem_birth : '' }" style="margin-top: 50px;"/>
			
			
				<input type="hidden" name="mem_address"/>
				<input type="hidden" name="real_mem_profile_imgpath" value="${!empty vo.mem_profile_imgpath ? vo.mem_profile_imgpath : '' }"/>
				<input type="hidden" name="mem_kakao_id" value="${!empty vo.mem_kakao_id ? vo.mem_kakao_id : '' }"/>
			<div style="margin-top: 50px;">처음 술장고에 로그인하셨군요.
			추가정보를 위해 폼을 작성해주시기 바랍니다.</div>
			<div style="margin-top: 50px;"><!-- 프로필사진 -->
				<label>
					<input type="file" name="file" id='attach-file' style="display: none;">
					<i class="far fa-folder-open file-img" style="display: none;"></i>
					<span id='preview'><img src="${!empty vo.mem_profile_imgpath ? vo.mem_profile_imgpath : 'https://i.ibb.co/8r95NNC/1111111.png' }" alt="프로필사진" style="width: 100px; height: 100px; border-radius: 50px; object-fit: cover;"></span>
				<span id='filename' style="display: none;"></span>
				</label>
			</div>
			<div>
			<a id='delete-file' style="margin-left: 120px;"><i class="fas fa-user-times"></i></a>
			</div>
			<div><p>이메일</p></div><div><input class="inputst" id='mem_email' type="text" placeholder="이메일" name="mem_email" value="${vo.mem_kakao}" readonly="readonly"/></div>
			<div><p>성명</p></div><div><input class="inputst" type="text" name="mem_name" value="${!empty vo.mem_name ? vo.mem_name : '' }" placeholder="성명"/></div>
			<div><p>닉네임</p></div><div><input class="inputst" type="text" name="mem_nickname" value="${!empty vo.mem_kakao_nickname ? vo.mem_kakao_nickname : '' }" placeholder="닉네임"/></div>
			<div><p>생년월일</p></div><div><input type='date' class="datepicker-here inputst" name="mem_birth2" data-position="right top"/></div>
			<div><p>성별</p></div><div class='genderdiv'>
				<div><label><input type="radio" name="mem_gender" value="M" ${mvo.mem_gender eq 'M' ? 'checked' : '' }/>남</label></div>
				<div><label><input type="radio" name="mem_gender" value="F" ${mvo.mem_gender eq 'F' ? 'checked' : '' }/>여</label></div>
			</div>
			<div><p>휴대폰번호(-없이 숫자만 입력)</p></div><div><input class="inputst" type="text" name="mem_phone" placeholder="휴대폰번호(-없이 숫자만 입력)" value="${!empty vo.mem_phone ? vo.mem_phone : '' }"/></div>
				<div>
				<p>주소</p><a class='btn-fill_post' onclick="daum_post()">주소검색</a>
				<input type="text" name="mem_post" class="inputst postinput" readonly="readonly" value="${!empty mvo.mem_post ? mvo.mem_post : '' }" style="width: 80px; text-align: center;"/>
				<input type="text" name="addr" class="inputst postinput" readonly="readonly" value="${!empty vo.mem_address ? vo.mem_address : '' }" style="width: 265px; padding-left: 10px;"/>
				</div>
			<div><input type="text" name="addr2" class="inputst" placeholder="나머지 주소"/></div>
			
			
			<div class="middle">
			
				<div style="font-size: 1.2rem; text-align: left; margin-left: 70px; margin-top: 40px; margin-bottom: 10px;">주류 취향1 : 좋아하는 바디감을 선택해주세요</div>
				<div>
				<label><input type="radio" name="mem_body" class="LightBody" value="1">
				  <a class="btn">
				    가벼움
				  </a></label>
				<label><input type="radio" name="mem_body" class="MidiumBody" value="2">
				  <a class="btn">
				    중간
				  </a></label>
				<label><input type="radio" name="mem_body" class="FullBody" value="3">
				  <a class="btn">
				    무거움
				  </a></label>
				  </div>
				  
				<div style="font-size: 1.2rem; text-align: left; margin-left: 70px; margin-top: 40px; margin-bottom: 10px;">주류 취향2 : 좋아하는 맛을 선택해주세요</div>
				<div>
				<label><input type="radio" name="mem_flavor" class="sweet" value="9">
				  <a class="btn">
				    달콤
				  </a></label>
				<label><input type="radio" name="mem_flavor" class="acidity" value="10">
				  <a class="btn">
				    새큼
				  </a></label>
				<label><input type="radio" name="mem_flavor" class="bitter" value="11">
				  <a class="btn">
				    씁쓸
				  </a></label>
				<label><input type="radio" name="mem_flavor" class="salty" value="12">
				  <a class="btn">
				    짠맛
				  </a></label>
				<label><input type="radio" name="mem_flavor" class="spicy" value="13">
				  <a class="btn">
				    스파이시
				  </a></label>
				  </div>
				  
				<div style="font-size: 1.2rem; text-align: left; margin-left: 70px; margin-top: 40px; margin-bottom: 10px;">주류 취향3 : 좋아하는 향을 선택해주세요</div>
				<div>
				<label><input type="radio" name="mem_smell" class="fruit" value="14">
				  <a class="btn">
				    사과향
				  </a></label>
				<label><input type="radio" name="mem_smell" class="root" value="15">
				  <a class="btn">
				    삼나무향
				  </a></label>
				<label><input type="radio" name="mem_smell" class="grain" value="16">
				  <a class="btn">
				    쌀향
				  </a></label>
				<label><input type="radio" name="mem_smell" class="plant" value="17">
				  <a class="btn">
				    연꽃향
				  </a></label>
				  </div>
				  
				<div style="font-size: 1.2rem; text-align: left; margin-left: 70px; margin-top: 40px; margin-bottom: 10px;">주류 취향4 : 좋아하는 주종을 선택해주세요</div>
				<div>
				<label><input type="radio" name="mem_alcohol_type" class="Takju" value="4">
				  <a class="btn">
				    탁주
				  </a></label>
				<label><input type="radio" name="mem_alcohol_type" class="Liqueur" value="5">
				  <a class="btn">
				    리큐르
				  </a></label>
				<label><input type="radio" name="mem_alcohol_type" class="Yakju" value="6">
				  <a class="btn">
				    약주
				  </a></label>
				<label><input type="radio" name="mem_alcohol_type" class="soju" value="7">
				  <a class="btn">
				    소주
				  </a></label>
				<label><input type="radio" name="mem_alcohol_type" class="fruitWine" value="8">
				  <a class="btn">
				    과일와인
				  </a></label>
				  </div>
				  
				<div style="font-size: 1.2rem; text-align: left; margin-left: 70px; margin-top: 40px; margin-bottom: 10px;">주류 취향5 : 좋아하는 알콜도수를 선택해주세요</div>
				<div>
				<label><input type="radio" name="mem_alcohol_bv" class="bv1" value="18">
				  <a class="btn">
				    0-10%
				  </a></label>
				<label><input type="radio" name="mem_alcohol_bv" class="bv2" value="19">
				  <a class="btn">
				    10-20%
				  </a></label>
				<label><input type="radio" name="mem_alcohol_bv" class="bv3" value="20">
				  <a class="btn">
				    20-30%
				  </a></label>
				<label><input type="radio" name="mem_alcohol_bv" class="bv4" value="21">
				  <a class="btn">
				    30-40%
				  </a></label>
				  </div>
				  
			</div>
			
			
			
		</form>
		<div class="btnSet">
			<a class="btn-fill_join" onclick="go_update()">입력 완료</a>	
		</div>
	</div>

	</section>
	</main>
	

	
	<script type="text/javascript">
	
	function go_update() {
			$('[name=mem_birth]').val($('[name=mem_birth2]').val().toString());
			if($('[name=mem_post]').val().trim().toString() != ""){
				$('[name=mem_address]').val($('[name=addr]').val()+" "+$('[name=addr2]').val());
			}
			/* $('[name=mem_pw]').val($('[name=mem_pw]').val().trim().toString()); */
			/* alert("비번 : " + $('[name=mem_pw]').val()); */
			$('form').submit();
	}
	
	//체크항목 입력칸에 키업시 이벤트
	$('.chk').on('keyup', function (e) {
		
		console.log($(this).attr('name'));
		console.log($(this).val());
		if($(this).attr('name') == 'id'){
			if(e.keyCode == 13){
				id_check();
				return;
			} else {
				$(this).removeClass('chked');
			}
			validate( $(this) );
		}
	});
	
	function validate( tag ) {
		var data = join.tag_status( tag );
		display_status(tag.siblings('div') , data);
		
	}
	
	function display_status(div, data) {
		div.text(data.desc);
		div.removeClass();
		div.addClass(data.code);
	}
	
	function id_check() {
		var $id = $('input[name=id]');
		$.ajax({
			type:'post',
			url : 'id_check',
			data : { id: $id.val()  },
			success: function ( data ) {
				data = join.id_usable(data);
				display_status($id.siblings('div'), data);
				$id.addClass('chked');
				
			},error : function (req,text) {
				alert(text + " : " + req.status);
			}
		});
	}
	$('#btn-id').on('click', function () {
		id_check();
	});
	

	
	function daum_post(){

	   	
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	$('[name=mem_post]').val(data.zonecode);
	        	var address = data.userSelectedType == 'R'
	        				 ? data.roadAddress : data.jibunAddress;
	        	if( data.buildingName != '') address += '(' + data.buildingName + ')';
	        	
	        	$('[name=addr]').eq(0).val( address );
	        }
	    }).open();
	}

</script>
<script type="text/javascript" src="js/profile_file_check.js"></script>
</body>
</html>