<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.sideBar {
	width: 18%;
}
	

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.sideBar {
	width: 18% !important;
}

.menu-label{
	color: #CFCFCF;
	margin-bottom: 12px;
}

.side-content ul {
	width:100%;
	list-style: none;
	margin-bottom: 15px;
}

.side-content ul li a {
	text-decoration: none;
	color: #454545;
	font-weight: 700;
	cursor: pointer;
}

.side-content ul li a:hover {
	background: rgba(0,0,0,0.03);
}

.menu-label {
	font-size: 14px;
}

.side-content p:nth-of-type(2) {
	margin-top: 12px;
} 

.side-content p:nth-of-type(3) {
	margin-top: 12px;
}

.side-content p:last-of-type {
	margin-top: 100px;
}
.menu-label{
	color: #CFCFCF;
	margin-bottom: 12px;
}

.side-content ul {
   	margin: 0;
	padding-left: 0;
	list-style: none;
	display: inline-block;
}
.side-content ul:last-of-type{
	margin-bottom: 50px;
}
.side-content ul li a {
	text-decoration: none;
	color: #454545;
	font-weight: 700;
	cursor: pointer;
	display : block;
	padding: 8px 12px;
	font-weight: 700;
	border-radius: 5px;
}

.menu-list .is_active {
	color: #0d6efd;
}
.side-content ul li a span{
	padding-left: 5px;
}

.banner{
	background: #333b3d;
	height: 60px;
}

.banner-title {
	color: #fff;
	font-size: 25px;
	margin-right: 20px;
}
.banner-title a {
	text-decoration: none;
	color: #fff;
}

.banner-nav a {
	color: #fff;
}


.section {
	background: rgba(0,0,0,0.03);
}

</style>
<body>

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
									<a class="nav-link topNav_mentor">멘토</a>
								</c:if>
							</li>
							<li class="nav-item">
								<c:if test="${sessionScope.member.memberRole eq '20' || sessionScope.member.memberRole eq '30'}">
									<a class="nav-link topNav_instructor active" aria-current="page"  href="${pageContext.request.contextPath}/instructorPage/instructorPageDashBoard">강사</a>
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
							<a class="btn_wrap" href="${pageContext.request.contextPath}/instructorPage/instructorPageDashBoard">
								<span>대시보드</span>
							</a>
						</li>	
					</ul>
					
					<p class="menu-label">강의 관리</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/instructorPage/instructorPageQnaList">
								<span>강의 문의 리스트</span>
							</a>
						</li>	
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/instructorPage/instructorPageLectureList">
								<span>강의 관리</span>
							</a>
						</li>
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/instructorPage/instructorPageRev">
								<span>수익 확인</span>
							</a>
						</li>
					</ul>
					<p class="menu-label">새 강의 만들기</p>
					<ul class="menu-list">
						<li>
							<a class="btn_wrap" href="${pageContext.request.contextPath}/instructorPage/instructorPageNewLecture">
								<span>강의 등록</span>
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