<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
         <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
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
.inputstselect{
	width: 50px;
	height: 50px;
	font-size: 1.3rem;
	margin: 20px;
	border: 0px;
	border-bottom: 3px solid #CCCCCC;
	outline:none;
	color: #595959;
}
.btn-fill_subs {
	/* text-align: center; */
	padding: 15px 190px;
	/* border: 1px solid rgb(128, 128, 128); */
	border-radius: 5px; 
	/* box-shadow: 1px 1px 1px #575757; */ 
	font-size: 1.3rem;
	background-color: #F0F0F0;
	color: #545454;
}
.btn-fill_subs:hover {
	cursor: pointer;
	background-color: #EBEBEB;
	color: #000000;
}
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
label {
	text-align: left;
}
h3 {
	margin-top: 75px;
}
.btnSet {
	margin: 50px;
}
input:focus {outline:none;}
.inputst:hover {
	border-bottom: 3px solid #3b7bd4;
	color: #3b7bd4;
}
.inputstselect:hover {
	border-bottom: 3px solid #3b7bd4;
	color: #3b7bd4;
	cursor: pointer;
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
#finalcost{
	border-bottom: 0px;
}
</style>
  
</head>
<body>


 <!-- ======메인시작  ======= -->
	<main id="main">
	
<div style="margin-top: 150px;"></div>

	<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100" style="text-align: center;">
	<p>Subscription</p>

<h1>구독 신청</h1>
		<div class="row" style="text-align: center;">
			<div class="col-lg-3"></div>
		        <div class="col-lg-6" style="text-align: center; margin-top: -100px;">
		<form action="subs_insert" method="post">
			<input type="hidden" name="subs_address"/>
			<div>
			<!-- <label for="name">이름</label><br/> -->
			<input type="text" class="inputst" name='name' id='name' placeholder="이름" style="width: 440px;" />
			</div>

			<div>
				<!-- 주소부분 : api사용 예정 -->
				<a class='btn-fill_post' onclick="daum_post()" style="margin-left: 20px;">주소검색</a>
				<!-- 우편번호찾기를 완료시 아래 readonly 인 post, addr 에 입력됨 -->
				<input type="text" name="mem_post" class="inputst postinput" placeholder="우편번호" readonly="readonly" style="width: 320px;"/><br/>
				<input type="text" name="addr" class="inputst postinput" placeholder="주소" readonly="readonly" style="width: 440px; padding-left: 10px;"/>
			
			</div>
			<div><input type="text" name="addr2" class="inputst" placeholder="나머지 주소"/></div>

			<div>
				<select class="inputstselect" name="numberofmonths" id="numberofmonths">
					<c:forEach var="j" begin="1" end="6" step="1" varStatus="status1">
					    <option value="${j}">${j}</option>
					</c:forEach>
				</select>
				<label for="numberofmonths">개월 동안</label>
				<select class="inputstselect" name="numberofdate" id="numberofdate">
					<c:forEach var="i" begin="1" end="31" step="1" varStatus="status2">
					    <option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<label for="numberofdate">일 마다 배송</label>
			</div>
			
			<div><input class="inputst" type="text" name="cardnum" id="cardnum" placeholder="15~16자리 카드번호를 입력하세요" style="width: 440px;"/></div>
			<div><input class="inputst" type="text" name="finalcost2" id="finalcost2" readonly="readonly" placeholder="최종 결제 금액 39000 원" style="width: 440px; text-align: right;"/></div>
			<input class="inputst" type="hidden" name="finalcost" id="finalcost" readonly="readonly" placeholder="39000" style="width: 440px; text-align: right;"/>
		</form>
		<div class="btnSet">
			<a class="btn-fill_subs" onclick="go_subs()">구독신청</a>	
			<%-- <a class="btn-empty" href='<c:url value="/" />'>취소</a> --%>
			<!-- href='<c:url value="/" />'은 뒤로가기임. -->
		</div>
		</div>
		<div class="col-lg-3"></div>
		</div>
	</div>
</main>


	<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  j쿼리를 사용하는 스크립트코드 -->
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- daum.net의 지도 api 사용 스크립트 -->
	
	<script type="text/javascript"><!-- 자바스크립트 시작 -->
	$(document).ready(function(){
		$(document).on('change', '#numberofmonths', function(){
			var numberofmonths = $('#numberofmonths option:selected').val();
			var numberofdate = $('#numberofdate option:selected').val();
			/* alert('numberofmonths : ' + numberofmonths);
			alert('numberofdate : ' + numberofdate); */
			
			var still_cost = 39000;
			/* ----결제요금---- */
            var subs_price = numberofmonths * still_cost;
			/* alert('subs_price  : ' + subs_price ); */
			$('#finalcost2').val("최종 결제 금액 "+subs_price+" 원");
			$('#finalcost').val(subs_price);
			
			
		});
		$(document).on('change', '#numberofdate', function(){
			var numberofmonths = $('#numberofmonths option:selected').val();
			var numberofdate = $('#numberofdate option:selected').val();
			/* alert('numberofmonths : ' + numberofmonths);
			alert('numberofdate : ' + numberofdate); */
			
			var still_cost = 39000;
			/* ----결제요금---- */
            var subs_price = numberofmonths * still_cost;
			/* alert('subs_price  : ' + subs_price ); */
			$('#finalcost2').val("최종 결제 금액 "+subs_price+" 원");
			$('#finalcost').val(subs_price);
		});
		
	}); 
	
	function go_subs() {
		/* alert("numberofmonths : " + $('[name=numberofmonths]').val()+"\nname" + $('[name=name]').val() + "\nmem_post" + $('[name=mem_post]').val()
				+ "\nnumberofdate" + $('[name=numberofdate]').val() + "\ncardnum" + $('[name=cardnum]').val() );
		 */
		if($('[name=name]').val()==''){
			alert('이름을 입력해주세요.');
			$('[name=name]').focus();
		}
		if($('[name=mem_post]').val()==''){
			alert('주소를 입력해주세요');
			$('[name=mem_post]').focus();
		}
		if($('[name=numberofmonths]').val()==''){
			alert('구독할 개월수를 선택해주세요');
			$('[name=numberofmonths]').focus();
		}
		if($('[name=numberofdate]').val()==''){
			alert('배송받고 싶은 날짜를 입력해주세요');
			$('[name=numberofdate]').focus();
		}
		if( $('[name=cardnum]').val() ==''){
			alert('계산에 사용할 카드번호를 입력해주세요');
			$('[name=cardnum]').focus();
		}
		
		$('[name=subs_address]').val( $('[name=addr]').val()+" "+$('[name=addr2]').val() );
		
		
		$('form').submit();
	}
	
	
	//체크항목 입력칸에 키업시 이벤트
	$('.chk').on('keyup', function (e) {
		
		console.log($(this).attr('name'));
		console.log($(this).val());
		/* if($(this).attr('name') == 'id'){
			if(e.keyCode == 13){
				id_check();//id_check();는 아래 쓰려고 정의해놓은 function이름
				return;
			} else {
				$(this).removeClass('chked');
			}
			validate( $(this) );//validate()는 아래 쓰려고 정의해놓은 function이름 
		}*/
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
</body>
</html>