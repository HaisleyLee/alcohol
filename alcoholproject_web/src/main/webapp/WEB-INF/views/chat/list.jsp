<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅하기</title>
<!-- 제이쿼리 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

  <!-- Favicons -->
<link rel="icon" href="./imgs/favicon.png" type="image/x-icon" sizes="16x16"/>
<link rel="shortcut icon" href="./imgs/favicon.png" type="image/x-icon"/>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>
  <!-- Template Main CSS File -->
  <link href="./css/style.css" rel="stylesheet"/>
<style type="text/css">
/* 스크롤바 */

  #chatList::-webkit-scrollbar {
    width: 10px;
    margin-right: 10px;
  }
  #chatList::-webkit-scrollbar-thumb {
    background-color: #9AACBC;
    border-radius: 10px;
    background-clip: padding-box;
    border: 1px solid transparent;
  }
  #chatList::-webkit-scrollbar-track {
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
  /* 채팅관련 ↓ */


#chatList{
overflow: auto;
background:#B2C7D9;
overflow-y:scroll; width:100%; height:400px; padding:4px; border:1 solid #000000;
padding-left: 20px;
padding-right: 20px;
}
#chatfromList{
background:white;
width:500px; height:300px; padding:4px; border:1 solid #9AACBC;
}

.chatuserdiv{
	text-align:right; margin-top: 15px;
}
.chatuserdiv .span1{
display:block; color:black; font-size: 12px; margin-right: 60px;
}
.chatuserdiv  .span2{
background-color:#FFEB33; display:inline-block; max-width: 200px; min-width:50px; border-radius: 5px; margin: 5px 0px; font-size:16px; padding: 10px; color:black; box-shadow: 1px 1px 3px #9AACBC;
}
.chatuserdiv .span3{
display: block; color:black; margin-bottom:3px; font-size: 12px; margin-right: 60px;
}
.chatuserdiv .span5, .chatuserdiv .span5 img{
display: block; width: 50px; height: 50px; border: 0px; border-radius: 50%; text-align: right; right: 0; float:right; margin-left: 10px; margin-top: -10px;
}

.chatrevdivsupport .span4{
background-color:#ffffff; border: 1px solid #999999; display:inline-block; max-width: 200px; min-width:50px; border-radius: 5px; margin: 5px 0px; font-size:16px; padding: 10px; color:black;
}
.chatrevdiv{
	text-align:left; margin-top: 5px;
}
.chatrevdiv .span1{
display: block; color:black; font-size: 12px; margin-left: 60px;
}
.chatrevdiv .span2{
background-color:#ffffff; display:inline-block; max-width: 200px; min-width:50px; border-radius: 10px; margin: 5px 0px; font-size:16px; padding: 10px; color:black; box-shadow: 1px 1px 3px #9AACBC;
}
.chatrevdiv .span3{
display: block; color:black; margin-bottom:3px; font-size: 12px; margin-left: 60px;
}
.chatrevdiv .span5, .chatrevdiv .span5 img{
display: block; width: 50px; height: 50px; border: 0px; border-radius: 50%; text-align: left; left: 0; float:left; margin-right: 10px; margin-top: -10px;
}

.chatbox{
	border: 1px solid #969696;
	border-radius: 5px;
	padding-top: 20px;
	background:#B2C7D9;
	padding-left: 0px;
	padding-right: 0px;
}
.send{
	text-align: left;
	right: 0px;
}
.send:hover{
	cursor: pointer;
}
.send i{
	margin: 0px auto;
	text-align: center;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: #c9c9c9;
	color: #ffffff;
	padding-top: 7px;
	padding-right: 3px;
}
.send i:hover{
	background: #b5b5b5;
	cursor: pointer;
}
#usermsg{
	outline: none;
	border: 0px;
	width: 92%;
	cursor: text;
}
.textContent{
	border-top: 1px solid #878787;
	padding: 10px;
	background: #ffffff;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}
.botbtn1{
	font-size: 15px;
	padding: 5px;
	margin: 5px;
	background-color: #F6F7F8;
	border-radius: 10px;
	color: #000000;
	box-shadow: 1px 1px 3px #9AACBC;
}
.botbtn1:hover{
	background-color: #000000;
	color: #ffffff;
	cursor: pointer;
}
.msg2divlist, .msg3divlist {
	display: block;
    text-align: center;
	margin: 0px auto;
}
.msg2divlist{
	margin-top: 10px;
	margin-bottom: 10px;
}
.msg3divlist{
	margin-top: 20px;
	margin-bottom: 20px;
}
.supportchat1{
	font-size: 18px;
	padding: 8px;
	margin-top: 10px;
}

</style>
<script type="text/javascript"src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.2.10/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.2.10/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.2.10/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.2.10/firebase-database.js"></script>
</head>
<body>

 <!-- ======메인시작  ======= -->
	<main id="main">

<div class="container" style="text-align: center;">
<div style="margin-top: 70px; padding-top: 70px;"></div>
	<input type="hidden" id="userid" value="${chatInfo.id}" />
	<input type="hidden" id="username" value="${chatInfo.name}" />
	<input type="hidden" id="revid" value="${chatInfo.receiveId}" />
	<input type="hidden" id="imgpath" value="${chatInfo.imgpath}" />
	<input type="hidden" id="receiveimgpath" value="${chatInfo.receiveimgpath}" />
	
<h1 style="margin-bottom: 30px;">고객센터 실시간 상담 채팅</h1>
    <div class="container position-relative text-center">
      <div class="row">
            <div class="col-lg-3">
            <div class="chatfromListtitle" style="text-align: right; right: 0;"><b>상담요청자 목록</b></div>
			<div id="chatfromList" class="chatfromList">
        	</div>
				<!-- 상담원의 경우 상담요청자들 리스트 출력 -->
			
	</div>
	
	
    <div class="col-lg-7 chatbox">
	<div id="chatList" class="chatList"></div>
	<div class="textContent">
		<form onsubmit="return send_msg();" id="subSend">
			<input type="text" id="usermsg" autocomplete="off" class="chk"
				onkeypress="if(event.keyCode==13){return emptyCheck();}" />
				<a class="send"
				onclick=" if(emptyCheck()){ $('#subSend').submit();}"><i class="fas fa-paper-plane" style="width: 30px; height: 30px;"></i></a>
				<!-- <input
				type="button" value="보내기" class="send"
				onclick=" if(emptyCheck()){ $('#subSend').submit();}" /> -->
		</form>
		</div>
	          </div>
			

</div>
</div>
</div>

</main><!-- 메인끝 -->

</body>
<script type="text/javascript">
const firebaseConfig = {
		  apiKey: "AIzaSyAnRM6RWTXKsaTc-GLR4YNO556ilaoJ8XQ",
		  authDomain: "alcohol2021-d0611.firebaseapp.com",
		  databaseURL: "https://alcohol2021-d0611-default-rtdb.firebaseio.com",
		  projectId: "alcohol2021-d0611",
		  storageBucket: "alcohol2021-d0611.appspot.com",
		  messagingSenderId: "38307402729",
		  appId: "1:38307402729:web:b20e89c9b8dce794eff178",
		  measurementId: "G-ZSN4R73J4E"
		};
		
const app = firebase.initializeApp(firebaseConfig);
	/* 초기화 완료 */
	//전역변수 선언.
</script>





<script type="text/javascript">
	//전역변수 선언.
	var cnt = 0;
 	var totalcount = 0;
	var userid = document.getElementById("userid").value;
	var revid = document.getElementById("revid").value;
	var imgpath = document.getElementById("imgpath").value;
	var receiveimgpath = document.getElementById("receiveimgpath").value;
	var botid = "술장고봇";
	
	var user_ref = 'users/' + userid +"/" + revid;
	var rev_ref = 'users/' + revid+"/" + userid;
	var bot_ref = 'users/' + botid+"/" + userid;
	var support_ref = 'users/' + userid;
	
	//initQnaList();
	initChat();
	
	if(userid == "술장고 상담원"){/* 상담요청자들이 여러명일 경우 선택 */
		$('.chatfromListtitle').css({"visivilty":"visible"});
		supportChat();
	} else {
		$('.chatfromListtitle').css({"visibility":"hidden"});
		/* botChat(); */
	}
	function botChat() {
		var msg = '';
		msg = '술장고봇 두둥등장!<br/>원하시는 기능을 선택하시기 바랍니다.';
		var msg2 = '';
		var msg3 = '';
		msg2 = '<span class="botbtn1" onclick="botChat2(1);">이용안내</span>'
		+'<span class="botbtn1" onclick="botChat2(2);">제품정보</span>'
		+'<span class="botbtn1" onclick="botChat2(3);">결제방법</span>'
		+'<span class="botbtn1" onclick="botChat2(4);">환불방법</span>'
		+'<span class="botbtn1" onclick="botChat2(5);">술장고A/S</span>'
		+'<span class="botbtn1" onclick="botChat2(6);">배송지변경</span>';
		msg3 = '<span class="botbtn1 supportchat1" onclick="botChat2(7);">상담사채팅</span>';
		html = rtnHtmlDivbot(msg,msg2,msg3);
		$('#chatList').append(html);
		scrollBottom();
	}
	
 	function botChat2(chatnum) {
		if(chatnum == 1){
			html = rtnHtmlDivbot("술장고는 사용자의 취향에 알맞는 전통주을 추천해주는 서비스입니다.","","");
		} else if(chatnum == 2){
			html = rtnHtmlDivbot("술장고는 현재 6칸으로 이루어진 미니 술 냉장고가 알고리즘에 의해 회전을 통해 술을 추천해주는 서비스를 진행하고 있습니다.","","");
		} else if(chatnum == 3){
			html = rtnHtmlDivbot("서비스 초기단계로 인해 카드결제만 제공하고 있습니다.","","");
		} else if(chatnum == 4){
			html = rtnHtmlDivbot("환불관련하여 안내해드립니다.","","");
		} else if(chatnum == 5){
			html = rtnHtmlDivbot("술장고A/S시 010-0000-0000로 연락주시기 바랍니다.","","");
		} else if(chatnum == 6){
			html = rtnHtmlDivbot("배송지변경은 추후 안내해드리겠습니다.","","");
		} else if(chatnum == 7){
			html = rtnHtmlDivbot("상담사와 연결중입니다. 잠시만 기다려주십시오.","","");
		} else {
			html = rtnHtmlDivbot("잘못된 요청입니다.","","");
		}
		$('#chatList').append(html);
		scrollBottom();
	}


	function initChat() {
		firebase.database().ref(user_ref).on('child_added', function(snapshot){
	
				var childKey = snapshot.key;
				var childData = snapshot.val();
				
				console.log("현재 대화 목록 : " + childData.nickname);

				var html = '';
				if(childData.nickname == userid){
					html = rtnHtmlDiv(childData.nickname , childData.msg ,childData.date , 'chatuserdiv',imgpath)
				}else{
					html = rtnHtmlDiv(childData.nickname , childData.msg ,childData.date, 'chatrevdiv',receiveimgpath);
				}
		
				$('#chatList').append(html);
				++cnt;
				scrollBottom();
				if(userid != "술장고 상담원"){/* 상담요청자들이 여러명일 경우 선택 */
					firebase.database().ref(user_ref).once('value', function(snapshot) { 
				        totalcount = Number(snapshot.numChildren());
						/* alert('Count셈: ' + snapshot.numChildren()); */
				    });
					/* alert("cnt : " + cnt + ", totalcount : " + totalcount); */
					if(cnt == (totalcount)){
						/* alert('botChat진입 '); */
						botChat();
						++cnt;
					}
				}
		});
	}
	
	function supportChat() {

		firebase.database().ref(support_ref).on('child_added', function(snapshot){
			
			var childKey = snapshot.key;
			var childData = snapshot.val();
			
			console.log("상담을 요청한 사람 목록 : " + childKey);//childKey에 요청한 게스트 목록이 담긴다.
			var html = htmlsupport(childKey,'chatrevdivsupport');
		    console.log("상담요청목록 html : " + html);
		    
			$('#chatfromList').append(html);
			scrollBottomsupport();
		});
	}
	function htmlsupport(usernickname, className){
		var temp_html = '<div class='+className+' style="display:block;">'
		+ '<span class="span4"><a href="list.chat?usernickname='
		+ usernickname
		+ '">'
		+ usernickname
		+ '</a></span>'
		+'</div>';
			
		return temp_html;
	}
	function rtnHtmlDiv(nickname,msg,date,className,imgpath){
		
			var temp_html = '<div class=' + className +'>'
				+ '<span class="span1">' 
				+ nickname 
				+ '</span>'
				+ '<span class="span2">' 
				+ msg
				+ '</span><span class="span5"><img src="'
				+ imgpath
				+ '" style="width: 50px; height: 50px; border-radius: 50%;"/></span>'
				+ '<span class="span3">' 
				+ date
				+ '</span>'
				+'</div>';
		return temp_html;
	}
	function rtnHtmlDivbot(msg,msg2,msg3){
		var date = new Date();
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var ampm = hours >= 12 ? '오후' : '오전';
		hours = hours % 12;
		hours = hours ? hours : 12; // the hour '0' should be '12'
		minutes = minutes < 10 ? "0" + minutes : minutes;
		var strTime = ampm + " " + hours + ":" + minutes;
		
		var temp_html = '<div class="chatrevdiv">'
				+ '<span class="span1">술장고봇</span>'
				+ '<span class="span2">'
				+ msg
				+ '</span>'
				+ '<span class="span5"><img src="https://i.ibb.co/28Wpsn4/chatbot.jpg" style="width: 50px; height: 50px; border-radius: 50%;"/></span>'
				+ '<span class="span3">' 
				+ strTime
				+ '</span>'
				+ '<span class="msg2divlist">'
				+ msg2
				+ '</span>'
				+ '<span class="msg3divlist">'
				+ msg3
				+ '</span>'
				+'</div>';
				
		return temp_html;
	}
	
	//메세지 보내기
	function send_msg() {
		send_fb(userid, user_ref);
		send_fb(userid, rev_ref);
		
		scrollBottom();
	}

	function send_fb(userid, ref) {
		var date = rtnDate();
		var msg = document.getElementById('usermsg').value;
		var key = firebase.database().ref().child(ref).push().key;
		var data = {
			nickname : userid,
			msg : msg,
			date : date,
			selected : ''
		}
		var updates = {};
		updates['/' + ref + '/'+ key] = data;
		firebase.database().ref().update(updates);
	};

	//채팅창에 아무것도 입력하지 않은 경우 전송을 막는다.
	function emptyCheck(){
		var val = $('#usermsg').val().trim().length;
		console.log(val);
		if( val == 0 ){
			$('#usermsg').focus();
	
			return false;
		}
		return true;
	};

	function rtnDate(){
		var date = new Date();
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var ampm = hours >= 12 ? '오후' : '오전';
		hours = hours % 12;
		hours = hours ? hours : 12; // the hour '0' should be '12'
		minutes = minutes < 10 ? "0" + minutes : minutes;
		var strTime = ampm + " " + hours + ":" + minutes;
		return strTime;
	}
	function scrollBottom(){
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	function scrollBottomsupport(){
		$('#chatfromList').scrollTop($('#chatfromList')[0].scrollHeight);
	}
	
</script>

</html>