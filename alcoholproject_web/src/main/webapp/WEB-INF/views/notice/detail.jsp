<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/notice/detail.css"> -->
<link rel="stylesheet" href="css/notice/noticetotal.css">
<title>술장고</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
.btnSet a:hover {
	color: #777777;
}
</style>
<script type="text/javascript">

		var prevNum = ${vo.prevNum }
		var nextNum = ${vo.nextNum}
		
		function goprevNum() {
			if(prevNum == 0){
				swal("이전 글이 존재하지 않습니다.");
			}else {
				location.href="view.notice?id="+prevNum
			}
		}
		
		function gonextNum(){
			if(nextNum == 0){
				swal("다음 글이 존재하지 않습니다.");
			}else {
				location.href="view.notice?id="+nextNum
			}
		}

		function gomodify(){
			swal({
			     title: "공지글 수정",
			     text: "해당 공지글을 수정하시겠습니까?",
			     icon: "warning", //"info,success,warning,error" 중 택1
			     buttons: ["NO", "YES"],
			}).then((YES) => {
			     if (YES) {
							location.href="modify.notice?id="+${vo.id}
			     }else {
			    	 return false;
			     }
			});
		}

		function godelete(){
			swal({
			     title: "공지글 삭제",
			     text: "해당 공지글을 삭제하시겠습니까?",
			     icon: "warning", //"info,success,warning,error" 중 택1
			     buttons: ["NO", "YES"],
			}).then((YES) => {
			     if (YES) {
							location.href="delete.notice?id="+${vo.id}
			     }else {
			    	 return false;
			     }
			});
		}
		
</script>
</head>
<body>



<main id="main" class="container d-flex align-items-center col-12">



    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100" style="top: -220px;">
      <div class="row">
        <div>



<p>Notice</p>
<a href="notice"><h1>술장고 서비스<br/>공지사항</h1></a>

	<div class="notice_table" style="text-align: center; margin:0px auto; margin-top: 50px;">
			
		<div class="btnSet">
		<form action="notice" method="post">
			<input type="hidden" name="id" value="${vo.id }" />
			<input type="hidden" name="curPage" value="${page.curPage }" />
			<input type="hidden" name="search" value="${page.search }" />
			<input type="hidden" name="keyword" value="${page.keyword }" />
			<input type="hidden" name="pageList" value="${page.pageList }" />
		</form>
		<!-- 목록/이전/다음글 : 게시물 유무 판단해야함.  -->
			<a onclick="$('form').submit()">목록으로</a>
			<a onclick="goprevNum();">이전 글</a>
			<a onclick="gonextNum();">다음 글</a>
			<c:if test="${loginInfo.mem_id eq '1' }" >
			<div style="text-align: left; margin-top : 20px;">
				<span class="left">
					<a href="reply.notice?id=${vo.id }" >답글 작성</a>
					<a href="new.notice"> 신규 공지 작성</a>
					<a onclick="gomodify();">수정</a>
					<a onclick="godelete();">삭제</a>
				</span>
			</div>
		</c:if>
		</div>
			
	</div>

		</div>
		
		</div>
		
			</div>
			
        <div class="col-lg-8">

<!-- 		<div id="wrap">
			<div class="cate">
				<p><a href="notice" class="notice">[공지사항]</a></p>
			</div> -->
			<div style="margin-top: 100px;"></div>
			
			<div id="notice_content">
				<div id="title">
					${vo.title}
				</div>
				<div>
					<ul>
						<li>작성자 : ${vo.name }</li>
						<li>작성일 : <fmt:formatDate value="${vo.writedate}" pattern="yyyy-MM-dd HH:mm"/></li>
						<li>조회수 : ${vo.readcnt }</li>
					</ul>
				</div>
				<div class="content">
					${fn:replace(vo.content, crlf, '<br />') }
				</div>
				<c:if test="${vo.filename eq null }">
					<span class="attachfile">
						첨부파일이 없습니다.
					</span>
				</c:if>
				<c:if test="${loginInfo eq null && vo.filename ne null }">
					<span class="attachfile">
						첨부파일은 회원만 다운로드 할 수 있습니다.
					</span>
				</c:if>
				<c:if test="${vo.filename ne null && loginInfo ne null}">
					<span class="attachfile">
						<!-- 첨부파일 다운로드처리 필요함 -->
						☽ 첨부파일 : <span class="filename"><a href="download.no?id=${vo.id }">${vo.filename } </a></span>
					</span>
				</c:if>
			</div>

		<hr>
		<!-- 최신 게시물 목록 보여주기 (10개)-->
		<div class="recent">
		
			<table style="text-align: left; color: black; width: 830px;">
				<tr class="no_back" style="border-top: 2px solid #000000; border-bottom: 1px solid #e0e0e0;">
					<td colspan="2" class="w-pct60" style="text-align: center;">제목</td>
					<td class="w-pct10" style="text-align: center;">글쓴이</td>
					<td class="w-pct10" style="text-align: center;">작성일</td>
					<td class="w-pct05" style="text-align: center;">조회</td>
				</tr>
				<c:forEach items="${recent}" var="recent">
					<c:if test="${vo.id eq recent.id }">
						<tr style="background-color: #fff9db;">
							<td style="text-align: left;"> <span>➤</span> <a class="underline" href="view.notice?id=${recent.id }">${recent.title } ${recent.filename eq null ?  '' : '<img src="imgs/attachment.png" style="width:16px; height: 16px;"' }</a></td>
							<td>${recent.name }</td>
							<td><fmt:formatDate value="${recent.writedate}" pattern="yyyy-MM-dd"/></td>
							<td>${recent.readcnt }</td>
						</tr>
					</c:if>
					<c:if test="${vo.id ne recent.id }">
						<tr>
							<td style="text-align: left;"><a class="underline" href="view.notice?id=${recent.id }">${recent.title }</a> ${recent.filename eq null ?  '' : '<img src="imgs/attachment.png" style="width:16px; height: 16px;"' }</td>
							<td>${recent.name }</td>
							<td><fmt:formatDate value="${recent.writedate}" pattern="yyyy-MM-dd"/></td>
							<td>${recent.readcnt }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		<span class="top" onclick="window.scrollTo(0,0);">TOP</span>
		</div>
			</div>

	</main>
</body>
</html>