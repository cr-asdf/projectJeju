<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
	<style>
		.post_info{
			font-size: 0;
    		padding-right: 78px;
		}
		.post_info > li {
			display: inline-block;
   			vertical-align: top;
    		margin: 10px 12px 0 0;
    		font-size: 13px;
    		color: #999;
		}

	</style>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

	
	<!-- body -->
	<div style="margin-top: 100px;">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb" style="margin-bottom: 3%;">
				  <li class="breadcrumb-item"><a href="/">메인화면</a></li>
				  <li class="breadcrumb-item"><a href="/boards/place/list">게시판</a></li>
				  <li class="breadcrumb-item active" aria-current="page">${dto.boardTitle}</li>
				</ol>
			</nav>
			<div>
				<div>
					<div style="display: inline-block;">
						<h1>${dto.boardTitle}</h1>
						<span hidden>${dto.boardNum}</span>
					</div>
					<div style="margin-left: 85%; display: inline-block;">
						<a class="btn btn-primary" href="/boards/update?boardNum=${dto.boardNum}">수정</a>
						<a class="btn btn-danger" href="/boards/list">삭제</a>
					
					</div>
				</div>
				<div>
					<ui class="post_info">
						<li>작성자 : ${dto.userID}</li>
						<li>${dto.boardDate}</li>
						<li>조회 : ${dto.boardHits}</li>
						<li>좋아요 : ${dto.favorite}</li>
					</ui>
				</div>
				<hr />
			</div>
			<div>
				<div style="text-align: center;">
					<span>${dto.boardContents}</span>
				</div>
			</div>
			
			
			
		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>