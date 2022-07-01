<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">

<script type="text/javascript">
$(function() {
	let mode = "${mode}";
	let message = "${message}";
	
	if(mode == "enabled") {
		alert(message);
	}
	
	if(mode == "logout") {
		alert(message);
		location.href="${pageContext.request.contextPath}/member/logout";
	}
});
</script>

<body>
	<div class="banner">
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 6"></button>
	</div>
	<div class="carousel-inner">
		<!-- carousel-item 01 -->
		<div class="carousel-item active ">
	  		<div style="background:#ffd74b;">
		  		<div class="container">
		  			<div class="carousel-content row d-flex align-items-center">
		  				<div class="carousel-content-text col-5">
		  					<div class="d-inline-block" style="color:#ffffff;background-color:#a14037;">도서 굿즈 증정</div>
		   					<h1>Q.저도 개발자가 될 수 있나요 ?<br>A.그럼요! 함께해요.</h1>
		   					<p>지금 강의 수강신청하면 '오늘부터 개발자'책을 드려요!</p>
		   				</div>
		   				<div class="carousel-content-img ms-auto col-7">
							<img src="https://cdn.inflearn.com/public/main_sliders/ee583bd5-bf5e-42ad-90ed-23997f13b7e7/328003-eng.png" class="d-block" alt="...">
		   				</div>
		   			</div>
		   		</div>
	  		</div>
		</div>
		
		<!-- carousel-item 02 -->
		<div class="carousel-item">
	  		<div style="background: #88c2eb;">
		  		<div class="container">
		  			<div class="carousel-content row d-flex align-items-center">
		  				<div class="carousel-content-text col-5">
		  					<div class="d-inline-block" style="color:#ffffff;background-color: #ff0000;">방학기념 25% 할인</div>
		   					<h1 style="color: #000000;">교수님은 <br>방학숙제를 주지 않으셨다.</h1>
		   					<p style="color: #000000;">대신 데브런에서 드릴게요 😉<br>우리, 방학동안 이것만큼은 배워가요!</p>
		   				</div>
		   				<div class="carousel-content-img ms-auto col-7">
							<img src="https://cdn.inflearn.com/public/main_sliders/01d3ae7c-b863-420b-bf3c-cd4d8948bc19/%E1%84%87%E1%85%A1%E1%86%BC%E1%84%92%E1%85%A1%E1%86%A8%E1%84%87%E1%85%A2%E1%84%82%E1%85%A5.png" class="d-block"  alt="...">
		   				</div>
		   			</div>
		   		</div>
	  		</div>
		</div>
		<!-- carousel-item 03 -->
		<div class="carousel-item">
	  		<div style="background: #ff7836;">
		  		<div class="container">
		  			<div class="carousel-content row d-flex align-items-center">
		  				<div class="carousel-content-text col-5">
		  					<div class="d-inline-block" style="color:#ffffff;background-color:#007bf8;">신규강의</div>
		   					<h1 style="color:#ffffff;">나만 몰랐던 이 강의~🎵</h1>
		   					<p style="color:#ffffff;">매일 업데이트 되는<br>신규 강의를 만나보세요~</p>
		   				</div>
		   				<div class="carousel-content-img ms-auto col-7">
							<img src="https://cdn.inflearn.com/public/main_sliders/7dc9730a-1a01-40a7-a509-4e8bceb73570/%5B%EB%A9%94%EC%9D%B8%ED%9E%88%EC%96%B4%EB%A1%9C%5D%EC%8B%A0%EA%B7%9C%EA%B0%95%EC%9D%98_main_521.gif" class="d-block" alt="...">
		   				</div>
		   			</div>
		   		</div>
	  		</div>
		</div>
		<!-- carousel-item 04 -->
		<div class="carousel-item">
	  		<div style="background: #501ef3;">
		  		<div class="container">
		  			<div class="carousel-content row d-flex align-items-center">
		  				<div class="carousel-content-text col-5">
		  					<div class="d-inline-block" style="color:#ffffff;background-color:#ff4aa9;">25% 할인 중</div>
		   					<h1 style="color:#ffffff;">기획 직무의<br>랜선 사수를 만나보세요🙌</h1>
		   					<p style="color:#ffffff;">입문부터 실전까지 커리어 성장을 도와줄 거에요</p>
		   				</div>
		   				<div class="carousel-content-img ms-auto col-7">
							<img src="https://cdn.inflearn.com/public/main_sliders/afca7bb3-e7d9-453b-84ef-1d6056569489/%5B%E1%84%90%E1%85%A2%E1%84%80%E1%85%B3%E1%84%85%E1%85%A2%E1%86%AB%E1%84%83%E1%85%B5%E1%86%BC%5D%E1%84%80%E1%85%B5%E1%84%92%E1%85%AC%E1%86%A8_main_521.png" class="d-block" alt="...">
		   				</div>
		   			</div>
		   		</div>
	  		</div>
		</div>
		<!-- carousel-item 05 -->
		<div class="carousel-item">
	  		<div style="background:#00d078;">
		  		<div class="container">
		  			<div class="carousel-content row d-flex align-items-center">
		  				<div class="carousel-content-text col-5">
		   					<h1>뭘 들어야하지?🤔<br>나에게 딱 맞는 입문 강의</h1>
		   					<p>어디서부터 시작해야 할지 모르는<br>당신을 위한 입문 강의</p>
		   				</div>
		   				<div class="carousel-content-img ms-auto col-7">
							<img src="https://cdn.inflearn.com/public/main_sliders/f57e3418-f145-43a4-89d6-f1c4f0293460/%5B%E1%84%86%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%92%E1%85%B5%E1%84%8B%E1%85%A5%E1%84%85%E1%85%A9%5D%E1%84%82%E1%85%A1%E1%84%8B%E1%85%A6%E1%84%80%E1%85%A6%E1%84%86%E1%85%A1%E1%86%BD%E1%84%82%E1%85%B3%E1%86%AB%E1%84%80%E1%85%A1%E1%86%BC%E1%84%8B%E1%85%B4_main_521.png" class="d-block" alt="...">
		   				</div>
		   			</div>
		   		</div>
	  		</div>
		</div>
		<!-- carousel-item 06 -->
		<div class="carousel-item">
	  		<div style="background: #086394;">
		  		<div class="container">
		  			<div class="carousel-content row d-flex align-items-center">
		  				<div class="carousel-content-text col-5">
		  					<div class="d-inline-block" style="color:#000000;background-color:#00de84;">지식공유신청</div>
		   					<h1 style="color:#ffffff;">나누는 지식만큼<br>커지는 보람과 보상</h1>
		   					<p style="color:#ffffff;">인프런과 지식공유자로<br>높은 수익과 가치를 만들어보세요.</p>
		   				</div>
		   				<div class="carousel-content-img ms-auto col-7">
							<img src="https://cdn.inflearn.com/public/main_sliders/14394a9e-4b27-4a0f-bc87-c2cae10e2d62/%5B%E1%84%86%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%92%E1%85%B5%E1%84%8B%E1%85%A5%E1%84%85%E1%85%A9%5D%E1%84%8C%E1%85%B5%E1%84%89%E1%85%B5%E1%86%A8%E1%84%80%E1%85%A9%E1%86%BC%E1%84%8B%E1%85%B2%E1%84%8C%E1%85%A1_521.gif" class="d-block"  alt="...">
		   				</div>
		   			</div>
		   		</div>
	  		</div>
		</div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>

<!-- 검색 -->
<div class="search mt-5" >
	<form action="main-search">
		<div class="container">
			<div class="search-border border rounded-pill d-flex justify-content-center " style="width: 40%; margin: 0 auto; border: 15px solid #6799FF">
				<input type="text" class="ml-1" name ="keyword" placeholder="배우고 싶은 지식을 입력해보세요" style="border: none; width: 80%;" >
				<button type="button" style="border: none; background: none;"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
		</div>
	</form>
</div>	

<!-- 로그인 해야만 최근 수강 보이게 -->
<c:if test="${sessionScope.member.memberEmail != null}">
	<!-- 최근 수강 -->
	<div class="current-course mt-5 pt-5">
		<div class="container">
			<h3>최근 수강 강의</h3>
			<div class="row">
				<div class="col-6">
					<div class="current-card d-flex" id="current-card" >
						<img src="https://cdn.inflearn.com/public/courses/325630/cover/56f635a3-3a44-4096-a16b-453ea1696b1a/325630-eng.png" style="height: 100%;" class="" alt="...">
						<div class="current-card-content flex-grow-1 d-flex align-content-center">
							<div class="card-body row d-flex align-items-center">
								<p class="card-title">스프링 입문 - 코드로 배우는 스프링 부트</p>
								<div class="card-txt col-8 text-align-center">
									<span class="card-text progress-rate">진행률 : 46.80% </span>
									<span class= "card-text">기한 : 무제한</span>
									<p><progress class="progress mt-2" value="46.8" max="100" style="width: 100% ; height: 5px;"></progress><p>
								</div>
								<p class="col d-flex justify-content-end "><a href="#" class="btn btn-primary d-flex align-items-center"><span style="font-size: 12px; font-weight: 700;">이어듣기 &nbsp;<i class="fa-solid fa-play"></i></span></a></p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="current-card d-flex" id="current-card" >
						<img src="https://cdn.inflearn.com/public/courses/325969/cover/2868c757-5886-4508-a140-7cb68a83dfd8/325969-eng.png" style="height: 100%;" class="" alt="...">
						<div class="current-card-content flex-grow-1 d-flex align-content-center">
							<div class="card-body row d-flex align-items-center">
								<p class="card-title">스프링 핵심 원리 - 기본편</p>
								<div class="card-txt col-8 text-align-center">
									<span class="card-text progress-rate">진행률 : 12.80% </span>
									<span class= "card-text">기한 : 무제한</span>
									<p><progress class="progress mt-2" value="12.8" max="100" style="width: 100% ; height: 5px;"></progress><p>
								</div>
								<p class="col d-flex justify-content-end "><a href="#" class="btn btn-primary d-flex align-items-center"><span style="font-size: 12px; font-weight: 700;">이어듣기 &nbsp;<i class="fa-solid fa-play"></i></span></a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</c:if>	


<!-- 인기강의 -->
<div class="course-section mt-5">
	<div class="container">
		<h3>인기 강의</h3>
		<div class="courseSection d-flex">
			<!-- 인기강의 1 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/325969/cover/2868c757-5886-4508-a140-7cb68a83dfd8/325969-eng.png" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">스프링 핵심 원리 - 기본편</h5>
						<p class="card-text course-instructor">김강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.1/5</span>
						<span class="course_review-cnt">(102)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}">
									<p class="card-text course-price">가격</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦80,000</p>
									<p class="card-text course-price">￦40,000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack ">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">스프링 핵심 원리 - 기본편</p>
								<p class="courseDesc"></p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 초급</p>
									<p><i class="fa-regular fa-rectangle-list"></i> 백엔드, 웹개발</p>
									<p><i class="fa-solid fa-cubes"></i> MVC, Spring, Back-End</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 인기강의 2 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/326277/cover/52d4f143-b470-4109-96cb-a0b146fb42ed/http.png" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">모든 개발자를 위한 HTTP 웹 기본 지식</h5>
						<p class="card-text course-instructor">나강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.1/5</span>
						<span class="course_review-cnt">(45)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent != 0}">
									<p class="card-text course-price">￦70,000</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦80,000</p>
									<p class="card-text course-price">￦40,000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">모든 개발자를 위한 HTTP 웹 기본 지식</p>
								<p class="courseDesc">실무에 꼭 필요한 HTTP 핵심 기능과 올바른 HTTP API 설계 방법을 학습합니다.</p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 초급</p>
									<p><i class="fa-regular fa-rectangle-list"></i>웹개발</p>
									<p><i class="fa-solid fa-cubes"></i> 네트워크, 웹개발 , Back-End</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 인기강의 3 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/328723/cover/062da05a-55e9-49f1-a9ad-3e67ea079fe9/328723-eng.png" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">스프링 DB 1편</h5>
						<p class="card-text course-instructor">정강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.1/5</span>
						<span class="course_review-cnt">(453)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}">
									<p class="card-text course-price">가격</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦120,000</p>
									<p class="card-text course-price">￦100,000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">스프링 DB 1편</p>
								<p class="courseDesc">백엔드 개발에 필요한 DB 데이터 접근 기술을 기초부터 이해하고, 완성할 수 있습니다. </p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 초급</p>
									<p><i class="fa-regular fa-rectangle-list"></i>백엔드, 웹개발</p>
									<p><i class="fa-solid fa-cubes"></i> Spring, 데이터 베이스 , Back-End</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 인기강의 4 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/328721/cover/d924844a-dfab-4906-8d26-701a1ca9fc11/328721-eng.png" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">비전공자를 위한 풀스택 맛집지도 만들기 프로젝트!</h5>
						<p class="card-text course-instructor">최강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.1/5</span>
						<span class="course_review-cnt">(78)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent != 0}">
									<p class="card-text course-price">￦40,000</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦80,000</p>
									<p class="card-text course-price">￦40,000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">비전공자를 위한 풀스택 맛집지도 만들기 프로젝트!</p>
								<p class="courseDesc">내가 좋아하는 유튜버의 맛집지도를 만들면서 프론트엔드, 백엔드, 카카오맵 API 사용법, 배포까지 한번에 배울 수 있습니다.</p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 초급</p>
									<p><i class="fa-regular fa-rectangle-list"></i> 풀스택, 프론트 엔드, 백엔드</p>
									<p><i class="fa-solid fa-cubes"></i> Full-Stack, Front-End, Back-End</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 인기강의 5 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/328606/cover/696fc375-3add-425c-bf21-eb5e193de93b/328606-eng.png" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">자바 개발자를 위한 코틀린 입문</h5>
						<p class="card-text course-instructor">임강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.1/5</span>
						<span class="course_review-cnt">(40)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}">
									<p class="card-text course-price">가격</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦80,000</p>
									<p class="card-text course-price">￦40,000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">자바 개발자를 위한 코틀린 입문</p>
								<p class="courseDesc">이 강의를 통해 Kotlin 언어의 특성과 배경, 문법과 동작 원리 등을 배울 수 있습니다.</p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 초급</p>
									<p><i class="fa-regular fa-rectangle-list"></i> 프로그래밍 언어, 백엔드</p>
									<p><i class="fa-solid fa-cubes"></i> Kotlin, Java, 객체 지향</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="course-section mt-5">
	<div class="container">
		<h3>신규 강의</h3>
		<div class="courseSection d-flex">
			<!-- 신규강의 1 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/329126/cover/ce0807cd-62f8-4db6-8674-0d48668df0c3/329126-eng.png" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">퍼블리셔 취업하는 훌륭한 이력서 작성 가이드</h5>
						<p class="card-text course-instructor">완강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.7/5</span>
						<span class="course_review-cnt">(2)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}">
									<p class="card-text course-price">가격</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦80,000</p>
									<p class="card-text course-price">￦64,000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">퍼블리셔 취업하는 훌륭한 이력서 작성 가이드</p>
								<p class="courseDesc">퍼블리셔 취업을 위해 채용 담당자에게 어필할 수 있는 이력서 작성방법을 상세히 알려드립니다.</p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 입문</p>
									<p><i class="fa-regular fa-rectangle-list"></i> 취업, 이직, 웹 퍼블리싱</p>
									<p><i class="fa-solid fa-cubes"></i> 웹 퍼블리싱, 이력서, 취업</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 신규강의 2 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/326750/cover/d7815167-2a01-42c1-aacf-bbd32a3705bc/326750-eng.png" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">자바(Java) 알고리즘 문제풀이 : 코딩테스트 대비</h5>
						<p class="card-text course-instructor">윤강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.1/5</span>
						<span class="course_review-cnt">(1)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}"><!-- 이거는..나중에 dto에서 정한 이름으로 바꿔주세요 -->
									<p class="card-text course-price">￦70,000</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦77,000</p>
									<p class="card-text course-price">￦57,750</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">자바(Java) 알고리즘 문제풀이 : 코딩테스트 대비</p>
								<p class="courseDesc">자바(Java)로 코딩테스트를 준비하시는 분을 위한 강좌입니다. </p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 초급</p>
									<p><i class="fa-regular fa-rectangle-list"></i> 알고리즘, 자료구조</p>
									<p><i class="fa-solid fa-cubes"></i> 알고리즘, Java, 코딩 테스트</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 신규강의 3 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/324214/course_cover/8ce5e6b5-6b31-4659-a0cd-eec20efc13f4/kyh_JPA_Spring2.png" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">스프링 부트와 JPA 활용2 - API 개발과 성능 최적화</h5>
						<p class="card-text course-instructor">김강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.1/5</span>
						<span class="course_review-cnt">(67)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}"><!-- 이거는..나중에 dto에서 정한 이름으로 바꿔주세요 -->
									<p class="card-text course-price">가격</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦120,000</p>
									<p class="card-text course-price">￦100,000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">스프링 부트와 JPA 활용2 - API 개발과 성능 최적화</p>
								<p class="courseDesc">스프링 부트와 JPA를 활용해서 API를 개발합니다. 그리고 JPA 극한의 성능 최적화 방법을 학습할 수 있습니다.</p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 중급이상</p>
									<p><i class="fa-regular fa-rectangle-list"></i> 백엔드, 웹개발</p>
									<p><i class="fa-solid fa-cubes"></i> Back-End, Java, Spring</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 신규강의 4 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/329092/cover/3955bceb-5847-4a99-b235-964833bbe450/329092-eng.jpg" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">블렌더 처음 시작부터 로우폴리 3D 애니메이션 까지</h5>
						<p class="card-text course-instructor">강강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.9/5</span>
						<span class="course_review-cnt">(1)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}"><!-- 이거는..나중에 dto에서 정한 이름으로 바꿔주세요 -->
									<p class="card-text course-price">￦40,000</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦49,500</p>
									<p class="card-text course-price">￦34,650</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">블렌더 처음 시작부터 로우폴리 3D 애니메이션 까지</p>
								<p class="courseDesc">블렌더 완전 기초부터 로우폴리 3D 애니메이션 까지 만들 수 있는 강의</p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 입문</p>
									<p><i class="fa-regular fa-rectangle-list"></i> CAD, 3D 모델링, 디자인 툴</p>
									<p><i class="fa-solid fa-cubes"></i> 블렌더, 3D 모델링</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 신규강의 5 -->
			<div class="col">
				<div class="courseCard d-flex flex-column" style="position: relative;">
					<img src="https://cdn.inflearn.com/public/courses/329080/cover/c7af9560-eced-48dd-af9e-66b2e8ee17bc/329080-eng.jpg" style="position: relative;">
					<div class="card-body" style="position: relative;">
						<h5 class="card-title">만들면서 배우는 프론트엔드 DO IT 코딩</h5>
						<p class="card-text course-instructor">임강사</p>
						<span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
						<span class="courseGrade">4.1/5</span>
						<span class="course_review-cnt">(15)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}">
									<p class="card-text course-price">가격</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦80,000</p>
									<p class="card-text course-price">￦40,000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="courseCardBlack">
						<div class="d-flex flex-column" style="height: 100%;">
							<div>
								<p class="courseTitle">만들면서 배우는 프론트엔드 DO IT 코딩</p>
								<p class="courseDesc">겉만 멋진 서비스 말고 사용자를 만나서 피드백받을 수 있는 서비스를 만들 수 있습니다.</p>
								<div class="iconDesc">
									<p style="color : c5ebf8;"><i class="fa-solid fa-stairs"></i> 초급</p>
									<p><i class="fa-regular fa-rectangle-list"></i> 프론트엔드, 웹개발</p>
									<p><i class="fa-solid fa-cubes"></i> Front-End, Next.js</p>
								</div>
							</div>
							<div class="flex-grow-1  "  style="position: relative;">
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 30px;">
									<div class="showP d-flex">
										<p class="d-inline-block">장바구니에 담기</p>
									</div>
									<p class="overP d-flex">&nbsp;&nbsp;<i class="fa-solid fa-cart-plus"></i><p>
								</div>
								<div class="blackAdd d-flex" style="position: absolute; right: 0 ; bottom: 0px;">
									<div class="showP d-flex">
										<p class="d-inline-block">찜하기</p>
									</div>
									<p class="overP">&nbsp;&nbsp;<i class="fa-regular fa-heart"></i></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
$(".courseCard").mouseover(function (){
	$(this).find(".courseCardBlack").css("display","block");	
});
$(".courseCard").mouseout(function (){
	$(this).find(".courseCardBlack").css("display","none");		
});

$(".overP").mouseover(function (){
	$(this).css("color", "tomato");
	$(this).prev(".showP").css("opacity", "1");
});
$(".overP").mouseout(function (){
	$(this).css("color", "#fff");
	$(this).prev(".showP").css("opacity", "0");
});

</script>