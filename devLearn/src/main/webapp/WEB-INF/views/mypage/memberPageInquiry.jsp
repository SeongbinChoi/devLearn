<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
.topSection {
	display: flex;
	justify-content: space-between;
}

.solved , .lectuers {
	height: 40px;
	padding: 5px;
	border-radius: 5px;
	margin-right: 15px;
	border: 1px solid #ddd; 
}

.solved:hover , .lectuers:hover {
	outline: 5px solid rgba(13,110,253, .2);
	border-radius: 5px;
}

.searchSection {
	height: 40px;
	display: flex;
	align-items: stretch;
	border: 1px solid #ddd; 
	border-radius: 5px;
	overflow: hidden;
	z-index: 9999;
	background: #ddd;
}

.searchSelect {
    padding: 5px;
    border: none;
}

.searchSection:hover {
	outline: 5px solid rgba(13,110,253, .2);
	border-radius: 5px;
}

.searchSection input {
	border: none;
	width: 250px;
	padding: 0 12px;
}

.searchSection input:focus {
	outline: none;
	border:none;
}

.searchSection button {
	border: none;
	background: #0d6efd;
	color: #fff;
	font-weight: 700;
	padding: 0 16px;
}

.searchSection select, .searchSection input , .searchSection button{
	display: block;
}

.inquiry-card {
	width: 100%;
	padding: 16px 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-bottom: 5px;
}

.card-title {
	display: flex;
	justify-content: space-between;
	padding-bottom: 16px;	
	border-bottom: 1px solid #ddd;
}

.title-text a {
	text-decoration: none;
	color: #000;
	font-weight: 800;
	padding-bottom: 20px;
}

.title-text a:hover {
	color: #0d6efd;
}

.title-text button {
	border: none;
	background: none;
	color: #999;
}

.title-status {
	align-self: flex-end;
}

.status {
	height: 48px;
	width: 100px;
	line-height: 42px;
	text-align: center;
	font-weight: 800;
}

.commented {
	color:  #0d6efd;
	border: 2px solid #0d6efd;
}

.notCommented {
	color: #f00;
	border: 2px dotted #f00;
}

.inquiry {
	border-bottom: 1px solid #ddd;
}
.answer-content {
	padding-top: 16px;
	display: flex;
}

.instructor-content {
	margin-left: 5px;
}	

.profilePic {
	margin-right: 5px;
}

figure img {
	width: 32px;
	height: 32px;
}

.instructor-info span:first-of-type {
	font-weight: 800;
}

.instructor-info {
	height: 32px;
}
</style>
</head>
<body>
<jsp:include page="memberPage.jsp"/>
	<div class="topSection">
		<div class="selects">
			<select class="solved">
				<option>해결/미해결</option>
				<option>미해결</option>
				<option>해결</option>
			</select>
			<select class="lectuers">
				<option>전체강의</option>
				<option>강의1</option>
				<option>강의2</option>
			</select>
		</div>
		
		<div class="searchSection ">
			<select class="searchSelect">
				<option>문의 내용</option>
				<option>문의 번호</option>
			</select>
			<div style="width: 1px; background: #ddd;"> </div>
			<input type="text" id="" placeholder="(으)로 검색하기">
			<button type="button" onclick="">검색</button>
		</div>
	</div>
	
	<div class="inquiry-content my-3">
		<div class="inquiry-card">
			<div class="inquiry">
				<div class="card-title">
					<div class="title-text">
						<a href="#">강의제목강의제목강의제목강의제목강의제목</a><br>
						<span>2022-02-02</span> | <span>22002(글번호)</span> |
						<button type="button">수정</button>
						<button type="button">삭제</button>
					</div>
					<div class="title-status">
						<div class="status rounded-pill commented">답변 완료!</div>
					</div>	
				</div>
				<div class="inquiry-content">
					<p>질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용</p>
					<p>질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용</p>
					<p>질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용</p>
					<p>질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용</p>
				</div>
			</div>
			<div class="answer-content">
				<div class="profilePic">
					<figure class="figure">
						<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded rounded-circle" alt="" >
					</figure>
				</div>
				<div class="instructor-content">
					<div class="instructor-info">
						<span>강사이름</span> | 
						<span>2022-02-02</span> | 
						<span>101010(답변번호)</span>
					</div>
					<div class="answerContent">
						<p>질문답변 질문답변 질문답변 질문답변 질문답변 질문답변 </p>
						<p>질문답변 질문답변 질문답변 질문답변 질문답변 질문답변 </p>
						<p>질문답변 질문답변 질문답변 질문답변 질문답변 질문답변 </p>
						<p>질문답변 질문답변 질문답변 질문답변 질문답변 질문답변 </p>
						<p>질문답변 질문답변 질문답변 질문답변 질문답변 질문답변 </p>
						<p>질문답변 질문답변 질문답변 질문답변 질문답변 질문답변 </p>
						<p>질문답변 질문답변 질문답변 질문답변 질문답변 질문답변 </p>
					</div>
				</div>
			</div>
		</div>
		<div class="inquiry-card">
			<div class="card-title">
				<div class="title-text">
					<a href="#">강의제목강의제목강의제목강의제목강의제목</a><br>
					<span>2022-02-02</span> | <span>22002(글번호)</span> |
					<button type="button">수정</button>
					<button type="button">삭제</button>
				</div>
				<div class="title-status">
					<div class="status rounded-pill notCommented">미답변</div>
				</div>	
			</div>
			<div class="inquiry-content">
				<p>질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용</p>
				<p>질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용</p>
				<p>질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용</p>
				<p>질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용질문 내용</p>
			</div>
		</div>		
	</div>		
</main>
</body>
</html>