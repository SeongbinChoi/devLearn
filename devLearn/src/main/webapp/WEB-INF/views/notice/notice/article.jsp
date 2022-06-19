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

.article .article_title {
	width: 100%;	
	font-size: 33px;
	font-weight: bold;
}

.article .article_body {
	display : flex;
}

.article .article_content {
	flex: none;
	width: 75%;
    font-size: 16px;
}

.article .article_post {
	flex: none;
	width: 25%;
	border: 1px solid #cfcfcf;
    border-radius: 3px;
    padding: 1rem;
    min-height: 150px;
}

.article .article_body .article_post .article_label {
	font-size: .85rem;
    font-weight: 400;
    color: #929292;
}

.reply-form textarea { 
	width: 100%; 
	height: 75px;
	height: 120px;
}


.mr {
	flex: none;
	margin-right: 8px;
}

.writer {
	flex: none;
	font-size : 18px;
}

ul {
	font-size: 14px;
    list-style: none;
}

li {
	margin-bottom: 3px;	
}

.button {
	background-color: #fff;
    border-width: 1px;
    color: #363636;
    justify-content: center;
    padding: calc(0.375em - 1px) 0.75em;
    text-align: center;
    white-space: nowrap;
    box-shadow: none;
    border-radius: 4px;
    border: 1px solid #dbdbdb;
}

img {
	width: 100%;
}
</style>

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>새소식</span></p>
			</div>
		</div>
	</div>
	
	<div class="contentBody container col-11 my-5">
		<div class="sideMenu col-2">
			<div class="card">
				<div class="card-header">
				  공지사항
				</div>
				<a class="list-group-item list-group-item-action active" aria-current="true" href="#">· 공지사항</a>
				<a class="list-group-item list-group-item-action" href="#">· 이벤트</a>
				<a class="list-group-item list-group-item-action" href="#">· FAQ & 1:1문의</a>
			</div>
		</div>
			
		<div class="article col-9" style="margin: 0 auto;">
			<div class="article_title">
				<p>${dto.subject}</p>
			</div>
			<hr>
			<div class="article_body">
				<div class="article_content pt-3 pe-5">
					<div class="pb-3 d-flex">
						<p class="writer mr"><b>작성자: ${dto.nickName}</b> <i class="fas fa-check-circle"></i></p> <p class="ms-auto" style="text-align: right;">${dto.regDate}</p>
					</div>
					<p class="pb-3">
					</p>
					${dto.content}
				<hr class="mt-5">
					
					
				</div>
				
				<div class="article_post col-3">
					<p class="article_label">최근 인프런 소식</p>
					<ul style="padding-left: 0px;"> 
						<c:forEach var="subject" items="${subjectList}">
							<li><a href="${pageContext.request.contextPath}/notice/notice/article?noticeNum=${subject.noticeNum}">✓${subject.subject}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>	
	</div>
