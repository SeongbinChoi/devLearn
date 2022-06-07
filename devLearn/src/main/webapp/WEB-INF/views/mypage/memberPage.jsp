<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" type="text/css">

	<div class="section">
	
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
								<a class="nav-link active" aria-current="page" href="myPage-member-dashBoard.jsp">회원</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="myPage-mentor-dashBoard.jsp">멘토</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="myPage-instructor-dashBoard.jsp">강사</a>
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
							<a class="btn_wrap is_active" href="myPage-member-dashBoard.jsp">
								<span>대시보드</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="myPage-member-plan.jsp">
								<span>일정 관리</span>
							</a>
						</li>
					</ul>
					
					<p class="menu-label">학습관리</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap" href="myPage-member-lectures.jsp">
								<span>내 학습</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="myPage-member-mentor.jsp">
								<span>멘토링</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="#">
								<span>작성한 게시글</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="#">
								<span>수강전 문의</span>
							</a>
						</li>
					</ul>
					<p class="menu-label">수강신청 관리</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap" href="#">
								<span>수강바구니</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="#">
								<span>쿠폰함</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="#">
								<span>포인트</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="#">
								<span>구매내역</span>
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
