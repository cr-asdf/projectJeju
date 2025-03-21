<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>


	<div style="margin-top: 100px;">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<h1>TestCardList</h1>
			<form action="cardlist" id="list_form" class="row row-cols-lg-auto g-3 align-items-center">
				<input type="hidden" name="page" id="pageNum">

			  <div class="col-12">
				<label class="visually-hidden" for="inlineFormSelectPref">test</label>
				<select name="kind" class="form-select" id="inlineFormSelectPref">
				  <option value="k1" ${pager.kind eq 'k1' ? 'selected': ''}>제목</option>
				  <option value="k2" ${pager.kind eq 'k2' ? 'selected': ''}>내용</option>
				  <option value="k3" ${pager.kind eq 'k3' ? 'selected': ''}>위치</option>
				</select>
			  </div>
			  
			<div class="col-12">
				  <input type="text" value="${pager.search}" name="search" class="form-control" id="inlineFormInputGroupUsername" placeholder="검색어 입력">
			  </div>
			
			  <div class="col-12">
				<button type="submit" class="btn btn-primary">검색</button>
			  </div>
			  <div class="btn-group">
				<a href="/boards/list" class="btn btn-outline-primary" aria-current="page"><i class="bi bi-card-list"></i></a>
				<a href="/boards/cardlist" id="cardlist" class="btn btn-outline-primary"><i class="bi bi-border-all"></i></a>
			  </div>
			<select name="searchKind" id="sklist" onchange="change()" class="form-select" id="inlineFormSelectPref 2">
				<option value="sk1" id="sk1" ${pager.searchKind eq 'sk1' ? 'selected': ''}>작성 날짜 순</option>
				<option value="sk2" id="sk2" ${pager.searchKind eq 'sk2' ? 'selected': ''}>즐겨찾기 많은 순</option>
				<option value="sk3" id="sk3" ${pager.searchKind eq 'sk3' ? 'selected': ''}>조회수 많은 순</option>
			</select>
			</form>

			<table class="table table-striped">
				<tbody id="tbody">
						<tr>
							<td>
								<div class="container text-center">
									<div class="row row-cols-3">
										<c:forEach items="${list}" var="i" begin="1" end="9">
											<div class="col" style="padding-left: 7%; padding-bottom: 5%;">
												<div class="card" style="width: 75%;">
													<img src="/resources/images/woojin/flower.png" class="card-img-top">
													<div class="card-body">
													<h5 class="card-title">${i.boardTitle}</h5>
													<p class="card-text">${i.boardDate}</p>
													<h6 class="card-text">조회수 : ${i.boardHits} 즐겨찾기 : ${i.favorite}</h6>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</td>
						</tr>
				</tbody>
			</table>
			<nav aria-label="Page navigation example" style="width: 300px; margin: 0px auto;">
				<ul class="pagination">
				  <li class="page-item">
					<button class="page-link pages" data-page-num="${pager.start-1}" aria-label="Previous">
				  <span aria-hidden="true">&laquo;</span>
				 </button>
			  </li>
			  <c:forEach begin="${pager.start}" end="${pager.end}" var="i">
				  <li class="page-item">
					  <button data-page-num="${i}" class="page-link pages">${i}</button>
				  </li>
			  </c:forEach>
			  <li class="page-item ${pager.endCheck?'disabled':''}" >
				<button class="page-link pages" data-page-num="${pager.end+1}" aria-label="Next">
				  <span aria-hidden="true">&raquo;</span>
				</button>
			  </li>
			</ul>
			  </nav>

		</div>
	</div>


	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
	<script src="/resources/js/boards/list.js"></script>
</body>
</html>