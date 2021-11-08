<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- 페이징처리로 각 페이지당 목록번호 만들기 -->
	<div class="page_list">
		<!-- 이전/처음  -->
	<c:if test="${page.curBlock gt 1 }">
		<a class="page_first" title="처음" onclick="go_page(1)"><i class="fas fa-angle-double-left"></i></a>
		<a class="page_prev" title="이전" onclick="go_page(${page.beginPage - page.blockPage})"><i class="fas fa-angle-left"></i></a>
		<!-- <a class="page_prev" title="이전" onclick="go_page(${page.curPage - 1})">바로 이전</a>-->
	</c:if>
	
	<!-- 숫자 클릭해서 목록 넘어가기 -->
	<c:forEach var="no" begin="${page.beginPage}" end="${page.endPage}">
		<c:if test="${no eq page.curPage}"> <!--현재 페이지인 경우  -->
			<span class="page_on">${no}</span>
		</c:if>
		<c:if test="${no ne page.curPage }"> <!--현재 페이지가 아닌 경우  -->
			<a class="page_off" onclick="go_page(${no})">${no}</a>
		</c:if>
	</c:forEach>
	
	<!-- 다음과 마지막 처리 -->
	<c:if test="${page.curBlock lt page.totalBlock}">
		<!--<a class="page_next" title="다음" onclick="go_page(${page.curPage+1})">바로 다음</a>-->
		
		<a class="page_next" title="다음" onclick="go_page(${page.endPage+1})"><i class="fas fa-angle-right"></i></a>
		<a class="page_last" title="마지막" onclick="go_page(${page.totalPage})"><i class="fas fa-angle-double-right"></i></a>
	</c:if>
	</div>
	
	<script type="text/javascript">
		function go_page(page) {
			$('[name=curPage]').val(page);
			$('[name=keyword]').val('${page.keyword}');
			$('form').submit();
		}
	</script>
	<style>
	.page_list span, .page_list a{
		padding: 5px;
		margin: 5px;
		font-size: 15px;
	}
	span:hover, a:hover{
		cursor: pointer;
	}
/* 		.page_next{background : url("imgs/page_next.jpg") center no-repeat; border: 0px;}
		.page_last{background : url("imgs/page_last.jpg") center no-repeat; border: 0px;}
		.page_first{background : url("imgs/page_first.jpg") center no-repeat; border: 0px;}
		.page_prev{background : url("imgs/page_prev.jpg") center no-repeat; border: 0px;} */
	</style>