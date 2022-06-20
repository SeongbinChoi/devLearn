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

#qna ul li .clicked{
	color:#0d6efd;
	font-weight: bold;	
}


</style>

<script type="text/javascript">

$(function(){
	
	$('.qnaLink').removeClass("clicked");
	$('#qna${status}').addClass("clicked");
	
});


</script>

<jsp:include page="memberPage.jsp"/>
<div class="top-nav">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="tab1" data-bs-toggle="tab" data-bs-target="#qna" type="button" role="tab" aria-controls="qna" aria-selected="true">QnA</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tab2" data-bs-toggle="tab" data-bs-target="#study" type="button" role="tab" aria-controls="study" aria-selected="false" onclick="location.href='${pageContext.request.contextPath}/mypage/myWrite/myStudyWrite?status=2'">스터디</button>
		</li>
	</ul>
</div>

<!-- 탭 컨텐츠 -->
<div class="tab-content" id="myTabContent">

	<!-- QNA 탭 컨텐츠 -->
	<div id= "qna" class="tab-pane fade show active my-3" role="tabpanel" aria-labelledby="profile-tab">
		<div class="status-section d-flex align-items-center">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mypage/myWrite/myWrite?status=2" class="link qnaLink clicked" id="qna2">전체</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/myWrite/myWrite?status=0" class="link qnaLink" id="qna0">미해결</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/myWrite/myWrite?status=1" class="link qnaLink" id="qna1">해결</a></li>
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
			${dataCount == 0 ? "등록된 게시글이 없습니다." : qnaPaging }
		</div>
	</div>
	
</div>

