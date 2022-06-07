<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.sidebar {
	margin: 0;
	padding: 0;
	position: fixed;
	left: 0;
	width: 270px;
	height: 100%;
	background: #042331;
}

.sidebar header {
	font-size: 22px;
	color: white;
	text-align: center;
	line-height: 70px;
	background: #063146;
}

.sidebar ul {
	padding: 0;
}

.sidebar .nav-links a {
	display: block;
	text-decoration: none;
	width: 100%;
	line-height: 65px;
	font-size: 20px;
	color: #fff;
}

.sidebar .nav-links li {
	position: relative;
}

.sidebar .nav-links li i {
	height: 50px;
	min-width: 78px;
	text-align: center;
	line-height: 65px;
	color: #fff;
	font-size: 20px;
}

.sidebar .nav-links li a {
	display: flex;
	align-items: center;
}

.sidebar .nav-links li:hover a {
	padding-left: 10px;
}

.sidebar .nav-links li a {
	transition: .4s;
}

.sidebar .nav-links li .icon-link {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.sidebar .nav-links li .sub-menu {
	padding: 6px 6px 14px 80px;
	margin-top: -10px;
	background: #063140;
	display: none;
}

.sidebar .nav-links li.showMenu .sub-menu {
	display: block;
}

.sidebar .nav-links li .sub-menu a {
	height: 40px;
	color: #fff;
	font-size: 15px;
	padding: 5px 0;
	white-space: nowrap;
	opacity: 0.6;
	transition: all 0.3s ease;
}

.sidebar .nav-links li .sub-menu a:hover {
	opacity: 1;
}

.sidebar.close .nav-links li .sub-menu {
	position: absolute;
	left: 100%;
	top: -10px;
	margin-top: 0;
	padding: 10px 20px;
	border-radius: 0 6px 6px 0;
	transition: all 0.4s ease;
	opacity: 0;
	pointer-events: none;
}

.sidebar.close .nav-links li:hover .sub-menu {
	top: 0;
	opacity: 1;
	pointer-events: auto;
}

.sidebar .nav-links li .sub-menu .link_name{
	display: none;
}

.sidebar.close .nav-links li .sub-menu .link_name {
	font-size: 18px;
	opacity: 1;
	display: block;
}

.sidebar.close .nav-links li .sub-menu.blank {
	opacity: 1;
	pointer-events: auto;
	padding: 3px 20px 6px 16px;
}

</style>

<header>Admin</header>
		<ul class="nav-links">
			<li>
				<a href="admin.jsp"><i class="fas fa-columns"></i>
					<span class="link-name">대시보드</span>
				</a>
			</li>
			<li>
				<a href="#"><i class="fas fa-chart-line"></i>
					<span class="link-name">매출 현황</span>
				</a>
			</li>
			<li>
				<div class="icon-link">
					<a href="adminUser.jsp"><i class="far fa-address-card"></i>
						<span class="link-name">회원 관리</span>
					</a>
					<i class="fas fa-angle-down"></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="adminUser.jsp">회원 관리</a></li>
					<li><a href="#">전체 회원</a></li>
					<li><a href="#">권한 신청</a></li>
					<li><a href="#">회원 신고</a></li>
				</ul>
			</li>
			<li>
				<div class="icon-link">
					<a href="#"><i class="fas fa-inbox"></i>
						<span class="link-name">콘텐츠</span>
					</a>
					<i class="fas fa-angle-down"></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="#">콘텐츠</a></li>
					<li><a href="#">강의 승인</a></li>
					<li><a href="#">이벤트 관리</a></li>
				</ul>
			</li>
			<li>
				<div class="icon-link">
					<a href="adminCommunity.jsp"><i class="fas fa-chalkboard"></i>
						<span class="link-name">커뮤니티</span>
					</a>
					<i class="fas fa-angle-down"></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="#">커뮤니티</a></li>
					<li><a href="#">신고 관리</a></li>
					<li><a href="#">1:1 답변</a></li>
				</ul>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/"><i class="fas fa-sign-out-alt"></i>
					<span class="link-name">나가기</span>
				</a>
			</li>
		</ul>  
