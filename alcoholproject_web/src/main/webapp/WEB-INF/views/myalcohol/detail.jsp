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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
	<!--  위는 유효성검사 js를 걸어주는 스크립트 -->
	<!--  j쿼리를 사용하는 스크립트코드 -->

<style type="text/css">
.kakaosend:hover{
	cursor: pointer;
}
</style>

</head>
<body>
<!-- 세션에 로그인정보 중 아이디가 없으면 로그인하게 이동시킴 -->
<c:if test="${empty loginInfo.mem_id}">
	<script type="text/javascript">
		location.href="/login";
	</script>
</c:if>

  <!-- ======메인시작  ======= -->
<main id="main" class="container">

<div style="width: 10%;"></div>

<div class="content" data-aos="fade-up" data-aos-delay="100">

<div style="width: 100%; height: 100px;"></div>
<div style="width: 100%; height: 100px;"></div>
	
	
	
 <!-- ======= About Section ======= -->
      <div class="container">
		
		
		 <p>My Alcohol Detail</p>
          <h1>내 술 상세보기</h1>
	      
	     <div class="row" style="margin-top: 50px;">
        	
        	<c:if test="${alcheck eq 'T'}">


					<c:if test="${!empty avo}">
	
		            <div class="col-lg-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="230">
					
					<img src="${avo.al_imgpath}" style="height: auto; padding-left: 20%"/>
					
					</div>
        	

				      
	      	<div data-aos="fade-up" data-aos-delay="200" class="col-lg-6 aos-init aos-animate" style="padding-left: 10%;">
            <h1 style="padding-top: 9%; padding-top: 10px;">${avo.al_name}<a class="kakaosend" onclick="sendLink()"><img src="https://i.ibb.co/k1wVgLM/kakao.png" alt="카카오 공유하기" border="0" style="width: 40px; height: 40px; margin-bottom: 10px; margin-left: 10px; border-radius: 50%; object-fit: cover;"></a></h1>
					<table>	
					<tr>
						<th class="w-pct200">양조장</th>
						<td>${avo.al_manufacturer}</td>
					</tr>
					<tr>
						<th>용량</th>
						<td>${avo.al_vol}</td>
					</tr>
					<tr>
						<th>주재료</th>
						<td>${avo.al_material}</td>
					</tr>
					<tr>
						<th>타입</th>
						<td>${al_body} ${al_flavor} ${al_smell} ${al_alcohol_type}</td>
					</tr>
					<tr>
						<th>도수</th>
						<td>${avo.al_real_alcohol_bv}%</td>
					</tr>
					<c:if test="${!empty avo.al_mini_imgpath}">
					<tr>
						<th>미니어처</th>
						<td><img src="${avo.al_mini_imgpath}" style="width: 100px; height: auto;"/></td>
					</tr>
					<tr>
						<th>미니어처 용량</th>
						<td>${avo.al_mini_vol}</td>
					</tr>
					</c:if>
					</table>
          </div>
          
          
          	</c:if>
          	
          	    <c:if test="${empty avo}">
					잘못된 접근입니다.
				</c:if>
          	
          	
			</c:if>
          


		<c:if test="${alcheck eq 'F'}">
			<div class="columnsdiv">
				술장고 내에 술이 없습니다.
			  </div>
		</c:if>
          
          </div>
          
        </div><!-- 컨테이너 -->
	</div>
	</main>
	
	
	
<script type="text/javascript">
	
	Kakao.init("572388775d000eed81ae390d0d566b96");//내코드
	function sendLink() {
	    Kakao.Link.sendDefault({
// 	Kakao.Link.createDefaultButton({
// 	    container: '#create-kakao-link-btn',
	    objectType: 'feed',
	    content: {
	      title: '술장고에서 ${avo.al_name}을 공유하였습니다.',
	      description: '#${al_body} #${al_flavor} #${al_smell} #${al_alcohol_type}',
	      imageUrl:
	        '${avo.al_imgpath}',
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