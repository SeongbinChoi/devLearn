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

#study tbody tr:hover {
	cursor: pointer;
}

#study ul li .s_clicked{
	color:#0d6efd;
	font-weight: bold;	
}

</style>

<script type="text/javascript">

$(function(){
	
	$('.studyLink').removeClass("s_clicked");
	$('#study${status}').addClass("s_clicked");
	
});


$(function(){
	$('.apply').click(function(){
		$('#applyConfirmModal').modal('show');
	});
});

</script>

<jsp:include page="memberPage.jsp"/>
<div class="top-nav">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tab1" data-bs-toggle="tab" data-bs-target="#qna" type="button" role="tab" aria-controls="qna" aria-selected="false" onclick="location.href='${pageContext.request.contextPath}/mypage/myWrite/myWrite?status=2'">QnA</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="tab2" data-bs-toggle="tab" data-bs-target="#study" type="button" role="tab" aria-controls="study" aria-selected="true">스터디</button>
		</li>
	</ul>
</div>

<!-- 탭 컨텐츠 -->
<div class="tab-content" id="myTabContent">

	<!-- study 탭 컨텐츠 -->
	<div id= "study" class="tab-pane fade show active my-3" role="tabpanel" aria-labelledby="profile-tab">
		<div class="status-section d-flex align-items-center">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mypage/myWrite/myStudyWrite?status=2" class="link studyLink s_clicked" id="study2">전체</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/myWrite/myStudyWrite?status=0" class="link studyLink" id="study0">모집중</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/myWrite/myStudyWrite?status=1" class="link studyLink" id="study1">모집완료</a></li>
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
					<th style="width: 12%;">지원자</th>	
					<th style="width: 10%;">모집완료</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list}">
					<tr onclick="location.href='${studyArticleUrl}&studyNum=${vo.studyNum}'">
						<td>${vo.region}</td>
						<td>${vo.subject}</td>
						<td>${vo.regDate}</td>
						<td>${vo.applied}/${vo.limit}</td>
						<td>${vo.status == 0 ? "모집중" : "모집완료"}</td>
						<td><button type="button" class="btn btn-secondary apply">확인하기</button>
						<c:choose>
							<c:when test="${vo.status == 0}">
								<td><button type="button" class="btn btn-secondary">완료</button></td>
							</c:when>
							<c:otherwise>
								<td><button type="button" class="btn btn-secondary" disabled="disabled">완료</button></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }
		</div>
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



<!-- 지원자 확인 모달 -->
<div class="modal fade" id="applyConfirmModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">지원자 확인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td width="15%">번호</td>
						<td width="30%" class="table-light col-3 align-middle">이름</td>
						<td>이메일</td>
						<td width="20%">승인</td>
					</tr>
					<c:forEach var="i" begin="1" end="10">
						<tr>
							<td>${i}</td>
							<td class="table-light col-3 align-middle">김자바</td>
							<td>user@naver.com</td>
							<td><button type="button" class="btn btn-primary">승인</button></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
