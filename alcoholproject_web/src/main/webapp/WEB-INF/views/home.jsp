<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>술장고</title>
  <meta content="" name="description"/>
  <meta content="" name="keywords"/>

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

</head>

<body>

  <!-- ======= Top Bar ======= -->
<!--   <div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex justify-content-center justify-content-md-between">

      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-phone d-flex align-items-center"><span>+1 5589 55488 55</span></i>
        <i class="bi bi-clock d-flex align-items-center ms-4"><span> Mon-Sat: 11AM - 23PM</span></i>
      </div>

      <div class="languages d-none d-md-flex align-items-center">
      </div>
    </div>
  </div> -->

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
  		<%-- <div class="dropdownparent">
  		
       <c:if test="${empty sessionScope.loginInfo}">
				        
				        
  		<div class="dropdown">
						  <button class="dropbtn"><img src="https://i.ibb.co/tQ09m8w/313213213213222222222222222222222222222222222222.png" id='imgprofile' ></button>
     	</div>
							  <div class="dropdown-content">
							  <a href="login">
							            <i class="fas fa-sign-in-alt"></i>
							            <b>로그인</b>
							        </a>
							  <a href="join">
							            <i class="fas fa-user-plus"></i>
							            <b>회원가입</b>
				        		</a>
						  		</div>
			</c:if>
			<c:if test="${not empty sessionScope.loginInfo}">
				        
  		<div class="dropdown">
				 			<c:if test="${not empty sessionScope.mem_profile_imgpath}">
						  <button class="dropbtn"><img src="${sessionScope.mem_profile_imgpath}" id='imgprofile'></button>
							</c:if>
							<c:if test="${empty sessionScope.mem_profile_imgpath}">
						  <button class="dropbtn"><img src="https://i.ibb.co/6Dxq56j/333333333333.jpg" id='imgprofile'></button>
							</c:if>
     	</div>
							  <div class="dropdown-content">
							  <a href="logout">
							            <i class="fas fa-sign-out-alt"></i>
							            <b>로그아웃</b>
							        </a>
							  <a href="mypage">
							            <i class="fas fa-user-circle"></i>
							            <b>마이페이지</b>
				        		</a>
						  		</div>
			</c:if>
  
</div>
	
	<div>
	</div> --%>
	
	
  <!-- ======메인시작  ======= -->
	<main id="main">
	
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
      <div class="row">
        <div class="col-lg-6">
          <h1>나와 가장 가까운 미니 냉장고<br/><span>술장고</span></h1>
          <br/><br/><h2>전통주를 즐기는 색다른 방법</h2>
          <div class="btns">
            <a href="todays" class="btn-menu animated fadeInUp scrollto">오늘의 술 추천받기</a>
           <!--  <a href="#book-a-table" class="btn-book animated fadeInUp scrollto">술장고</a> -->
          </div>
			
        </div>
        <div class="col-lg-6">
			<img class="rotateimg" src="https://i.ibb.co/gmBg3qk/rotateimgg.png"/>
			

<!--         <div class="col-lg-4 d-flex align-items-center justify-content-center position-relative" data-aos="zoom-in" data-aos-delay="200">
          <a href="https://www.youtube.com/watch?v=GlrxcuEDyF8" class="glightbox play-btn"></a>
        </div> -->
		</div>
      </div>
    </div>
  </section><!-- End Hero -->



    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container swiper-container">
		
		   <div class="row">
                  
            <div class="col-lg-5" style="margin-top: 20%;">
            <div data-aos="fade-up" data-aos-delay="200" style="margin-left: 30%; margin-bottom: 40%;">
            <h1>하루를<br>완벽하게<br>마무리하는 방법</h1>

            <p>편안하게 마시는 한잔.<br/>
				달콤한 와인부터 전통 막걸리까지!<br/>
				당신의 입맛에 가장 어울리는 술을 문 앞까지 보내드립니다.<br/>
				#홈술은_술장고 #애주가 #전통주</p>
			</div>
				<img data-aos="fade-up" data-aos-delay="150" src="https://i.ibb.co/2WxWv8w/dda2795f117241d79afc3ca81cac8235-1440.jpg" alt="" style="width: 100%;">
				
				
         	 </div>
        
            <div class="col-lg-7" data-aos="fade-up" data-aos-delay="270" style="margin-bottom: 10%;">
           	 <img src="https://i.ibb.co/CP8zWR1/fc878c44227d4f4f9308123e56124399-1440.jpg" alt="" style="width: 100%;">
	        
	        <div data-aos="fade-up" data-aos-delay="200" style="padding-top: 10%; padding-left: 20%;">
	            <h1 style="padding-bottom: 0px;">한 달을 가장 특별하게 보내려면</h1>

	            <p>전통주 구독 서비스를 술장고로 시작하세요.</p>
			</div>
	        
	        
	        </div>
		
		

	      
	        <div class="row" style="margin-top: 5%;">
        		
        		<div data-aos="fade-up" data-aos-delay="200" class="col-sm-5" style="padding-left: 3%;">
	            <h1 style="padding-bottom: 0px;">매력적인 구독박스 구성</h1>

	            <p>한 달에 한번씩 나에게 주는 선물입니다.</p>
	         	 </div>
        
        
	            <div class="col-sm-7" data-aos="fade-up" data-aos-delay="270" style="margin-top: 3%; padding-right: 5%;">
	           	 <img src="https://i.ibb.co/D7M1kbC/1097o.jpg" alt="">
		        </div>

	         </div>
	    
	      
	      
	      
	      
	     <div class="row">
        
            <div class="col-lg-7" data-aos="fade-up" data-aos-delay="230" style="margin-top: 10%;">
           	 <img src="https://i.ibb.co/JyVmbBx/d2f074d582874f018974f7456051d836-1440.jpg" alt="" style="width: 100%;">
	        </div>
	      
	      	<div data-aos="fade-up" data-aos-delay="200" class="col-lg-5" style="margin-top: 4px; padding-left: 5%;">
            <h1 style="padding-top: 9%;">술에<br>진심이라면<br>시작하세요.</h1>

            <p>일상 속 소중한 하루를 위해<br/>
				편리한 구독 서비스로<br/>
				집 앞까지 배달되는 술장고 구독을 이용해 보세요!</p>
				
			<div class="btns">
            <a href="subs" class="btn-menu animated fadeInUp scrollto">술장고 구독하기</a>
           <!--  <a href="#book-a-table" class="btn-book animated fadeInUp scrollto">술장고</a> -->
          </div>
          
         	 </div>
         </div>
	      
	     </div>
	      

          
          
        </div><!-- 컨테이너 -->
    </section><!-- End About Section -->



    <!-- ======= Why Us Section ======= -->
  <!--   <section id="why-us" class="why-us">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Why Us</h2>
          <p>Why Choose Our Restaurant</p>
        </div>

        <div class="row">

          <div class="col-lg-4">
            <div class="box" data-aos="zoom-in" data-aos-delay="100">
              <span>01</span>
              <h4>Lorem Ipsum</h4>
              <p>Ulamco laboris nisi ut aliquip ex ea commodo consequat. Et consectetur ducimus vero placeat</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box" data-aos="zoom-in" data-aos-delay="200">
              <span>02</span>
              <h4>Repellat Nihil</h4>
              <p>Dolorem est fugiat occaecati voluptate velit esse. Dicta veritatis dolor quod et vel dire leno para dest</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box" data-aos="zoom-in" data-aos-delay="300">
              <span>03</span>
              <h4> Ad ad velit qui</h4>
              <p>Molestiae officiis omnis illo asperiores. Aut doloribus vitae sunt debitis quo vel nam quis</p>
            </div>
          </div>

        </div>

      </div>
    </section> --><!-- End Why Us Section -->




    <!-- ======= Menu Section ======= -->
    <section id="menu" class="menu section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Popularity List</h2>
          <p>구독 술 인기 리스트 10</p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="menu-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-Takju">탁주</li>
              <li data-filter=".filter-Yakju">약주</li>
              <li data-filter=".filter-soju">소주</li>
              <li data-filter=".filter-fruitWine">과일주</li>
              <li data-filter=".filter-Liqueur">리큐르</li>
            </ul>
          </div>
        </div>

        <div class="row menu-container" data-aos="fade-up" data-aos-delay="200">

			<div class="col-lg-6 menu-item filter-fruitWine">
            <img src="https://i.ibb.co/qr73NvZ/54.jpg" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">시나브로 화이트</a><span>새큼 · 과일향</span>
            </div>
          </div>

          
		  <div class="col-lg-6 menu-item filter-Yakju">
            <img src="https://i.ibb.co/12Mv6B0/50.jpg" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">김천 과하주</a><span>씁쓸 · 뿌리열매향</span>
            </div>
          </div>
          
		  <div class="col-lg-6 menu-item filter-Liqueur">
            <img src="https://i.ibb.co/pzPjqrw/99.jpg" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">영월 동강 더덕주</a><span>씁쓸 · 뿌리열매향</span>
            </div>
          </div>
          
          		  <div class="col-lg-6 menu-item filter-soju">
            <img src="https://i.ibb.co/Fmt62sw/13.png" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">문경바람 오크</a><span>씁쓸 · 과일향</span>
            </div>
          </div>
          
		  <div class="col-lg-6 menu-item filter-soju">
            <img src="https://i.ibb.co/1spTWrz/12.png" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">고운달 오크</a><span>씁쓸 · 뿌리열매향</span>
            </div>
          </div>
		
          <div class="col-lg-6 menu-item filter-Yakju">
            <img src="https://i.ibb.co/DCRrzvY/1.jpg" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">고소리술</a><span>달콤 · 과일향</span>
            </div>
          </div>
          
		  <div class="col-lg-6 menu-item filter-Takju">
            <img src="https://i.ibb.co/kc4TWhj/79.jpg" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">백련 생막걸리 미스티</a><span>새큼 · 곡물향</span>
            </div>
          </div>
          

		  <div class="col-lg-6 menu-item filter-Liqueur">
            <img src="https://i.ibb.co/3mcJNn9/86.jpg" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">한비 쌀소주</a><span>스파이시 · 곡물향</span>
            </div>
          </div>
          
		  <div class="col-lg-6 menu-item filter-Takju">
            <img src="https://i.ibb.co/2ZJR5xx/77.jpg" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">술취한 원숭이</a><span>달콤 · 과일향</span>
            </div>
          </div>
          

			
					  <div class="col-lg-6 menu-item filter-fruitWine">
            <img src="https://i.ibb.co/zf0ch1P/55.png" class="menu-img" alt="">
            <div class="menu-content" style="margin-top: 50px; padding-left: 15px;">
              <a href="#">추사 로제</a><span>새큼 · 과일향</span>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Menu Section -->




    <!-- ======= Specials Section ======= -->
<!--     <section id="specials" class="specials">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Specials</h2>
          <p>Check Our Specials</p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
              <li class="nav-item">
                <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">Modi sit est</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-2">Unde praesentium sed</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-3">Pariatur explicabo vel</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-4">Nostrum qui quasi</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-5">Iusto ut expedita aut</a>
              </li>
            </ul>
          </div>
          <div class="col-lg-9 mt-4 mt-lg-0">
            <div class="tab-content">
              <div class="tab-pane active show" id="tab-1">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Architecto ut aperiam autem id</h3>
                    <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                    <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. Laborum eos ipsum ipsa odit magni. Incidunt hic ut molestiae aut qui. Est repellat minima eveniet eius et quis magni nihil. Consequatur dolorem quaerat quos qui similique accusamus nostrum rem vero</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="./img/specials-1.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-2">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Et blanditiis nemo veritatis excepturi</h3>
                    <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                    <p>Ea ipsum voluptatem consequatur quis est. Illum error ullam omnis quia et reiciendis sunt sunt est. Non aliquid repellendus itaque accusamus eius et velit ipsa voluptates. Optio nesciunt eaque beatae accusamus lerode pakto madirna desera vafle de nideran pal</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="./img/specials-2.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-3">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Impedit facilis occaecati odio neque aperiam sit</h3>
                    <p class="fst-italic">Eos voluptatibus quo. Odio similique illum id quidem non enim fuga. Qui natus non sunt dicta dolor et. In asperiores velit quaerat perferendis aut</p>
                    <p>Iure officiis odit rerum. Harum sequi eum illum corrupti culpa veritatis quisquam. Neque necessitatibus illo rerum eum ut. Commodi ipsam minima molestiae sed laboriosam a iste odio. Earum odit nesciunt fugiat sit ullam. Soluta et harum voluptatem optio quae</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="./img/specials-3.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-4">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Fuga dolores inventore laboriosam ut est accusamus laboriosam dolore</h3>
                    <p class="fst-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro quis delectus</p>
                    <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis quis velit. Eum ex maxime error in consequatur corporis atque. Eligendi asperiores sed qui veritatis aperiam quia a laborum inventore</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="./img/specials-4.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-5">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Est eveniet ipsam sindera pad rone matrelat sando reda</h3>
                    <p class="fst-italic">Omnis blanditiis saepe eos autem qui sunt debitis porro quia.</p>
                    <p>Exercitationem nostrum omnis. Ut reiciendis repudiandae minus. Omnis recusandae ut non quam ut quod eius qui. Ipsum quia odit vero atque qui quibusdam amet. Occaecati sed est sint aut vitae molestiae voluptate vel</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="./img/specials-5.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section> -->
    <!-- End Specials Section -->


    <!-- ======= Events Section ======= -->
  <!--   <section id="events" class="events">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Events</h2>
          <p>Organize Your Events in our Restaurant</p>
        </div>

        <div class="events-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="row event-item">
                <div class="col-lg-6">
                  <img src="./img/event-birthday.jpg" class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0 content">
                  <h3>Birthday Parties</h3>
                  <div class="price">
                    <p><span>$189</span></p>
                  </div>
                  <p class="fst-italic">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                    magna aliqua.
                  </p>
                  <ul>
                    <li><i class="bi bi-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                    <li><i class="bi bi-check-circled"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                    <li><i class="bi bi-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                  </ul>
                  <p>
                    Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                    velit esse cillum dolore eu fugiat nulla pariatur
                  </p>
                </div>
              </div>
            </div>End testimonial item

            <div class="swiper-slide">
              <div class="row event-item">
                <div class="col-lg-6">
                  <img src="./img/event-private.jpg" class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0 content">
                  <h3>Private Parties</h3>
                  <div class="price">
                    <p><span>$290</span></p>
                  </div>
                  <p class="fst-italic">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                    magna aliqua.
                  </p>
                  <ul>
                    <li><i class="bi bi-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                    <li><i class="bi bi-check-circled"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                    <li><i class="bi bi-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                  </ul>
                  <p>
                    Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                    velit esse cillum dolore eu fugiat nulla pariatur
                  </p>
                </div>
              </div>
            </div>End testimonial item

            <div class="swiper-slide">
              <div class="row event-item">
                <div class="col-lg-6">
                  <img src="./img/event-custom.jpg" class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0 content">
                  <h3>Custom Parties</h3>
                  <div class="price">
                    <p><span>$99</span></p>
                  </div>
                  <p class="fst-italic">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                    magna aliqua.
                  </p>
                  <ul>
                    <li><i class="bi bi-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                    <li><i class="bi bi-check-circled"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                    <li><i class="bi bi-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                  </ul>
                  <p>
                    Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                    velit esse cillum dolore eu fugiat nulla pariatur
                  </p>
                </div>
              </div>
            </div>End testimonial item

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section> --><!-- End Events Section -->



    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Review</h2>
          <p>술장고 구독 이용 후기</p>
        </div>

        <div class="testimonials-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">
				
			  <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  색다른 술을 마셔보고는 싶은데 뭘 마셔야 할 지 모르겠다면 추천합니다. 매 달마다 마음에 쏙 드는 술만 보내줘요.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="http://gi.esmplus.com/neoshop512/2019/05/5718/2.jpg" class="testimonial-img" alt="">
                <h3>@color_mine2021</h3>
              </div>
            </div><!-- End testimonial item -->
				
				
            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  전통주 구독 서비스란게 있다길래 지체없이 월 정기 구독 박스를 신청했다.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="http://image.kyobobook.co.kr/newimages/giftshop_new/goods/400/1957/hot1482731163379.jpg" class="testimonial-img" alt="">
                <h3>@jong_97</h3>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  전통주가 막걸리만 있는 줄 알았는데 이렇게 다양한 술이 있는 줄 몰랐습니다.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/2ec9/bc785c3e6356ea6181b5d446bef993e38c2c74ca7d540c4be125b8d4ae1f.jpeg" class="testimonial-img" alt="">
                <h3>@sara_w</h3>
              </div>
            </div><!-- End testimonial item -->


            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  여기서 보내주는 술 마시다 보면 어디 가서 술 모른다는 소리는 잘 안 들어요.^^ 친구들한테도 맛있는 거 몇 개 추천해 줬는데 다들 좋아했어요.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="http://m.ezendolls.com/web/product/big/20200508/5d019df899afefe72606c035319da6de.jpg" class="testimonial-img" alt="">
                <h3>@zoflrxjA</h3>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  구독 1년차에 처음 후기 남겨봅니다. 그 동안 술을 20병을 넘게 받아봤는데 별로인 술도 있었지만 대부분은 만족스러웠습니다. 이제는 달마다 술 받아보는 날이 달마다 기쁨입니다.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="https://i.pinimg.com/736x/62/01/d3/6201d3ef85850322be581387a56ecd82.jpg" class="testimonial-img" alt="">
                <h3>@zofjapf11</h3>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->

    <!-- ======= Gallery Section ======= -->
    <section id="gallery" class="gallery">

      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>chaser</h2>
          <p>안주와 함께하는 전통주</p>
        </div>
      </div>

      <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

        <div class="row g-0">

		 <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="https://i.ibb.co/DCc6gsd/5a2f893241694393b929613fc97d07d2-cr2000073-1030x687.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="https://i.ibb.co/DCc6gsd/5a2f893241694393b929613fc97d07d2-cr2000073-1030x687.jpg" alt="" class="img-fluid" style="margin: 0px; padding: 0px;">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="https://i.ibb.co/PxzsYFC/2a4adbdc4eab4e19995790b14e260839-1030x687.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="https://i.ibb.co/PxzsYFC/2a4adbdc4eab4e19995790b14e260839-1030x687.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="https://i.ibb.co/5YL2Twh/08cf3375a90142c196b41b62f84bcfbd-HUG-2848-1030x687.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="https://i.ibb.co/5YL2Twh/08cf3375a90142c196b41b62f84bcfbd-HUG-2848-1030x687.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="https://i.ibb.co/QYxpNV2/a6ac6333b32a4a11ae983bc2772173ff-385-A9617-1030x687.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="https://i.ibb.co/QYxpNV2/a6ac6333b32a4a11ae983bc2772173ff-385-A9617-1030x687.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

		  <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="https://i.ibb.co/HnSQTFK/e1518078d2274416b36a41eebb41bd7f-HUG-2959-1030x686.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="https://i.ibb.co/HnSQTFK/e1518078d2274416b36a41eebb41bd7f-HUG-2959-1030x686.jpg" alt="" class="img-fluid" style="margin: 0px; padding: 0px;">
              </a>
            </div>
          </div>



          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="https://i.ibb.co/QdRRKQC/69f1bcbee6924ee990b4d78c50118b49-HUG-2633-1030x686.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="https://i.ibb.co/QdRRKQC/69f1bcbee6924ee990b4d78c50118b49-HUG-2633-1030x686.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="https://i.ibb.co/R28ZV5Y/22b77c5ab2b84cbabc88b941bcb929ad-HUG-3503-1030x685.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="https://i.ibb.co/R28ZV5Y/22b77c5ab2b84cbabc88b941bcb929ad-HUG-3503-1030x685.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="https://i.ibb.co/9gQyxZq/0126a6a61f56423388bddfa5e1ec20fc-HUG-3342-1030x686.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="https://i.ibb.co/9gQyxZq/0126a6a61f56423388bddfa5e1ec20fc-HUG-3342-1030x686.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Gallery Section -->

    <!-- ======= Chefs Section ======= -->
 <!--    <section id="chefs" class="chefs">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Chefs</h2>
          <p>Our Proffesional Chefs</p>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="100">
              <img src="./img/chefs/chefs-1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Walter White</h4>
                  <span>Master Chef</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="200">
              <img src="./img/chefs/chefs-2.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Sarah Jhonson</h4>
                  <span>Patissier</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="300">
              <img src="./img/chefs/chefs-3.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>William Anderson</h4>
                  <span>Cook</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section> --><!-- End Chefs Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up" data-aos-delay="130">

        <div class="section-title">
          <h2>Contact</h2>
          <p>찾아오는 곳</p>
        </div>
      </div>

      <div class="container aos-init aos-animate" data-aos="fade-up" data-aos-delay="180">
        <div class="row">
          <div class="col-lg-9" data-aos="zoom-in" data-aos-delay="300" style="margin-top: 10px;">
	        <!-- <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe> -->
	        <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3262.122615494616!2d126.88580701558352!3d35.15356266633607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35718c74aa83080f%3A0xe182b6b69ca7719c!2z7ZWc7Jq47KeB7JeF7KCE66y47ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1635674743610!5m2!1sko!2skr" frameborder="0" allowfullscreen></iframe>
	      </div>
	      
          <!-- <div class="col-md-6"> -->
	      
	      	<div class="col-lg-3" data-aos="fade-up" data-aos-delay="210" style="margin-top: 10px;">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Location:</h4>
                <p>광주광역시 서구 농성1동 경열로 3, 한울직업전문학교</p>
              </div>

              <div class="open-hours">
                <i class="bi bi-clock"></i>
                <h4>Open Hours:</h4>
                <p>
                  Monday-Friday:<br>
                  9:00 AM - 18:00 PM
                </p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>@example.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>Call:</h4>
                <p>+1 5589 55488 55s</p>
              </div>

            </div>

          </div>
	      
	      </div>
	     </div>

    </section><!-- End Contact Section -->



  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">
          
<!--             <div class="col-lg-4 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>
          
            <div class="col-lg-4 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div> -->
          
          
            <div class="footer-info col-lg-12">
              <h3>술장고</h3>
              <p>
술장고(주) 주식회사 대표이사 : 미술랭 사업자등록번호 : 124-81-00998 사업자 정보확인 통신판매업 신고 : 2000-광주서구-0515
<br>
사업장주소 : 광주광역시 서구 농성1동 경열로 3, 한울직업전문학교 | 호스팅서비스사업자 : 한울직업전문학교(주) | 대표번호 : 02-2255-0114 | 제품/서비스/멤버십: 1588-3366 | 구매문의 : 1588-6084
<br>
본 사이트의 컨텐츠는 저작권법의 보호를 받는 바 무단 전재, 복사, 배포 등을 금합니다.
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>

<!--           <div class="col-lg-4 col-md-6 footer-newsletter">

          </div> -->

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Restaurantly</span></strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader">
  </div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  

  <!-- Vendor JS Files -->
  <script src="./vendor/aos/aos.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="./vendor/glightbox/js/glightbox.min.js"></script>
  <script src="./vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="./vendor/php-email-form/validate.js"></script>
  <script src="./vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="./js/main.js"></script>
	
	
	
</body>


</html>