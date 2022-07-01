<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lectures.css" type="text/css">

<div class="container mb-5 pt-5">
	<div class="contents">
		<aside class="sidebar col-2 px-4">
			<ul class="nav-links">
				<li>
					<a href="#">
						<span class="link-name">전 체</span>
					</a>
				</li>
				<li>
					<div class="icon-link">
						<a href="#">
							<span class="link-name">개발 · 프로그래밍</span>
						</a>
						<i class="fas fa-angle-down"></i>
					</div>
					<ul class="sub-menu">
						<li><a class="link_name" href="#">개발 · 프로그래밍</a></li>
						<li><a href="#">ALL</a></li>
						<li><a href="#">웹 개발</a></li>
						<li><a href="#">프론트 엔드</a></li>
						<li><a href="#">백 엔드</a></li>
						<li><a href="#">풀 스택</a></li>
						<li><a href="#">프로그래밍 언어</a></li>
						<li><a href="#">알고리즘 · 자료구조</a></li>
					</ul>
				</li>
				<li>
					<div class="icon-link">
						<a href="#">
							<span class="link-name">보안 · 네트워크</span>
						</a>
						<i class="fas fa-angle-down"></i>
					</div>
					<ul class="sub-menu">
						<li><a class="link_name" href="#">보안 · 네트워크</a></li>
						<li><a href="#">ALL</a></li>
						<li><a href="#">보안</a></li>
						<li><a href="#">시스템</a></li>
						<li><a href="#">클라우드</a></li>
						<li><a href="#">블록체인</a></li>
					</ul>
				</li>
				<li>
					<div class="icon-link">
						<a href="#">
							<span class="link-name">데이터 사이언스</span>
						</a>
						<i class="fas fa-angle-down"></i>
					</div>
					<ul class="sub-menu">
						<li><a class="link_name" href="#">데이터 사이언스</a></li>
						<li><a href="#">ALL</a></li>
						<li><a href="#">데이터 분석</a></li>
						<li><a href="#">인공 지능</a></li>
						<li><a href="#">데이터 시각화</a></li>
						<li><a href="#">데이터 수집 · 처리 </a></li>
					</ul>
				</li>
				<li>
					<div class="icon-link">
						<a href="#">
							<span class="link-name">크리에이티브</span>
						</a>
						<i class="fas fa-angle-down"></i>
					</div>
					<ul class="sub-menu">
						<li><a class="link_name" href="#">크리에이티브</a></li>
						<li><a href="#">ALL</a></li>
						<li><a href="#">CAD · 3D 모델링</a></li>
						<li><a href="#">프론트 엔드</a></li>
						<li><a href="#">백 엔드</a></li>
						<li><a href="#">풀 스택</a></li>
						<li><a href="#">프로그래밍 언어</a></li>
						<li><a href="#">알고리즘 · 자료구조</a></li>
					</ul>
				</li>
			</ul> 
		</aside>
		<div class="d-flex flex-column bd-highlight mb-3">
			<div class="searchSection row align-items-center pb-5">
				<div class="col dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
						필터
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="#">유료</a></li>
						<li><a class="dropdown-item" href="#">무료</a></li>
						<li><a class="dropdown-item" href="#">할인중</a></li>
					</ul>
				</div>
				<div class="col d-flex justify-content-end">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="width:50%;">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</div>					
			</div>
			<div class="col">
				<div class="row row-cols-1 row-cols-md-4 g-4 mb-5">
					<c:forEach var="dto" items="${list}">
						<div class="col">
							<div style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/lectures/detail?lectureNum=${dto.lectureNum}';">
								<div class="card border-light" style="cursor:pointer;">
									<img src="${pageContext.request.contextPath}/uploads/thumbNail/${dto.Thumbnail}" class="card-img-top" alt="...">
									<div class="card-body">
										<div class="card-title">${dto.lectureSubject}</div>
										<div class="instructor">${dto.memberNickname}</div>
										<div class='RatingStar'>
											<div class='RatingScore'>
												<div class='outer-star'>
													<div class='inner-star'>
													</div>
												</div>
											</div>
										</div>
										<div class="Price">${dto.lecturePrice}</div>
										<div class="tags row row-cols-4 d-flex justify-content-start gap-1 py-2">
											<span class="tag col">+100명</span>
											<span class="tag col">업데이트</span>
											<span class="tag col">할인중</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				
				<nav aria-label="...">
					<div class="pagination justify-content-center page-box">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
				  	</div>
				</nav>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
let angle = document.querySelectorAll(".fa-angle-down");
for(let i = 0; i < angle.length; i++) {
	angle[i].addEventListener("click", (e) => {
		let angleParent = e.target.parentElement.parentElement;
		angleParent.classList.toggle("showMenu");
	});
}

ratings = {RatingScore: 4.5} 
totalRating = 5;
table = document.querySelector('.RatingStar');
function rateIt() {
	for (rating in ratings) {
		ratingPercentage = ratings[rating] / totalRating * 100;
		ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';
		star = table.querySelector(`.${rating} .inner-star`);
		numberRating = table.querySelector(`.${rating} .numberRating`);
		star.style.width = ratingRounded;
		numberRating.innerText = ratings[rating];
		}
	}rateIt()
</script>

</body>
</html>