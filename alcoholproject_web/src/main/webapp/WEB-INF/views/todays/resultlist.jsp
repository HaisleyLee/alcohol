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

<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
			  <link href="./css/style.css" rel="stylesheet"/>
	
<!--  j쿼리를 사용하는 스크립트코드 -->

<style type="text/css">
.al_div{
	margin-top: 50px;
	margin-bottom: 50px;
}
.al_div div{
	margin: 10px;
}
</style>
</head>
<body>

 <!-- ======메인시작  ======= -->
	<main id="main">
	
  <!-- ======= Hero Section ======= -->
  <section  class="d-flex" style="margin: 0px auto; margin-top: 110px;">

<div class="container" style="text-align: center;">

<h1>오늘의 당신에게 추천하는 술을 공개합니다!</h1>
	<div class="contentdiv">
			<div>
				<div class="al_div">
					<div><img src="${vo.al_imgpath}" style="width: auto; height: 400px; border-radius: 200px;"/></div>
					<div>${vo.al_name}
					<a class="kakaosend" onclick="sendLink()"><img src="https://i.ibb.co/k1wVgLM/kakao.png" alt="카카오 공유하기" border="0" style="width: 40px; height: 40px; margin-bottom: 10px; margin-left: 10px; border-radius: 50%; object-fit: cover;"></a>
					</div>
				</div>
			</div>
	</div>
</div>

</section>

</main>
<script type="text/javascript">

Kakao.init("572388775d000eed81ae390d0d566b96");//내코드
function sendLink() {
    Kakao.Link.sendDefault({
//	Kakao.Link.createDefaultButton({
//	    container: '#create-kakao-link-btn',
    objectType: 'feed',
    content: {
      title: '술장고에서 ${vo.al_name}을 공유하였습니다.',
      description: '#${al_body} #${al_flavor} #${al_smell} #${al_alcohol_type}',
      imageUrl:
        '${vo.al_imgpath}',
      link: {
        mobileWebUrl: 'http://221.156.48.92:8081/alcoholweb/myalcoholdetail?al_id=${avo.al_id}',
        webUrl: 'http://221.156.48.92:8081/alcoholweb/myalcoholdetail?al_id=${avo.al_id}',
      },
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'http://221.156.48.92:8081/alcoholweb/myalcoholdetail?al_id=${avo.al_id}',
          webUrl:'http://221.156.48.92:8081/alcoholweb/myalcoholdetail?al_id=${avo.al_id}',
        },
      },
/* 	      {
        title: '앱으로 보기',
        link: {
          mobileWebUrl: '${url}',
          webUrl:'${url}',
        }, 
      },*/
    ],
  })
    }

</script>
</body>
</html>