<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
*{
	margin: 0;  padding: 0; box-sizing: border-box;
}


.banner {
	height: 200px;
	background: #333B3D;
	color: white;
}

.banner .title span {
	font-size: 25px;
	font-weight: bold;
}


.contentBody {
	display: flex;
}

.contentBody a {
	color: black; text-decoration: none; outline: none;
}

.contentBody a:hover {
	text-decoration: none;
}

.contentBody .picked {
	color: #0d6efd;
}

.sideMenu {
	font-weight: bold;
	color: gray;
}

.sideMenu a {
	color: gray;
}

.contentHeader {
	display: flex;
	justify-content: space-between;
}

.contentHeader .nav a {
	font-weight: bold;
	color: gray;
}

.contentHeader .nav a:active {
	color: #0d6efd;
}

.contentHeader .nav a:hover {
	color: #0d6efd;
}

.contentHeader {
	display: flex;
	justify-content: space-between;
}

.contentHeader .nav a {
	font-weight: bold;
	color: gray;
}

.contentHeader .nav a:active {
	color: #0d6efd;
}

.contentHeader .nav a:hover {
	color: #0d6efd;
}

.notice .notice_title {
	font-size: 26px;
	font-weight: bold;
}

.notice .notice_body {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.notice .body_content {
	font-size: .75rem;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 원하는 줄 수 표시 */
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.notice .notice_footer {
	font-weight: bold;
	color: #BDBDBD;
}

.notice_content {
	
}

.title_start {
	color : #0d6efd;
	margin-right: 7px;
}

.answerNum {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	border: 1px solid #BDBDBD;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	color: gray;
}

.answerNum .num_center {
	text-align: center;
}

.mr {
	margin-right: 8px;
}
</style>

<script type="text/javascript">

</script>

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>인프런의 새로운 소식들!</span><br>신규 콘텐츠, 이벤트, 기능 추가 등의 새로운 인프런의 이야기를 들어주세요.</p>
			</div>
		</div>
	</div>
	
	<div class="contentBody container col-11 my-5">
	
		<div class="sideMenu col-2">
			<div class="card">
				<div class="card-header">
				  공지사항
				</div>
				<a class="list-group-item list-group-item-action active" aria-current="true" href="${pageContext.request.contextPath}/notice/notice">· 공지사항</a>
				<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/eventList">· 이벤트</a>
				<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/faq">· FAQ </a>
				<c:if test="${sessionScope.member.memberEmail != null}">
					<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/mTomInquiry">· 1:1문의 </a>
				</c:if>
			</div>
		</div>
			
		<div class="mainContent col-9" style="margin: 0 auto;">
			<!-- 질문 -->
			<c:forEach var="vo" items="${list}" varStatus="status">
				<div class="notice px-3">
					<a href="${pageContext.request.contextPath}/notice/notice/article?noticeNum=${vo.noticeNum}">
						<div class="notice_info">
							<div class="notice_title">
								<p><span class="title_start">N.</span>${vo.subject}</p>
							</div>
							
							<div class="notice_body col-12"> 
								<div class="body_content col-10">
									<span class="notice_content mr">${vo.regDate}</span> <span class="notice_content mr">글쓴이: ${vo.nickName}<i class="fas fa-check-circle"></i></span> <span class="notice_content mr">대상 : 전체</span>
								</div>
							</div>
						</div>
					</a>
				</div>
			<hr>
			
			</c:forEach>
	
			<div class="page-box">
				${paging}
			</div>
		</div>
	</div>
	
