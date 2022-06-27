<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/eventList.css" type="text/css">

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>이벤트</span><br>특강과 특가!</p>
			</div>
		</div>
	</div>
	
	<div class="contentBody container col-11 my-5">
		<div class="sideMenu col-2">
			<div class="card">
				<div class="card-header">
				  공지사항
				</div>
				<a class="list-group-item list-group-item-action " aria-current="true" href="${pageContext.request.contextPath}/notice/notice">· 공지사항</a>
				<a class="list-group-item list-group-item-action active" href="${pageContext.request.contextPath}/notice/eventList">· 이벤트</a>
				<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/faq">· FAQ </a>
				<c:if test="${sessionScope.member.memberEmail != null}">
					<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/mTomInquiry">· 1:1문의 </a>
				</c:if>
			</div>
			
			<div class="card mt-3">
				<div class="card-header">
				  이벤트
				</div>
				<a class="list-group-item list-group-item-action" href="#">· 특강</a>
				<a class="list-group-item list-group-item-action" href="#">· 특가</a>
			</div>
			<br>
			<div class="input-group mb-2 input-group-lg mb-3">
				<input type="text" class="form-control" placeholder="검색" aria-label="Username" aria-describedby="basic-addon1">
				<button class="btn btn-outline-secondary px-1" type="button" id="button-addon2">검색</button>
			</div>
		</div>
		
		<div class="contents container col-9">
			<div class="col">
				<div class="row row-cols-1 row-cols-md-4 g-3 mb-5">
					<c:forEach var="i" begin="1" end="20">
					  <div class="col">
				    	<div class="card h-80">
							<div class="card-body my-1 mx-1">
								<div class="events_header">
									<div class="events_img mb-1">
										<figure class="figure">
											<img src="resources/img/silprin.png" class="img-fluid" alt="">
										</figure>
									</div>
								</div>
								<p class="card-title">이벤트 제목</p>
								<p class="card-text">할인/특강</p>
								<p class="card-time">22/06/06</p>
							</div>
							<div class="card-body">
								<div class="btn-group" role="group" aria-label="Basic outlined example">
								  <button type="button" class="btn btn-outline-primary" href="#">내용보기</button>
								</div>
							</div>
					    </div>
					  </div>
					</c:forEach>
				</div>
				
				<nav aria-label="...">
				  <ul class="pagination justify-content-center">
				    <li class="page-item disabled">
				      <span class="page-link">Previous</span>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item active" aria-current="page">
				      <span class="page-link">2</span>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				</nav>
				
				<table class="table btn-table ">
					<tr>
						<td>
							<c:if test="${sessionScope.member.memberRole eq '99'}">
								<button type="button" onclick="send()" class="btn btn-primary">글 작성</button>
							</c:if>
							<!-- 이건 관리자한테만 보여야 하는건데...	-->
						</td>
					</tr>
				</table>
				
			</div>
		</div>
	</div>
