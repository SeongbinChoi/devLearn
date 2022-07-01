<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.search-section {
	padding-bottom: 10px;
	align-items: flex-end;
	justify-content: space-between;
}
.select {
	margin-right: 15px;
	width: 180px;
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
	height: 750px;
	gap : 17px;
	padding-left: 15px;
}

.cards {
	width: 330px;
	height: 330px;
	overflow: hidden;
	margin-bottom: 30px;
	border: 1px solid #CFCFCF;
	border-radius: 8px;
}

.title {
	width: 97%;
	margin: 0 auto;
	justify-content: space-between;
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

.searchForm {
	width: 630px;
}

img {
	height: 200px;
}

</style>

<script>
function searchList() {
	const f = document.searchForm;
	f.submit();
}
function filterList() {
	const f = document.filterForm;
	f.submit();
}

</script>


<jsp:include page="memberPage.jsp"/>
		<h2>보유한 강의</h2>
		<div class="search-section d-flex mb-2 border-bottom">
			<form name="filterForm" class="filterForm" method="post" action="${pageContext.request.contextPath}/mypage/myLecture">
				<div class="select">
					<p>정렬 기준</p>
					<select name="order" class="form-select" style="width: 180px;" onchange="filterList();">
						<option value="2" ${order=="2"?"selected='selected'":""}>최근 수강 신청</option>
						<option value="0" ${order=="0"?"selected='selected'":""}>제목 순</option>				
					</select>
				</div>
			</form>
			<!-- 
			<div class="select">
				<form action="" >
					<p>진행률</p>
					<select class="form-select">
						<option>모두보기</option>
						<option>진행중</option>
						<option>완강</option>				
					</select>
				</form>
			</div>
			 -->
			<div class="d-flex" style=" width:750px;  height: 38px;">
				<button type="button" class="btn btn-primary mx-2" onclick="location.href='${pageContext.request.contextPath}/mypage/myLecture';">새로고침</button>
				<form name="searchForm" class="searchForm" method="post" action="${pageContext.request.contextPath}/mypage/myLecture">
					<div class="input-group align-self-end">
						<input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="강의명 또는 강사 이름으로 검색" aria-label="Recipient's username" aria-describedby="searchBtn">
						<button class="btn btn-primary" type="button" id="searchBtn" onclick="searchList();">검색</button>
						<input type="hidden" name="rows" value="${rows}">
					</div>
				</form>
			</div>
		</div>
		
		<div class="lecture-section mt-3">
			<c:forEach var="dto" items="${list}">
				<div class="cards">
					<c:choose>
						<c:when test="${dto.thumbnail != null}">
							<img src="${pageContext.request.contextPath}/uploads/thumbNail/${dto.thumbnail}" style="width: 100%;">
						</c:when>
						<c:otherwise>
							<img src="https://cdn.inflearn.com/public/courses/324844/course_cover/db70e7cf-b214-4985-830f-5fd824ae7e74/bgs-spring-jpa.jpg" style="width: 100%;">
						</c:otherwise>
					</c:choose>
					<div class="title d-flex align-items-center px-2">
						<p>${dto.lectureSubject}</p>
						<a href="#"><i class="fa-solid fa-circle-play"></i></a>
					</div>
					<div class="curr-prog-sec px-2">
						<span>진행률  12.8%</span> | <span>기한 : ${dto.lectureEdate == null ? "무제한" : dto.lectureEdate }</span>
						<progress class="curr-lec-prog" value="12.8" max="100"></progress>
					</div>
				</div>

			</c:forEach>
		</div>
	<div class="question px-3 py-1">
		${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
	</div>
