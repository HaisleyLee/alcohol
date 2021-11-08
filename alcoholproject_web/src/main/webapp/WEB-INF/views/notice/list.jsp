<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술장고</title>
<!-- <link rel="stylesheet" href="css/notice/list.css"> -->
<link rel="stylesheet" href="css/notice/noticetotal.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function searchNotice(){
		if($.trim($('#keyword').val()) == ""){
			swal("검색어를 입력해주세요.");
		}else {
			$('form').submit();
		}
	}
</script>
</head>
<body>
<!-- Check : 제목 길어지면 ...처리  -->

<main id="main" class="container d-flex align-items-center col-12">



    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100" style="margin-top: 200px;">
      <div class="row">
        <div class="col-lg-4">



<p>Notice</p>
<a href="notice"><h1>술장고 서비스<br/>공지사항</h1></a>

	<div class="notice_table" style="text-align: center; margin:0px auto; margin-top: 100px;">
				<form method="post" action="notice" id="searchForm">
					<input type="hidden" name="curPage" value="1" />
					<ul class="search" style="text-align: center; margin:0px auto; padding-top: 10px; width: 100%;">
					<li style="padding-top: 10px;">
						<!-- SELECT * FROM WHERE 컬럼명 LIKE '%%' -->
						<select name="search" style="text-align: center; outline:none; border: 0px;">
							<option value="all" ${page.search eq 'all' ? 'selected' : '' }> 전체 </option>
							<option value="title" ${page.search eq 'title' ? 'selected' : '' }> 제목 </option>
							<option value="content" ${page.search eq 'content' ? 'selected' : '' }> 내용 </option>
							<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }> 작성자 </option>
						</select>
					</li>
					<li style="margin: 0px auto; text-align: left;">
						<input class="inputSearch" id="keyword" type="text" name="keyword" value="${page.keyword}" class="w-px300" autocomplete="off" style="width: 100%; text-align: left; outline:none; border: 0px; border-bottom: 1px solid #888888; padding: 10px;"/>
					</li>
					<li style="padding-top: 10px;">
						<a class="btnSearch" onclick="searchNotice()" style="width: 30px; height: 30px; padding: 10px; padding-top: 10px;"><i class="fas fa-search" style="width: 30px; height: 30px;"></i></a>
					</li>
				</ul>
				</form>
			</div>

		</div>
        <div class="col-lg-8">
		
			<table style="text-align: left; color: black; width: 830px;">
				<tr class="no_back" style="border-top: 2px solid #000000; border-bottom: 1px solid #e0e0e0;">
					<td colspan="2" class="w-pct60" style="text-align: center;">제목</td>
					<td class="w-pct10" style="text-align: center;">글쓴이</td>
					<td class="w-pct10" style="text-align: center;">작성일</td>
					<td class="w-pct05" style="text-align: center;">조회</td>
				</tr>
					<c:if test="${empty page}">
						<tr>
							<td colspan="5">작성된 공지글이 없습니다.</td>
						</tr>
					</c:if>
					<!-- 중요 공지사항 넣기 : css 처리 -->
					<c:if test="${!empty list}">
						<c:forEach items="${list}" var="list">
							<tr class="noticeIm" style="border-bottom: 1px solid #d1d1d1;">
								<td style="width: 8%; text-align: center;"><span class="all"><i class="fas fa-star"></i></span></td> 
									<td class="left" style="border-left: none;"><!--제목을 클릭하면 상세 화면으로 볼 수 있게!  -->
										 <a class="underline" href="view.notice?id=${list.id}">${list.title }</a>
										 ${list.filename eq null ?  '' : '<img src="imgs/attachment.png" style="width:16px; height: 16px;"' }
									</td>
									<td class="w-pct05" style="text-align: center;">${list.name}</td>
									<td class="w-pct10" style="text-align: center;"><fmt:formatDate value="${list.writedate}" pattern="yyyy-MM-dd"/></td>
									<td class="w-pct05" style="text-align: center;">${list.readcnt}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${!empty page}">						
						<c:forEach items="${page.list}" var="vo">
							<tr class="notice" style="border-bottom: 1px solid #e0e0e0;">
								<td style="width: 8%;">${vo.no }</td>
								<td class="left" style="border-left: none;"><!--제목을 클릭하면 상세 화면으로 볼 수 있게!  -->
									<c:forEach var="i" begin="1" end="${vo.indent }">
										&nbsp; ${vo.indent eq i ? '<i class="fas fa-angle-double-right"></i>' : '&ensp;' }
									</c:forEach>
									<a class="underline" href="view.notice?id=${vo.id}">${vo.title }</a> ${vo.filename eq null ?  '' : '<i class="fas fa-paperclip"></i>' }
								</td>
								<td class="w-pct05" style="text-align: center;">${vo.name}</td>
								<td class="w-pct10" style="text-align: center;"><fmt:formatDate value="${vo.writedate}" pattern="yyyy-MM-dd"/></td>
								<td class="w-pct05" style="text-align: center;">${vo.readcnt}</td>
							</tr>
						</c:forEach>
					</c:if>
			</table>
			
		
		
		<div>
		<div class="pageSet" style="margin-top: 70px;">
				<jsp:include page="/WEB-INF/views/include/page.jsp" />
		</div>
		<div id="list-top" style="text-align: right;">
			<c:if test="${loginInfo.mem_id eq '1' }" >
				<span><a href="new.notice" class='newbtn'>작성</a></span>
			</c:if>
		</div>
		</div>
	</div>
	
	</div>
	</div>
	</main>
	
	
	
</body>
</html>