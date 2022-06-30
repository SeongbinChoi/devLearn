<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lectureDetail.css" type="text/css">	

	<div class="banner">
		<div class="container px-4">
			<div class="title row align-items-center">
				<div class="title_left mx-4">
					<img alt="thumbnail" src="https://images.velog.io/images/neity16/post/5d2d346f-4545-4118-b574-6498f5d38169/spring.png">
				</div>
				<div class="title_right">
					<p class="mb-2">개발 · 프로그래밍 > 백엔드</p>
					<p class="title_right_2 mb-4">${dto.lectureSubject}</p>
					<p class="mb-2">
						<c:forEach var="s" begin="1" end="5">
							<i class="fas fa-star" style="color: #FDCC11; font-size:13px;"></i>
						</c:forEach>
						 (5.0) &nbsp;&nbsp;&nbsp; 50개의 수강평 · 999명의 수강생
					</p>
					<p class="mb-0"><i class="fa-regular fa-user" style="color: white; font-size:16px;"></i>${dto.memberNickname}</p>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="container">
	
		<nav id="navbar-example2" class="navbar navbar-light px-3">
			<ul class="nav">
				<li class="nav-item">
					<a class="nav-link" href="#scrollspyHeading1">강의소개</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#scrollspyHeading2">커리큘럼</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#scrollspyHeading3">수강평</a>
				</li>
				<li class="nav-item"> 
					<a class="nav-link" onclick="location.href='${pageContext.request.contextPath}/lectureInquiry/inquiry?lectureNum=${dto.lectureNum}';">수강 전 문의</a>	
				</li>
				<!--  
				<li class="nav-item">
					<a class="nav-link" href="#">커뮤니티</a>
				</li>
				-->
				<li class="nav-item">
					<a class="nav-link" onclick="location.href='${pageContext.request.contextPath}/lecturenews/news?lectureNum=${dto.lectureNum}';">새 소식</a>
				</li>
			</ul>
		</nav>
		 
		
		<div class="contentBody">
		
			<div class="bodyMain col-8 px-5 py-5">
				<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">
					<h4 id="scrollspyHeading1" class="mb-3">강의 카테고리<br>${dto.lectureSubject}</h4>
					<p class="mb-5">
						강의를 수강해 주신 모든 분들께 감사드립니다.
						
						${dto.lectureContent}
						<br>
						
						강의는 지속적으로 업데이트 될 예정이며, 강의에 대한 궁금증이나 내용에 대한 질문은 문의 게시판이나 강사 이메일을 통해 해결해 드리도록 하겠습니다.
						<br>
						다시 한 번 수강생 분들에게 감사드리며, 수강 후에는 한 계단 높은 곳에 계시기를 기원합니다!
						
						
						

					</p>
					
					
					
					
					<hr>
					
					<p id="scrollspyHeading2" class="mb-3">커리큘럼<span>&nbsp;&nbsp;총 30개 · 7시간 수업</span></p>
					
					<div class="accordion" id="accordionPanelsStayOpenExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-headingOne">
								<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
								  섹션 0. 강의 소개
								</button>
							</h2>
							<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
								<div class="accordion-body">
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;강좌 소개</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;소스 코드</a>
									</div>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
								 섹션 1. JDBC 이해
								</button>
							</h2>
							<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
								<div class="accordion-body">
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;첫번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;두번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;세번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;네번째 강의</a>
									</div>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-headingThree">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
									섹션 2. 커넥션풀과 데이터소스 이해
								</button>
							</h2>
							<div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
								<div class="accordion-body">
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;첫번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;두번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;세번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;네번째 강의</a>
									</div>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-headingFour">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
									섹션 3. 트랜잭션 이해
								</button>
							</h2>
							<div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
								<div class="accordion-body">
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;첫번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;두번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;세번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;네번째 강의</a>
									</div>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-headingFive">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
									섹션 4. 자바 예외 이해
								</button>
							</h2>
							<div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
								<div class="accordion-body">
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;첫번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;두번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;세번째 강의</a>
									</div>
									<div class="accordion-unit">
										<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;네번째 강의</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<hr class="cur_final">
					
					
					<p id="scrollspyHeading3">수강평<span>&nbsp;&nbsp;총 50개</span></p>
					<div class="review_total">
						<div class="left_box">
							<p>5.0</p>
							<p>
								<c:forEach var="s" begin="1" end="5">
									<i class="fas fa-star" style="color: #FDCC11;"></i>
								</c:forEach>
							</p>
							<p>50개의 수강평</p>
						</div>
						
						<div class="right_box">
							<div class="bar">
								<span>5점 </span>
								<div class="progress">
									<div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="bar">
								<span>4점 </span>
								<div class="progress">
									<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="bar">
								<span>3점 </span>
								<div class="progress">
									<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="bar">
								<span>2점 </span>
								<div class="progress">
									<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="bar">
								<span>1점 </span>
								<div class="progress">
									<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="reg_review">
						<div class="review_star">
							<span><i class="fas fa-star" style="color: gray;"></i></span>
							<span><i class="fas fa-star" style="color: gray;"></i></span>
							<span><i class="fas fa-star" style="color: gray;"></i></span>
							<span><i class="fas fa-star" style="color: gray;"></i></span>
							<span><i class="fas fa-star" style="color: gray;"></i></span>
						</div>
						<p>별점을 선택해주세요</p>
						<textarea placeholder="수강평을 남겨주세요"></textarea>
						<p><button type="button" class="btn btn-primary">등록</button></p>
					</div>
					
					
					<div class="review_list">
						<div class="review_tab">
							<ul>
								<li>· 최신순</li>
								<li>· 높은 평점 순</li>
								<li>· 낮은 평점 순</li>
							</ul>							
						</div>
						<hr>
						
						<div class="review_list_body">
							
							<c:forEach var="a" begin="1" end="5">
							
								<div class="review_unit">
									<div class="user_info">
										<div class="user_img">
											<img alt="profile" src="https://cdn.inflearn.com/public/main/profile/default_profile.png">
										</div>
										<div class="star_nickname">
											<div class="review_star">
												<span><i class="fas fa-star" style="color: #FDCC11;"></i></span>
												<span><i class="fas fa-star" style="color: #FDCC11;"></i></span>
												<span><i class="fas fa-star" style="color: #FDCC11;"></i></span>
												<span><i class="fas fa-star" style="color: #FDCC11;"></i></span>
												<span><i class="fas fa-star" style="color: #FDCC11;"></i></span>
											</div>
											<p>김자바</p>
										</div>
									</div>
									
									<div class="review_content">
										<p>최고의 강의입니다. 최고 최고 꼭 들으세요</p>
										<p>2022-06-06 · <span>답글 작성</span></p>
									</div>
									
								</div>
								
								<hr>
							</c:forEach>
							
						</div>
					</div>
				
				
					<div class="moreButton">
						<button type="button">더보기</button>
					</div>
					
				</div>
			</div>
			
			
			
			<!-- 사이드메뉴 -->
			<div class="sideBar col-4 py-4">
			
				<div class="card col-9" style="float: none; margin:0 auto;">
					<div class="card-header">
						${dto.dcPercent}% 할인 중인 강의
					</div>
					
					<div class="card-body mx-2 my-3">
						<div class="price mb-3">
							<p>${dto.dcPercent}%</p>
							<p><fmt:formatNumber value="${dto.finalPrice}" type="number"/>원&nbsp;</p>
							<p class="mb-1"><del><fmt:formatNumber value="${dto.lecturePrice}" type="number"/>원</del></p>
						</div>
						<a href="#" class="btn btn-primary col-12 mb-2">수강신청 하기</a>
						<a href="#" class="btn btn-outline-primary col-12 mb-2">장바구니 담기</a>
					</div>
					
					<div class="card-footer">
						<ul class="mb-0">
							<li>지식공유자: ${dto.memberNickname}</li>
							<li>총 30개 수업(5시간)</li>
							<li>수강기한: 무제한</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>