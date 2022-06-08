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
					<p class="title_right_2 mb-4">스프링 DB - 데이터 접근 활용 기술</p>
					<p class="mb-2">
						<c:forEach var="s" begin="1" end="5">
							<i class="fas fa-star" style="color: #FDCC11; font-size:13px;"></i>
						</c:forEach>
						 (5.0) &nbsp;&nbsp;&nbsp; 50개의 수강평 · 999명의 수강생
					</p>
					<p class="mb-0"><i class="fa-regular fa-user" style="color: white; font-size:16px;"></i> 자바의 신</p>
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
					<a class="nav-link" href="#">수강 전 문의</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">커뮤니티</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">새소식</a>
				</li>
			</ul>
		</nav>
		 
		
		<div class="contentBody">
		
			<div class="bodyMain col-8 px-5 py-5">
				<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">
					<h4 id="scrollspyHeading1" class="mb-3">초급자를 위해 준비한<br> 백엔드 강의입니다.</h4>
					<p class="mb-5">
						백엔드 개발에 필요한 DB 데이터 접근 기술을 기초부터 이해하고, 완성할 수 있습니다. 스프링 DB 접근 기술의 원리와 구조를 이해하고, 더 깊이있는 백엔드 개발자로 성장할 수 있습니다.
					</p>
					
					<h4 class="mb-3">데이터 접근 기술</h4>
					<p class="mb-5">
						현대의 애플리케이션은 대부분 웹 환경에서 동작하는 웹 애플리케이션입니다. 단순하게 생각하면 웹 애플리케이션은 크게 3가지 기능을 수행합니다.
						<br><br>
						우리는 앞서 스프링 MVC 강의를 통해 클라이언트의 요청을 받아서 처리하는 방법을 학습했습니다. 이번에는 그 이후 단계인 비즈니스 로직을 수행하는 서비스와 수행 결과를 데이터베이스에 보관하고 관리하는 리포지토리에 대해 깊이있게 학습합니다.
						<br><br>
						클라이언트의 요청을 받아서 처리하는 기능은 스프링 MVC를 사용합니다. 비즈니스 로직을 수행하는 기능은 순수한 자바 코드로 만들어집니다. 마지막으로 수행 결과를 데이터베이스에 보관하고 관리하는 기능은 JDBC, JdbcTemplate, MyBatis, JPA와 같은 다양한 기술들을 선택해서 사용합니다. 그리고 스프링이 제공하는 DB 데이터 접근 기술을 사용하면 이러한 기술들을 스프링과 통합해서, 매우 편리하게 사용할 수 있습니다.
		
					</p>
					
					<h4 class="mb-3">강의 특징</h4>
					<p class="mb-5">
						이 강의는 20년 전으로 돌아갑니다. 데이터 접근 기술의 시작인 JDBC를 시작으로, 커넥션, 커넥션 풀, 데이터소스, 트랜잭션 개념, 그리고 스프링이 지원하는 데이터 접근 기술까지, 모든 것을 코드로 여러분과 함께 만들어보면서 단계적으로 진행합니다. 과거에 어떤 불편한 점이 있어서 다음 기술이 탄생했고, 어떤 점들이 개선되었는지 그 이유를 찾고 직접 코딩하면서 하나씩 이해할 수 있습니다.
					</p>
					
					<h4 class="mb-3">스프링 DB 강의 구성</h4>
					<p class="info_final">
						데이터 접근 기술의 핵심 개념을 다지고, 스프링이 제공하는 데이터 접근 기술의 기본 원리를 이해합니다.
						1편은 먼저 스프링 없이 순수한 데이터 접근 기술인 JDBC, 커넥션, 커넥션 풀, 데이터소스, 트랜잭션 같은 기반 기술의 핵심 개념을 먼저 학습합니다. 이렇게 기반을 다진 다음에, 그 위에 스프링 데이터 접근 기술이 이 기능들을 얼마나 편리하게 사용할 수 있도록 도와주는지 단계별로 깊이있게 학습합니다.
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
						30% 할인 중인 강의
					</div>
					
					<div class="card-body mx-2 my-3">
						<div class="price mb-3">
							<p>30%</p>
							<p><fmt:formatNumber value="53900" type="number"/>원&nbsp;</p>
							<p class="mb-1"><del><fmt:formatNumber value="77000" type="number"/>원</del></p>
						</div>
						<a href="#" class="btn btn-primary col-12 mb-2">수강신청 하기</a>
						<a href="#" class="btn btn-outline-primary col-12 mb-2">장바구니 담기</a>
					</div>
					
					<div class="card-footer">
						<ul class="mb-0">
							<li>지식공유자: 자바의신</li>
							<li>총 30개 수업(5시간)</li>
							<li>수강기한: 무제한</li>
						</ul>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>