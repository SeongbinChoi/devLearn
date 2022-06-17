<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.status-section {
	height: 60px;
	padding: 12px 8px;
	border: 1px solid #ddd;
	border-radius: 10px;
}
	
.status-section ul {
	padding: 0;
	margin: 0 0 0 40px;
	list-style: none;

}

.status-section li {
	float: left;
	margin-right: 25px;
}

.status-section li a:not(.is-active) {
	text-decoration: none;
	color: #aaa;
}

.status-section li a:hover {
	color: #0d6efd;
	font-weight: 700;
}

.is-active {
	color: #0d6efd;
	font-weight: 700;
	text-decoration: none;
}

table {
	width: 100%;
	text-align: center;
	vertical-align: middle;
}

th, td {
	vertical-align: middle;
	height: 55.5px;
}

.myQuestion td:nth-child(5n+2), .applyStudy-table td:nth-child(6n+2) , .mystudy-table td:nth-child(6n+2){
	text-align: left;
	padding-left: 5px;
}

.myQuestion tbody tr:hover {
	cursor: pointer;
}

</style>

<jsp:include page="memberPage.jsp"/>
<div class="top-nav">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#qna" type="button" role="tab" aria-controls="qna" aria-selected="true">QnA</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#study" type="button" role="tab" aria-controls="study" aria-selected="false">스터디</button>
		</li>
	</ul>
</div>

<!-- 탭 컨텐츠 -->
<div class="tab-content" id="myTabContent">

	<!-- QNA 탭 컨텐츠 -->
	<div id= "qna" class="tab-pane fade show active my-3" role="tabpanel" aria-labelledby="profile-tab">
		<div class="status-section d-flex align-items-center">
			<ul>
				<li><a href="#" class="is-active">전체</a></li>
				<li><a href="#">미해결</a></li>
				<li><a href="#">해결</a></li>
			</ul>
		</div>
		<h3 class="mt-3">등록한 질문</h3><span>총 ${dataCount}개</span>
		<table class="myQuestion table table-striped">
			<thead>
				<tr>
					<th style="width:10%;">글번호</th>
					<th>제목</th>
					<th style="width:15%;">등록일</th>
					<th style="width:15%;">상태</th>
					<th style="width:10%;">답변 수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr onclick="">
						<td>${dto.listNum}</td>
						<td>${dto.subject}</td>
						<td>${dto.regDate}</td>
						<td>${dto.selected == 0 ? "미해결" : "해결"}</td>
						<td>${dto.replyNum}</td>
					</tr>
				</c:forEach>
				
			</tbody>	
		</table>
		
		<div>
			${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }
		</div>
	</div>
	
	<!-- study 탭 컨텐츠 -->
	<div id= "study" class="tab-pane fade my-3" role="tabpanel" aria-labelledby="profile-tab">
		<div class="status-section d-flex align-items-center">
			<ul>
				<li><a href="#" class="is-active">전체</a></li>
				<li><a href="#">모집중</a></li>
				<li><a href="#">모집완료</a></li>
			</ul>
		</div>
		<h3 class="mt-3">모집한 스터디</h3>
		<table class="mystudy-table table table-striped"><!-- 내가 모집한 스터디 목록 -->
			<thead>
				<tr>
					<th style="width: 8%;">지역</th>
					<th>제목</th>
					<th style="width: 13%;">등록일</th>
					<th style="width: 10%;">모집 인원</th>
					<th style="width: 12%;">상태</th>
					<th style="width: 10%;">모집완료</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>서울</td>
					<td>오라클 스터디</td>
					<td>2022-05-10</td>
					<td>4/8</td>
					<td>모집중</td>
					<td><button type="button" class="btn btn-secondary">완료</button></td>
				</tr>
				<tr>
					<td>경기</td>
					<td>스프링 스터디</td>
					<td>2022-02-10</td>
					<td>2/2</td>
					<td>모집완료</td>
					<td><button type="button" class="btn btn-secondary" disabled="disabled">완료</button></td>
				</tr>
				<tr>
					<td>경기</td>
					<td>스프링 스터디</td>
					<td>2022-02-10</td>
					<td>2/2</td>
					<td>모집완료</td>
					<td><button type="button" class="btn btn-secondary" disabled="disabled">완료</button></td>
				</tr>
			</tbody>
		</table>
		<!--  ---------------------------------------------------------------------- -->
		<h3 class="mt-3">지원한 스터디</h3>
		<table class="applyStudy-table table table-striped">
			<thead>
				<tr>
					<th style="width: 8%;">지역</th>
					<th>제목</th>
					<th style="width: 13%;">등록일</th>
					<th style="width: 10%;">모집 인원</th>
					<th style="width: 12%;">상태</th>
					<th style="width: 10%;">지원취소</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>서울</td>
					<td>오라클 스터디</td>
					<td>2022-05-10</td>
					<td>4/8</td>
					<td>모집중</td>
					<td><button type="button" class="btn btn-secondary">취소</button></td>
				</tr>
				<tr>
					<td>경기</td>
					<td>스프링 스터디</td>
					<td>2022-02-10</td>
					<td>2/2</td>
					<td>모집완료</td>
					<td><button type="button" class="btn btn-secondary" disabled="disabled">취소</button></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

