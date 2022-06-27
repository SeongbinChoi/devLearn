<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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

.flexForm {
	display: flex;
}
</style>


<script>
function searchList() {
	const f = document.searchForm;
	f.submit();
}
function filterList() {
	const f = document.filterForm;
	f.submit();
}
function deleteData() {
	let inquiryNum = $("#deleteBtn").attr("data-num");
    if(confirm("게시글을 삭제하시겠습니까 ? ")) {
	    let query = "inquiryNum="+inquiryNum;
	    let url = "${pageContext.request.contextPath}/mypage/myInquiry/delete?" + query;
    	location.href = url;
    }
}
</script>

<jsp:include page="memberPage.jsp"/>
	<div class="topSection">
		<div class="flexForm">
			<form name="filterForm" method="post" action="${pageContext.request.contextPath}/mypage/myInquiry">
				<div class="selects">
					<select name="status" class="solved" onchange="filterList();">
						<option value="2" ${status==2 ? "selected='selected' ":""}>전체</option>
						<option value="0" ${status==0 ? "selected='selected' ":""}>미답변</option>
						<option value="1" ${status==1 ? "selected='selected' ":""}>답변완료</option>
					</select>
					<input type="hidden" name="condition" value="${condition}">
					<input type="hidden" name="keyword" value="${keyword}">
				</div>
			</form>
			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/mypage/myInquiry';">새로고침</button>
		</div>
		
		<form name="searchForm" method="post" action="${pageContext.request.contextPath}/mypage/myInquiry">
			<div class="searchSection ">
				<select name="condition" class="searchSelect">
					<option value="content" ${condition=="content"?"selected='selected'":""}>문의 내용</option>
					<option value="title" ${condition=="title"?"selected='selected'":""}>강의 제목</option>
				</select>
				<div style="width: 1px; background: #ddd;"> </div>
				<input type="text" name="keyword" value="${keyword}" id="" placeholder="(으)로 검색하기">
				<button type="button" onclick="searchList();">검색</button>
				<input type="hidden" name="rows" value="${rows}">
			</div>
		</form>
	</div>

	<div class="inquiry-content my-3">
		<c:forEach var="dto" items="${list}">
			<div class="inquiry-card">
				<div class="inquiry">
					<div class="card-title">
						<div class="title-text">
							<a href="#">${dto.lectureSubject}</a><br>
							<span>${dto.q_regDate}</span> |
							<c:if test="${dto.aMember == null}">
								<button type="button" id="deleteBtn" onclick="deleteData();" data-num="${dto.inquiryNum}">삭제</button>
							</c:if>
						</div>
						<div class="title-status">
							<c:choose>
								<c:when test="${dto.aMember != null}">
									<div class="status rounded-pill commented">답변 완료!</div>
								</c:when>
								<c:otherwise>
									<div class="status rounded-pill notCommented">미답변</div>
								</c:otherwise>
							</c:choose>
						</div>	
					</div>
	
					<div class="inquiry-content">
						<p>${dto.question}</p>
					</div>
				</div>
				<c:choose>
					<c:when test="${dto.aMember != null}">
						<div class="answer-content">
							<div class="profilePic">
								<figure class="figure">
									<c:choose>
										<c:when test="${dto.saveFileName != null }">
											<img src="${pageContext.request.contextPath}/uploads/profile/${dto.saveFileName}" class="is-rounded rounded-circle" alt="" >
										</c:when>
										<c:otherwise>
											<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded rounded-circle" alt="" >
										</c:otherwise>
									</c:choose>
								</figure>
							</div>
							<div class="instructor-content">
								<div class="instructor-info">
									<span>${dto.memberNickname}</span> | 
									<span>${dto.a_regDate}</span> | 
								</div>
								<div class="answerContent">
									<p>${dto.answer}</p>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		
		</c:forEach>
	</div>		

	<div class="question px-3 py-1">
		${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
	</div>