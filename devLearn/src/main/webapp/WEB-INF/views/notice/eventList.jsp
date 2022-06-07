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
			<div class="cmmu-menu list-group px-1">
				<a class="list-group-item list-group-item-action disabled list-group-item-secondary">이벤트</a>
				<a class="list-group-item list-group-item-action" href="#">· 특강</a>
				<a class="list-group-item list-group-item-action" href="#">· 특가</a>
			</div>
			<br>
			<div class="input-group mb-2 input-group-lg mb-3">
				<input type="text" class="form-control" placeholder="검색" aria-label="Username" aria-describedby="basic-addon1">
				<button class="btn btn-outline-secondary px-2" type="button" id="button-addon2">검색</button>
			</div>
		</div>
		
		<div class="contents" style="margin: auto;">
			<div class="col">
				<div class="row row-cols-1 row-cols-md-4 g-3 mb-5">
					<c:forEach var="i" begin="1" end="20">
					  <div class="col">
				    	<div class="card h-80">
							<div class="card-body my-3 mx-2">
								<div class="events_header">
									<div class="events_img mb-4">
										<figure class="figure">
											<img src="resources/img/silprin.png" class="img-fluid" alt="">
										</figure>
									</div>
								</div>
								<p class="card-title">이벤트 제목</p>
								<p class="card-text">할인/특강</p>
							</div>
							<div class="card-body">
								<div class="btn-group" role="group" aria-label="Basic outlined example">
								  <button type="button" class="btn btn-outline-primary">내용보기</button>
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
							<button type="button" onclick="send()" class="btn btn-primary">글 작성</button>
						</td>
					</tr>
				</table>
				
			</div>
		</div>
	</div>
