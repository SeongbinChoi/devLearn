<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberPageDashboard.css" type="text/css">	

<jsp:include page="memberPage.jsp"/>
	
	<div class="chart-section">
		<div class="profile">
			<p>${sessionScope.member.memberNickname}님 프로필</p>
			<div class="content">
				<p>프로필 내용 출력</p>
				<p>프로필 내용 출력</p>
				<p>프로필 내용 출력</p>
				<p>프로필 내용 출력</p>
				<p>프로필 내용 출력</p>
				<p>프로필 내용 출력</p>
				<p>프로필 내용 출력</p>
				<p>프로필 내용 출력</p>
				<p>프로필 내용 출력</p>
				<p>프로필 내용 출력</p>
			</div>
			<div class="cardEnd">
				<a href="${pageContext.request.contextPath}/mypage/profile">프로필 전체 보기</a>
			</div>
		</div >
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
				<button type="button" class="btn ">내 모든 강의</button>
				<button type="button" class="btn">이어서 학습하기</button>
			</div>
		</div>
		<div class="my-lectuer">
			<p>최근 학습중인 강의</p>
			<div class="content">
				<table class="myLectureTable">
					<c:forEach var="i" begin="1" end="5">
						<tr class="click" style="cursor: pointer;" onclick="강의 이어보기">
							<td>스프링 마스터 스프링 마스터 스프링 마스터 스프링 마스터 스프링 마스터 스프링 마스터 스프링 마스</td>
							<td>3일전</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="cardEnd">
				<a href="myPage-member-lectures.jsp">내 강의 전체 보기</a>
			</div>
		</div>
		<div class="statistics">
			<p>학습 통계</p>
			<div class="statistics-card d-flex justify-content-evenly align-items-center">
				<div class="cards">
					<div class="statistics-num">
						<p>12</p>
					</div>
					<p>구매한 강의</p>
				</div>
				<div class="cards">
					<div class="statistics-num">
						<p>123</p>
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
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>
				<p>완료한 강의 이름 완료한 강의 이름완료한 강의 이름완료한 강의 이름완료한 강의 이름</p>				
			</div>
			<div class="cardEnd">
				<a href="myPage-member-lectures.jsp">내 강의 전체 보기</a>
			</div>
		</div>
	</div>
