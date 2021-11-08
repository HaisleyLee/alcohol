<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<!-- 파비콘 -->
<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" sizes="16x16">
<link rel="shortcut icon" href="./imgs/favicon.png" type="image/x-icon">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	<!--  j쿼리를 사용하는 스크립트코드 -->
		  <link href="./css/style.css" rel="stylesheet"/>
		  
<style type="text/css">
.qdisplaynone{
	display: none;
}
.qdisplayblock{
	display: block;
}
.btn-fill_next {
	text-align: center;
	padding: 15px 215px;
	border-radius: 5px; 
	/* border: 1px solid rgb(128, 128, 128); */
	/* box-shadow: 1px 1px 1px #575757; */ 
	font-size: 1.3rem;
	background-color: #F0F0F0;
	color: #545454;
}
.btn-fill_next:hover{
	cursor: pointer;
	background-color: #EBEBEB;
	color: #000000;
}
.textdiv{
	/* margin-top: 40px; */
	/* margin-bottom: 60px; */
	font-size: 1.2rem;
	line-height: 200px;
}
.answer1{
	text-align: center;
	padding: 15px;
	border-radius: 5px; 
	background-color: #E7F7FF;
	font-size: 1.1rem;
	color: #545454;
	/* width: 300px; */
	display: block;
}
.inputclass1:hover, .inputclass1:hover+label {
	background-color: #A9E1FF;
	cursor: pointer;
}
.inputclass1:checked, .inputclass1:checked+label {
	background-color: #A9E1FF;
}
.answer2{
	text-align: center;
	padding: 15px;
	border-radius: 5px; 
	background-color: #FFE2EA;
	font-size: 1.1rem;
	color: #545454;
	/* width: 300px; */
	display: block;
}
.inputclass2:hover, .inputclass2:hover+label{
	cursor: pointer;
	background-color: #FF99B4;
}
.inputclass2:checked, .inputclass2:checked+label{
	background-color: #FF99B4;
}
input[type="radio"]:checked, input[type="radio"]:checked+label{
	color: black;
}
.textlabel{
/* 	width: 465px; */
	/* margin-left: 420px; */
	/* margin-right: 50px; */
}
.textdiva{
	display: block;
	width: 300px;
	height: 200px;
}
.btnSet{
	margin-top: 70px;
	margin-bottom: 50px;
}
.textdivq{
	font-size: 1.4rem;
}
.textdivalist{
	display: flex;
	flex-direction: row;
	justify-content: space-between
}
</style>
</head>
<body>
 <!-- ======메인시작  ======= -->
	<main id="main">
	
  <!-- ======= Hero Section ======= -->
  <section  class="d-flex" style="margin: 0px auto; margin-top: 110px;">

<div class="container" style="text-align: center;">

<h1>오늘의 술 추천</h1>
	<div class="contentdiv">
		<form action="todaysreco" method="post">
			<input type="hidden" name="todaysress" id="todaysress" class="todaysress" />
			<input type="hidden" name="idqlist" id="idqlist" class="idqlist" />
			<c:if test="${!empty list}">
				<c:forEach var="vo" begin="0" step="1" items="${list}" varStatus="state">
				<%-- <c:forEach items="${list}" var="vo"> --%>
						<div class="q${state.count} qdisplaynone">
							<div class="textdiv textdivq">${vo.todays_q}</div>
							<div class="textdivalist">
							<div class="textdiv textdiva">
								<input type='radio'
										class='inputclass1' 
								       name='todaysres${state.count}' 
								       value='1'
								       id='a${state.count}' style="display: none;"/>
							<label for='a${state.count}' class="answer1 textlabel">
								${vo.todays_a}
							</label>
								<input type="hidden" name="idq${state.count}" id="idq${state.count}" class="idq${state.count}" value="${vo.todays_id}" />
							</div>
							<div class="textdiva"><span style="font-size: 1.8rem; color: red; font-weight: bold; line-height: 200px;">VS</span></div>
							<div class="textdiv textdiva">
								<input type='radio' 
											class='inputclass2' 
								       name='todaysres${state.count}' 
								       value='2'
								       id='b${state.count}' style="display: none;"/>
							<label for='b${state.count}' class="answer2 textlabel">
								${vo.todays_b}
							</label>
							</div>
							</div>
							<div class="btnSet textdiv">
								<a class="btn-fill_next" onclick="go_next('${state.count}', ${fn:length(list)})">다음</a>	
							</div>
						</div>
				</c:forEach>
			</c:if>
		</form>
	</div>
</div>
</section>
</main>



<script type="text/javascript"><!-- 자바스크립트 시작 -->
$(document).ready(function(){
	$('.q1').removeClass('qdisplaynone');//보이는거 삭제
	$('.q1').addClass('qdisplayblock');//안보이게 추가
});
var qnum;
var qnumtag;
var qnumnexttag;
var lengthlist;
function go_next(qnum, lengthlist) {
	/* alert("diq : "+$(".idq"+qnum).val()); */
	$(".idqlist").val($(".idqlist").val()+"@"+$(".idq"+qnum).val());
	/* alert("diq : "+$(".idqlist").val()); */
/* 	$.ajax({
		type:'post',
		url : 'go_todays_test',
		data : { id: $id.val()  },
		success: function ( data ) {
			data = join.id_usable(data);
			//join.id_usable은 var join라는 변수 안{}에 id_usable라는 펑션을 갖다씀.
			display_status($id.siblings('div'), data);
			//$('input[name=id]').addClass('chked');
			$id.addClass('chked');
			
		},error : function (req,text) {
			alert(text + " : " + req.status);
		}
	}); */
	/* alert("Number(lengthlist)-1 : " + Number(Number(lengthlist)-1)); */
	var todaysrestag = "todaysres"+qnum;
	if($('input[name='+todaysrestag+']:checked').val() == null){
		alert('선택지 중 한 개를 선택해주세요!');
		return false;
	}
	
	if(qnum == Number(Number(lengthlist)-1) ){
		$('.btn-fill_next').text('완료');
		
		qnumtag = ".q"+Number(qnum);
		qnumnexttag = ".q"+(Number(qnum)+Number(1));
		
		
		/* alert("qnumtag : " + qnumtag); */
		$(qnumtag).removeClass('qdisplayblock');//보이는거 삭제
		$(qnumtag).addClass('qdisplaynone');//안보이게 추가
		
		/* alert("qnumnexttag: " + qnumnexttag); */
		$(qnumnexttag).removeClass('qdisplaynone');//안보이게 삭제
		$(qnumnexttag).addClass('qdisplayblock');//보이게 추가
		
		var todaysrestag = "todaysres"+qnum;
		/* alert("$('[name=todaysres]:checked').val() : " + $('input[name='+todaysrestag+']:checked').val()); */
		$(".todaysress").val($(".todaysress").val()+$('input[name='+todaysrestag+']:checked').val());
		
	} else if ( qnum == Number(lengthlist) ){
		/* alert("마지막입니다."); */
		qnumtag = ".q"+Number(qnum);
		qnumnexttag = ".q"+(Number(qnum)+Number(1));
		
		
		/* alert("qnumtag : " + qnumtag); */
		$(qnumtag).removeClass('qdisplayblock');//보이는거 삭제
		$(qnumtag).addClass('qdisplaynone');//안보이게 추가
		
		/* alert("qnumnexttag: " + qnumnexttag); */
		$(qnumnexttag).removeClass('qdisplaynone');//안보이게 삭제
		$(qnumnexttag).addClass('qdisplayblock');//보이게 추가
		
		var todaysrestag = "todaysres"+qnum;
		/* alert("$('[name=todaysres]:checked').val() : " + $('input[name='+todaysrestag+']:checked').val()); */
		$(".todaysress").val($(".todaysress").val()+$('input[name='+todaysrestag+']:checked').val());
		
		$('form').submit();
		
	} else {
		
		/* alert("lengthlist : " + lengthlist); */
		qnumtag = ".q"+Number(qnum);
		qnumnexttag = ".q"+(Number(qnum)+Number(1));
		
		
		/* alert("qnumtag : " + qnumtag); */
		$(qnumtag).removeClass('qdisplayblock');//보이는거 삭제
		$(qnumtag).addClass('qdisplaynone');//안보이게 추가
		
		/* alert("qnumnexttag: " + qnumnexttag); */
		$(qnumnexttag).removeClass('qdisplaynone');//안보이게 삭제
		$(qnumnexttag).addClass('qdisplayblock');//보이게 추가
		
		var todaysrestag = "todaysres"+qnum;
		/* alert("$('[name=todaysres]:checked').val() : " + $('input[name='+todaysrestag+']:checked').val()); */
		$(".todaysress").val($(".todaysress").val()+$('input[name='+todaysrestag+']:checked').val());
		
		/* alert("$(.todaysress).val() : "+$(".todaysress").val()); */
	
		if(qnumtag.equal('.q1')){
			$(qnumtag).removeClass('q1');
		}
	}
}
</script>
</body>
</html>
