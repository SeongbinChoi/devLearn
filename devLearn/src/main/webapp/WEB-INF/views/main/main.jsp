<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
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
    <div class="carousel-item active">
      <img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" class="d-block w-100"  alt="...">
    </div>
    <div class="carousel-item">
      <img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" class="d-block w-100"  alt="...">
    </div>
    <div class="carousel-item">
      <img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" class="d-block w-100"  alt="...">
    </div>
    <div class="carousel-item">
      <img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" class="d-block w-100"  alt="...">
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
