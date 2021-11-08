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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>

	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	

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

<script type="text/javascript">
var input_mem_pw;
var mem_real_pw;
function go_update() {
if($('[name=input_mem_email]').val().trim()==''){
Swal.fire({
icon: 'error',
title: '본인인증 실패',
text: '입력창에 소셜이메일을 입력해주세요.'
});
$('[name=input_mem_pw]').focus();
} else {
//기존비번과 입력한비번 비교
input_mem_email = $('[name=input_mem_email]').val();
mem_real_email = $('[name=mem_real_email]').val();
if(input_mem_email != mem_real_email){
Swal.fire({
icon: 'error',
title: '본인인증 실패',
text: '비밀번호가 일치하지 않습니다.'
});
} else {
$('form').submit();
}
}	
}
</script>
</head>
<body>
<div class="mypagecontent">
<h1>회원정보수정</h1>

<div class="content">
<h1>본인 인증</h1>
	<div class="contentdiv">
		<form action="socialupdate" method="post">
			<input class="inputst" type="hidden" name="mem_real_email" placeholder="기존이메일" value="${mvo.mem_kakao}"/>
			<div>
				<input class="inputst" type="text" name="input_mem_email" placeholder="소셜이메일 입력"/>
			</div>
		</form>
		본인 확인을 위해 소셜로그인한 이메일을 입력해주세요.
		<div class="btnSet">
			<a class="btn-fill_join" onclick="go_update()">확인</a>
			<%-- <a class="btn-empty" href='<c:url value="/" />'>취소</a> --%>
			<!-- href='<c:url value="/" />'은 뒤로가기임. -->
		</div>
	</div>
</div>
</div>

</body>
</html>