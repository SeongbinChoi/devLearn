<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentorPage.css" type="text/css">

	<div class="banner container-fluid d-flex  align-items-center">
			<div class="container banner-container d-flex align-items-center">
				<div class="banner-item container-fluid d-flex align-items-center ">
					<div class="banner-title">
						<a href="#">
							<span>마이 페이지</span>
						</a>
					</div>
					<div class="banner-nav ">
						<ul class="nav nav-pills">
							<li class="nav-item">
								<a class="nav-link topNav_member "href="${pageContext.request.contextPath}/mypage/mypage">회원</a>
							</li>
							<li class="nav-item">
								<a class="nav-link active topNav_mentor" aria-current="page"  href="myPage-mentor-dashBoard.jsp">멘토</a>
							</li>
							<li class="nav-item">
							<c:if test="${sessionScope.member.memberRole eq '30'}">
								<a class="nav-link topNav_instructor " href="myPage-instructor-dashBoard.jsp">강사</a>
							</c:if>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
	<main>
		<div class="container body_container d-flex my-5">
			<div class="sideBar container">
				<div class="side-content">
					<p class="menu-label">HOME</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap is_active" href="${pageContext.request.contextPath}/mentorPage/dashboard">
								<span>대시보드</span>
							</a>
						</li>	
					</ul>
					
					<p class="menu-label">멘토링 관리</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mentorPage/mentoringManage">
								<span>멘토링 관리</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mentorPage/applyManage">
								<span>신청 관리</span>
							</a>
						</li>		
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mentorPage/planManage">
								<span>멘토링 일정</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mentorPage/revenueManage">
								<span>수익 관리</span>
							</a>
						</li>
						
					</ul>
					<p class="menu-label">설정</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap" href="myPage-noti.jsp">
								<span>알림</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="myPage-profile.jsp">
								<span>프로필</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="myPage-setNoti.jsp">
								<span>알림설정</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		
			<div class="main_container container">
