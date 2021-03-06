<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="sidebar">
<header>Admin</header>
	<ul class="nav-links">
		<li>
			<a href="${pageContext.request.contextPath}/admin/admin"><i class="fas fa-columns"></i>
				<span class="link-name">대시보드</span>
			</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/admin/rev/main"><i class="fas fa-chart-line"></i>
				<span class="link-name">매출 현황</span>
			</a>
		</li>
		<li>
			<div class="icon-link">
				<a href="${pageContext.request.contextPath}/admin/memberManage/main"><i class="far fa-address-card"></i>
					<span class="link-name">회원 관리</span>
				</a>
			</div>
		</li>
		<li>
			<div class="icon-link">
				<a href="${pageContext.request.contextPath}/admin/contentManage/main"><i class="fas fa-inbox"></i>
					<span class="link-name">콘텐츠</span>
				</a>
			</div>
		</li>
		<li>
			<div class="icon-link">
				<a href="#"><i class="fas fa-chalkboard"></i>
					<span class="link-name">공지사항</span>
				</a>
				<i class="angle fa-solid fa-angle-down"></i>
			</div>
			<ul class="sub-menu">
				<li><a class="#" href="${pageContext.request.contextPath}/admin/noticeManage/main">공지사항</a></li>
				<li><a href="#">이벤트</a></li>
				<li><a href="#">FAQ</a></li>
				<li><a href="#">1:1문의</a></li>
			</ul>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/"><i class="fas fa-sign-out-alt"></i>
				<span class="link-name">나가기</span>
			</a>
		</li>
	</ul>  
</div>