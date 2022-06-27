<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberPageDashboard.css" type="text/css">	

<style type="text/css">

.chart-section .profile .profile-small-title {
	padding-top: 10px;
	padding-left: 20px;
	font-size: 15px;
	font-weight: bold;
	color: gray;
}

.profile-small-title i {
	margin-right: 5px;
}

.profile-title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 0;
	margin-left: 8px;
}


.profile-title span {
	font-size: 23px;
	color: #0d6efd;
}

.profile-img img {
	width: 65px;
	height: 65px;
}

.chart-section .profile .content {
	display: flex;
	align-items: center;
	height: 65px;
	margin-top: 15px;
}

.click {
	height: 40px;
}

</style>

<jsp:include page="memberPage.jsp"/>
	
	<div class="chart-section">
		<div class="profile">
			<p class="profile-small-title"><i class="fa-regular fa-user"></i>${sessionScope.member.memberNickname}님 프로필</p>
			<div class="content">
				<div class="profile-img">
					<c:choose>
						<c:when test="${dto.saveFileName != null }">
							<img src="${pageContext.request.contextPath}/uploads/profile/${dto.saveFileName}" class="is-rounded rounded-circle" alt="" >
						</c:when>
						<c:otherwise>
							<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded rounded-circle" alt="" >
						</c:otherwise>
					</c:choose>
				</div>
				<p class="profile-title"><span>${sessionScope.member.memberNickname}</span>님 안녕하세요 ^.^</p>
			</div>
			<div class="cardEnd">
				<a href="${pageContext.request.contextPath}/mypage/profile">프로필 전체 보기</a>
			</div>
		</div>
		<div class="recent-lecture">
			<p>최근 학습 강의</p>
			<div class="curr-content">
				<p class="lec-title">최근학습 강의최근학습 강의최근학습 강의최근학습 강의최근학습 강의최근학습 강의최근학습 강의최근학습 강의</p>
				<div class="curr-prog-sec">
					<span>진행률  12.8%</span> | <span>기한 : 무제한</span>
					<progress class="curr-lec-prog" value="12.8" max="100"></progress>
				</div>
			</div>
			<div class="cardEnd">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/myStudy'">내 모든 강의</button>
				<button type="button" class="btn">이어서 학습하기</button>
			</div>
		</div>
		<div class="my-lectuer">
			<p>최근 구매한 강의</p>
			<div class="content">
				<table class="myLectureTable">
					<c:forEach var="rec" begin="1" end="5" items="${recentList}">
						<tr class="click" style="cursor: pointer;" onclick="강의 이어보기">
							<td>${rec.lectureSubject}</td>
							<td>${rec.lectureSdate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="cardEnd">
				<a href="${pageContext.request.contextPath}/mypage/myStudy">내 강의 전체 보기</a>
			</div>
		</div>
		<div class="statistics">
			<p>학습 통계</p>
			<div class="statistics-card d-flex justify-content-evenly align-items-center">
				<div class="cards">
					<div class="statistics-num">
						<p>${lecture.totalLectureNum}</p>
					</div>
					<p>구매한 강의</p>
				</div>
				<div class="cards">
					<div class="statistics-num">
						<p>${lecture.finishLectureNum}</p>
					</div>
					<p>완료한 수업</p>
				</div>
				<div class="cards">
					<div class="statistics-num">
						<p>2</p>
					</div>
					<p>완료한 강의</p>
				</div>
			</div>
		</div>
		<div class="over-lectuer">
			<p>완료한 강의</p>
			<div class="content">
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
			</div>
			<div class="cardEnd">
				<a href="${pageContext.request.contextPath}/mypage/myStudy">내 강의 전체 보기</a>
			</div>
		</div>
	</div>
