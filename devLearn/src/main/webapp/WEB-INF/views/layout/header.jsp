<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid header-top">
	<div class="container">
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"><span>DEV Learn</span></a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarScroll">
					<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
						<li class="nav-item dropdown mx-2">
							<a class="nav-link dropdown-toggle" href="" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">강의</a>
							<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/lectures/all">전체</a></li>
								<li><a class="dropdown-item" href="#">개발</a></li>
								<li><a class="dropdown-item" href="#">보안</a></li>
								<li><a class="dropdown-item" href="#">데이터 사이언스</a></li>
								<li><a class="dropdown-item" href="#">기타</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<a class="nav-link mx-2" href="${pageContext.request.contextPath}/mentors/mentor">멘토링</a>
						</li>
						<li class="nav-item dropdown mx-2">
							<a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
							<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/community/qnaList">Q&A</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/community/studyList">스터디</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown mx-2">
							<a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">공지사항</a>
							<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice/notice">공지사항</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice/eventList">이벤트</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice/faq">FAQ</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice/mTomInquiry">1:1문의</a></li>
							</ul>
						</li>
					</ul>
						<button class="btn me-2" id="elevationRole" type="button" onclick="location.href='${pageContext.request.contextPath}/member/infoShare';">지식공유자</button>
						&nbsp;
						<c:choose>
							<c:when test="${empty sessionScope.member}">
								<button class="btn btn-outline-primary" type="button" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
								&nbsp;
								<button class="btn btn-outline-danger" type="button" onclick="location.href='${pageContext.request.contextPath}/member/signUp';">회원가입</button>
							</c:when>
							<c:when test="${sessionScope.member.memberRole == 99}">
								<button class="btn btn-outline-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/member/logout';">로그아웃</button>
								&nbsp;
								<button class="btn btn-outline-danger" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage';">마이페이지</button>
								&nbsp;
								<button class="btn btn-outline-danger" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/admin';">관리</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-outline-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/member/logout';">로그아웃</button>
								&nbsp;
								<button class="btn btn-outline-danger" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage';">마이페이지</button>
								&nbsp;
								<button class="btn btn-outline-success" type="button" onclick="location.href='${pageContext.request.contextPath}/member/pwdCheck';">정보수정</button>
							</c:otherwise>
						</c:choose>
				</div>
			</div>
		</nav>
	</div>
</div>

