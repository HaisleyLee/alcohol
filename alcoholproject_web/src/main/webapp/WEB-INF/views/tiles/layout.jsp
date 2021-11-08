<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>술장고</title>
  <meta content="" name="description"/>
  <meta content="" name="keywords"/>

<!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
  
  <!-- 메인 제외한 css -->
  <!-- <link href="./css/common.css" rel="stylesheet"/> -->

</head>

<body>
	<tiles:insertAttribute name="header"/>
	<!-- header라는 파일을 모든 파일마다 붙인다! 중노동 없앰 -->
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	<div style="width: 100%; height: 100px;"></div>
	<tiles:insertAttribute name="footer"/>
	<%--@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" 넣으면 자동완성 가능--%>

    <!-- Vendor JS Files -->
  <script src="./vendor/aos/aos.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="./vendor/glightbox/js/glightbox.min.js"></script>
  <script src="./vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="./vendor/php-email-form/validate.js"></script>
  <script src="./vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="./js/main.js"></script>
  
  <div id="preloader"></div>
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