<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="error" style="height: 300px; margin-top: 200px;">
  <!-- ======메인시작  ======= -->
	<main id="main">
	    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
	<div class="center">
      <div class="row">
      	<div class="col-lg-3"></div>
        <div class="col-lg-6" style="text-align: center; font-size: 16px;">
        <h3>Error!<br/><br/>
		${msg}</h3>
		<h3>내부적인 오류가 발생했습니다.</h3>
		<p>빠른 시일내에 복구시키겠습니다.</p>
		<p>관련 문의사항은 개발자 또는 고객센터로 문의바랍니다.</p>
	</div>
	</div>
	</div>
	</div>
	</main>
</div>
