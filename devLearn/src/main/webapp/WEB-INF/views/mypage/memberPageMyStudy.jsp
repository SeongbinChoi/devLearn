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
<style type="text/css">
.search-section {
	padding-bottom: 10px;
}
.select {
	margin-right: 15px;
}

.select p {
	margin: 0;
	padding-left: 5px;
	font-size: 14px;
	color: #999;
}

.lecture-section {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
		
}

.cards {
	width: 300px;
	overflow: hidden;
	margin-bottom: 30px;
}

.title {
	width: 97%;
	margin: 0 auto;
}

.title p {
	margin-bottom: 0;
	font-weight: 600;
}

.title a {
	margin-left: 10px;
	font-size: 45px;
}

.curr-lec-prog{
	width: 90%;
}

</style>
</head>

<body>
<jsp:include page="memberPage.jsp"/>
	<form action="" >
		<h2>보유한 강의</h2>
		<div class="search-section d-flex mb-2 border-bottom">
			<div class="select">
				<p>정렬 기준</p>
				<select class="form-select" style="width: 180px;">
					<option>최근공부</option>
					<option>최근 수강 신청</option>
					<option>제목 순</option>				
				</select>
			</div>
			<div class="select">
				<p>진행률</p>
				<select class="form-select">
					<option>모두보기</option>
					<option>진행중</option>
					<option>완강</option>				
				</select>
			</div>
			<div class="input-group align-self-end">
			  <input type="text" class="form-control" placeholder="강의명 또는 강사 이름으로 검색" aria-label="Recipient's username" aria-describedby="searchBtn">
			  <button class="btn btn-primary" type="button" id="searchBtn">검색</button>
			</div>
		</div>
		
		<div class="lecture-section mt-3">
			<c:forEach begin="1" end="21">
				<div class="cards">
					<img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" style="width: 100%;">
					<div class="title d-flex align-items-center">
						<p>강의제목강의제목강의제목강의제목강의제목</p>
						<a href="#"><i class="fa-solid fa-circle-play"></i></a>
					</div>
					<div class="curr-prog-sec">
						<span>진행률  12.8%</span> | <span>기한 : 무제한</span>
						<progress class="curr-lec-prog" value="12.8" max="100"></progress>
					</div>
				</div>
			</c:forEach>
		</div>
	</form>
</main>

</body>
</html>