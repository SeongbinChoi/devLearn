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
								<a class="nav-link topNav_member "href="${pageContext.request.contextPath}/mypage/mypage">회원</a>
							</li>
							<li class="nav-item">
								<c:if test="${sessionScope.member.memberRole eq '10' || sessionScope.member.memberRole eq '30'}">
									<a class="nav-link active topNav_mentor" aria-current="page"  href="${pageContext.request.contextPath}/mentorPage/dashboard">멘토</a>
								</c:if>
							</li>
							<li class="nav-item">
								<c:if test="${sessionScope.member.memberRole eq '20' || sessionScope.member.memberRole eq '30'}">
									<a class="nav-link topNav_instructor " href="${pageContext.request.contextPath}/instructorPage/instructorPageDashBoard">강사</a>
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
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/mypage">
								<span>대시보드</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/myPlan/planMain">
								<span>일정 관리</span>
							</a>
						</li>
					</ul>
					
					<p class="menu-label">학습관리</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/myStudy">
								<span>내 학습</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/mentor">
								<span>멘토링</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/myWrite/myWrite">
								<span>작성한 게시글</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/myInquiry">
								<span>수강전 문의</span>
							</a>
						</li>
					</ul>
					<p class="menu-label">수강신청 관리</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/cart">
								<span>수강바구니</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/like">
								<span>좋아요</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/coupon">
								<span>쿠폰함</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/point">
								<span>포인트</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/purchased">
								<span>구매내역</span>
							</a>
						</li>
					</ul>
					<p class="menu-label">설정</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/noti">
								<span>알림</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/profile">
								<span>프로필</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/mypage/setNoti">
								<span>알림설정</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		
			<div class="main_container container">
