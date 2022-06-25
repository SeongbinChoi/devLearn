<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
<style type="text/css">

.carousel-content-text div:first-child {
	font-size: 14px;
	font-weight: 700;
	height: 24px;
	line-height: 24px;
	padding : 0 10px;
	border-radius: 4px;
	min-width: 40px;
	margin-bottom: 10px;
}

.carousel-content-text h1 {
	font-size : 32px;
	font-weight: 900;
	margin-bottom: 10px;
	
}

.carousel-content-text p:last-child {
	font-weight: 16px;
}

</style>
</head>
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

<div class="current_course mt-5 pt-5">
	<div class="container">
		<h3>최근 수강 강의</h3>
		<div class="row mb-3" >
		<c:forEach begin="1" end="2">
			<div class="currentCourse-card card col">
				<div class="row g-0  align-middle">
					<div class="col-md-4 col d-flex align-items-center">
						<img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" class="img-fluid rounded-start" alt="...">
					</div>
					<div class="col-md-8 ">
						<div class="card-body row d-flex align-items-center">
							<h5 class="card-title">디자이너 구합니다</h5>
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
		</c:forEach>
		</div>
	</div>
</div>

<div class="course-section mt-5">
	<div class="container">
		<h3>인기 강의</h3>
		<div class="popular-courses courses">
			<c:forEach var="1" begin="1" end="5">
				<div class="col course-card">
					<img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">강의제목</h5>
						<p class="card-text course-instructor">강사이름</p>
						<button class="course_review px-1 py-1" data-bs-toggle="modal" data-bs-target="#mentorModal">
						<span><i class="fas fa-star"></i></span>
						<span>5.0<span>/5 〉</span></span>
						</button>
						<span class="course_review-cnt">(40)</span>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}"><!-- 이거는..나중에 dto에서 정한 이름으로 바꿔주세요 -->
									<p class="card-text course-price">가격</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦80000</p>
									<p class="card-text course-price">￦40000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>


<div class="course-section mt-5">
	<div class="container">
		<h3>신규 강의</h3>
		<div class="new-courses courses">
			<c:forEach var="1" begin="1" end="5">
				<div class="col course-card">
					<img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">강의제목</h5>
						<p class="card-text course-instructor">강사이름</p>
						<button class="course_review px-1 py-1" data-bs-toggle="modal" data-bs-target="#mentorModal">
						<span><i class="fas fa-star"></i></span>
						<span>5.0<span>/5 〉</span></span>
						</button>
						<div class="course-Prices">
							<c:choose>
								<c:when test="${lectureDcPercent == 0}"><!-- 이거는..나중에 dto에서 정한 이름으로 바꿔주세요 -->
									<p class="card-text course-price">가격</p>
								</c:when>
								<c:otherwise>
									<p class="card-text course-originalPrice">￦80000</p>
									<p class="card-text course-price">￦40000</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="modal fade" id="mentorModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">멘토링 후기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body px-4">
      	<c:forEach var="i" begin="1" end="5">
			<div class="review_content mb-5">
				<p>
					<c:forEach var="s" begin="1" end="5">
						<i class="fas fa-star"></i>
					</c:forEach>
				</p>
				<p>혼자 개발하는 경우가 많아 코드를 어떻게 개선할 수 있을까 고민하다가 신청하게 되었는데 준비도 많이 해주시고 여러가지 방안을 제시해주셔서 도움이 많이 되었습니다. 실제 코드도 봐주시고 평소에 개발하면서 궁금한 부분들도 속시원하게 답변해 주셔서 좋았습니다. 앞으로도 개발하다가 고민거리가 생기면 찾아뵐것 같습니다. 이런 채널이 있다는게 감사한것 같아요. 감사합니다 !!</p>
			</div>
		</c:forEach>
      </div>
    </div>
  </div>
</div>

</body>
</html>			   
