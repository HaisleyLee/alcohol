/**
 * 
 */
 
<!-- 파이어 베이스 초기화 하기 fireBase Web플랫폼 추가시 나옴.  -->
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
	
	var userid = document.getElementById("userid").value;
	var revid = document.getElementById("revid").value;
	var user_ref = 'users/' + userid +"/" + revid;
	var rev_ref = 'users/' + revid+"/" + userid;
	
	//initQnaList();
	initChat();
	


	
	function initChat() {
		firebase.database().ref(user_ref).on('child_added', function(snapshot){
	
				var childKey = snapshot.key;
				var childData = snapshot.val();
				
				console.log(childData.nickname);

				var html = '';
				if(childData.nickname == userid){
					html = rtnHtmlDiv(childData.nickname , childData.msg ,childData.date , 'chatuserdiv')
				}else{
					html = rtnHtmlDiv(childData.nickname , childData.msg ,childData.date, 'chatrevdiv');
				}
			
				$.ajax
				
				$('#chatList').append(html);
				scrollBottom();
	
		
		});
		
	}
	function rtnHtmlDiv(nickname,msg,date,className,imgpath){
		
			var temp_html = '<div class=' + className +'>'
				/* + '<span class="span0">' 
				+ '<img src=\"'+imgpath+'\"/>';
				+ '</span>' */
				+ '<span class="span1">' 
				+ nickname 
				+ '</span>'
				+ '<span class="span2">' 
				+ msg
				+ '</span>'
				+ '<span class="span3">' 
				+ date
				+ '</span>'
				+'</div>';
		return temp_html;
	}
	//메세지 보내기
	function send_msg() {
		send_fb(userid, user_ref);
		send_fb(userid, rev_ref);
		alert('전송 완료!');
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
	
	/* 위는 채팅 js / 아래는 팝업 js */
	
	 $(document).ready(function( $ ){     
    $(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
    $("#popup01").show();   //팝업 오픈
    $("body").append('<div class="backon"></div>'); //뒷배경 생성
    });
    
    $("body").on("click", function(event) { 
         if(event.target.className == 'close' || event.target.className == 'backon'){
            $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
              $(".backon").hide();
        }
      });
 
  });