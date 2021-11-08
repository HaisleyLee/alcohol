<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-cente">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

	  <div class="logo">
      <h1 class="logo me-auto me-lg-0">
			<a href='<c:url value="/"/>'>
			<img alt="logo" src="https://i.ibb.co/LSxNSc3/logo.png" style="height: 40px;"/>
			</a>
      </h1>
		</div>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="./img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li>
          <a href="todays" class="nav-link scrollto">
			<i class="fas fa-glass-whiskey"></i> <b>오늘의 술 추천</b>
		</a>
		</li>
          <li>
			<a href="myalcohol" class="nav-link scrollto">
				            <i class="fas fa-archive"></i> <b>내 술 정보</b>
			</a>
		</li>
          <li>
		 <a href="subs" class="nav-link scrollto">
			<i class="fas fa-shipping-fast"></i> <b>구독하기</b>
		</a>
		</li>
          <li>
		<a href="notice" class="nav-link scrollto">
				<i class="fas fa-bullhorn"></i> <b>공지사항</b>
		</a>
		</li>
		</ul>

          <!--<li><a class="nav-link scrollto" href="#hero">메인화면</a></li>
          <li><a class="nav-link scrollto" href="#about">오늘의 술</a></li>
          <li><a class="nav-link scrollto" href="#menu">Menu</a></li>
          <li><a class="nav-link scrollto" href="#specials">Specials</a></li>
          <li><a class="nav-link scrollto" href="#events">Events</a></li>
          <li><a class="nav-link scrollto" href="#chefs">Chefs</a></li>
          <li><a class="nav-link scrollto" href="#gallery">Gallery</a></li> -->
          <!-- <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li> -->
          <!-- <li><a class="nav-link scrollto" href="#contact">Contact</a></li> -->
        <!-- </ul> -->
        <!-- <i class="bi bi-list mobile-nav-toggle"></i> -->
      

<!-- <a href="#book-a-table" class="book-a-table-btn scrollto d-none d-lg-flex"> -->      
      <!-- </a> -->
	
	
	
	
	<ul>
      <li class="dropdown nav-link scrollto">
                     <c:if test="${not empty sessionScope.loginInfo}">
	<a href="list.chat"><img src="https://i.ibb.co/qpXCBLy/icon-chatbot2.png" style="width:50px; height: 50px; border-radius: 50%;"></a>
						</c:if>
		<c:if test="${empty sessionScope.loginInfo}">
	<a href="list.chat" class="dropbtn"><img src="https://i.ibb.co/GTQbsYB/99999998989.png" style="width:40px; height: 40px; border-radius: 50%;"></a>
		</c:if>
	</li>
	</ul>
	
	
	
			 <ul>
              <li class="dropdown nav-link scrollto">
               <c:if test="${empty sessionScope.loginInfo}">
              <button class="dropbtn"><img src="https://i.ibb.co/tQ09m8w/313213213213222222222222222222222222222222222222.png"></button>
              </c:if>
               <c:if test="${not empty sessionScope.loginInfo}">
				 		<c:if test="${not empty sessionScope.mem_profile_imgpath}">
              				<button class="dropbtn dropbtnloginok"><img src="${sessionScope.mem_profile_imgpath}" onerror='this.src="http://221.156.48.92:8081/alcoholweb/img/profiledefault.jpg"'></button>
             			 </c:if>
               			<c:if test="${empty sessionScope.mem_profile_imgpath}">
              <button class="dropbtn dropbtnloginok"><img src="https://i.ibb.co/6Dxq56j/333333333333.jpg"></button>
              			</c:if>
              </c:if>
                <ul>
                <c:if test="${empty sessionScope.loginInfo}">
                  <li>
                  
                  	  <a href="login">
							            <i class="fas fa-sign-in-alt"></i>
							            <b>로그인</b>
							        </a>
							        </li>
							        <li>
							  <a href="join">
							            <i class="fas fa-user-plus"></i>
							            <b>회원가입</b>
				        		</a>
                  
                  </li>
                  </c:if>
                  
                  <c:if test="${not empty sessionScope.loginInfo}">
                  <li>
                  
                  <a href="logout">
							            <i class="fas fa-sign-out-alt"></i>
							            <b>로그아웃</b>
							        </a>
							        							        </li>
							        <li>
							  <a href="mypage">
							            <i class="fas fa-user-circle"></i>
							            <b>마이페이지</b>
				        		</a>
                  
                  </li>
                  </c:if>
                </ul>
                
                
              </li>
            </ul>
	
	

	
	</nav><!-- .navbar -->
	</div>
	
	<div> </div>
	
  </header><!-- End Header -->