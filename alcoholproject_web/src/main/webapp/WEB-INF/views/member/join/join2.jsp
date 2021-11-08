<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술장고</title>

<!-- 파비콘 -->
<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" sizes="16x16">
<link rel="shortcut icon" href="./imgs/favicon.png" type="image/x-icon">

<link href="css/common.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/buttoncss.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
        
        <!--  j쿼리를 사용하는 스크립트코드 -->
        <link href="css/air-datepicker.css" rel="stylesheet" type="text/css">
        <script src="js/air-datepicker.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		  <link href="./css/style.css" rel="stylesheet"/>

	
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
    
    </script> <!-- daum.net주소 api에 있는 사용 예제 스크립트 코드 -->
    <script>
 // Initialization
    /* $('#my-element').datepicker([options]) */
    // Access instance of plugin
    $('#my-element').data('datepicker');
</script> <!-- daum.net주소 api에 있는 사용 예제 스크립트 코드 -->


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
	padding: 15px 195px;
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
  <section  class="d-flex" style="margin: 0px auto;">

<div class="container" style="text-align: center;">
<h1>회원가입</h1>
		<form action="join3" method="post" enctype="multipart/form-data">
				<input type="hidden" name="mem_email" value="${vo.mem_email}"/>
				<input type="hidden" name="mem_name" value="${vo.mem_name}"/>
				<input type="hidden" name="mem_birth" value="${vo.mem_birth}"/>
				<input type="hidden" name="mem_gender" value="${vo.mem_gender}"/>
				<input type="hidden" name="mem_phone" value="${vo.mem_phone}"/>
				<input type="hidden" name="mem_address"/>
			<div><!-- 프로필사진 -->
				<label>
					<input type="file" name="file" id='attach-file' style="display: none;">
					<i class="far fa-folder-open file-img" style="display: none;"></i>
					<span id='preview'><img src="https://i.ibb.co/8r95NNC/1111111.png" alt="프로필사진" style="width: 100px; height: 100px; border-radius: 50px; object-fit: cover;"></span>
				<span id='filename' style="display: none;"></span>
				</label>
			</div>
			<div>
			<!-- <a id='delete-file'><i class="fas fa-times"></i></a> -->
			<a id='delete-file' style="margin-left: 120px;"><i class="fas fa-user-times"></i></a>
			</div>
			<div><input class="inputst" type="text" name="mem_nickname" placeholder="닉네임"/></div>
			<div>
				<!-- 주소부분 : api사용 예정 -->
				<a class='btn-fill_post' onclick="daum_post()">주소검색</a>
				<!-- 우편번호찾기를 완료시 아래 readonly 인 post, addr 에 입력됨 -->
				<input type="text" name="mem_post" class="inputst postinput" readonly="readonly" style="width: 80px; text-align: center;"/>
				<input type="text" name="addr" class="inputst postinput" readonly="readonly" style="width: 265px; padding-left: 10px;"/>
			</div>
			<div><input type="text" name="addr2" class="inputst" placeholder="나머지 주소"/></div>
			<div><input class="inputst" type="password" name="mem_pw" placeholder="비밀번호"/></div>
			<div><input class="inputst" type="password" name="mem_pw2" placeholder="비밀번호확인"/></div>
			
			<div>
			<div class="middle">
			
				<div style="font-size: 1.2rem; text-align: left; padding-left: 560px; margin-top: 40px; margin-bottom: 10px;">주류 취향1 : 좋아하는 바디감을 선택해주세요</div>
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
				  
				<div style="font-size: 1.2rem; text-align: left; padding-left: 560px; margin-top: 40px; margin-bottom: 10px;">주류 취향2 : 좋아하는 맛을 선택해주세요</div>
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
				  
				<div style="font-size: 1.2rem; text-align: left; padding-left: 560px; margin-top: 40px; margin-bottom: 10px;">주류 취향3 : 좋아하는 향을 선택해주세요</div>
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
				  
				<div style="font-size: 1.2rem; text-align: left; padding-left: 560px; margin-top: 40px; margin-bottom: 10px;">주류 취향4 : 좋아하는 주종을 선택해주세요</div>
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
				  
				<div style="font-size: 1.2rem; text-align: left; padding-left: 560px; margin-top: 40px; margin-bottom: 10px;">주류 취향5 : 좋아하는 알콜도수를 선택해주세요</div>
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
			</div>
			
			
		</form>
		<div class="btnSet">
			<a class="btn-fill_join" onclick="go_join()">회원가입</a>	
			<%-- <a class="btn-empty" href='<c:url value="/" />'>취소</a> --%>
			<!-- href='<c:url value="/" />'은 뒤로가기임. -->
		</div>
	</div>
	</section>
	</main>
	
	
	<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  j쿼리를 사용하는 스크립트코드 -->
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- daum.net의 지도 api 사용 스크립트 -->
	
	<script type="text/javascript">
	function go_join() {
		/* if($('[name=name]').val()==''){
			alert('이름을 입력해주세요.');
			$('[name=name]').focus();
		} */
		
		
		$('[name=mem_address]').val($('[name=addr]').val()+" "+$('[name=addr2]').val());
		/* alert($('[name=mem_address]').val()); */
		$('form').submit();
	}
	
	
	//체크항목 입력칸에 키업시 이벤트
	$('.chk').on('keyup', function (e) {
		
		console.log($(this).attr('name'));
		console.log($(this).val());
		if($(this).attr('name') == 'id'){
			if(e.keyCode == 13){
				id_check();//id_check();는 아래 쓰려고 정의해놓은 function이름
				return;
			} else {
				$(this).removeClass('chked');
			}
			validate( $(this) );//validate()는 아래 쓰려고 정의해놓은 function이름
		}
	});
	
	function validate( tag ) {
		//받을 때 tag로 입력 받는다.
		var data = join.tag_status( tag );
		//join. 은 join_check.js스크립트단에서 var join = {} 하고 선언해서 그 안의 값을 불러오는 내용이다.
		
		//join.tag_status은 걸어놓은 join_check.js에서의 function이름이다.
	
/* 		tag.siblings('div').text ( data.desc );
		tag.siblings('div').removeClass();
		tag.siblings('div').addClass( data.code ); */
		//위를 밑의 한줄로 요약
		display_status(tag.siblings('div') , data);
		
	}
	
	function display_status(div, data) {
		div.text(data.desc);
		div.removeClass();
		div.addClass(data.code);
	}
	
	//올바른 아이디 입력 형태인지 파악하여 유효하지 않다면 중복확인 불필요
	function id_check() {
		//alert($('input[name=id]').val());
		var $id = $('input[name=id]');
		$.ajax({
			type:'post',
			url : 'id_check',
			data : { id: $id.val()  },
			success: function ( data ) {
				data = join.id_usable(data);
				//join.id_usable은 var join라는 변수 안{}에 id_usable라는 펑션을 갖다씀.
				display_status($id.siblings('div'), data);
				//$('input[name=id]').addClass('chked');
				$id.addClass('chked');
				
				
				
				/* 밑의 코드는 데이터 잘 검증하는지 확인용
				if(data){
					//alert('사용 가능한 아이디 입니다.');
					$('#id_msg').text('사용 가능한 아이디 입니다.').css('color','blue');
				}else{
					//alert('이미 사용중인 아이디 입니다.');
					$('#id_msg').text('이미 사용중인 아이디 입니다.').css('color','red');
				} */
				
			},error : function (req,text) {
				alert(text + " : " + req.status);
			}
		});
	}
	$('#btn-id').on('click', function () {
		id_check();
	});
		
		
/* 		$(function () {
			var today = new Date();
			var endDay = new Date( today.getFullYear()-13 , today.getMonth() , today.getDate()-1);
			$('[name=birth]').datepicker({
				dayNamesMin: ['일','월','화','수','목','금','토' ]
				,dateFormat : 'yy-mm-dd'
				,changeYear : true
				,changeMonth : true
				,showMonthAfterYear : true
				,monthNamesShort:['1월','2월','3월','4월','5월','6월','7월',
					'8월','9월','10월','11월','12월']
				,maxDate: endDay
			});
			
		}); */
		
		function daum_post() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	$('[name=mem_post]').val(data.zonecode);
		        	var address = data.userSelectedType == 'R'
		        				 ? data.roadAddress : data.jibunAddress;
		        	if( data.buildingName != '') address += '(' + data.buildingName + ')';
		        	
		        	$('[name=addr]').eq(0).val( address );
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        }
		    }).open();
		}
		
	</script>
		<script type="text/javascript" src="js/profile_file_check.js"></script>
</body>
</html>