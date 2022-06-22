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

.scroll {
	overflow-y:scroll; height:400px;
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
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		},
	});
}

$(function(){
	
	$('.studyLink').removeClass("s_clicked");
	$('#study${status}').addClass("s_clicked");
	
});


// 지원자확인하기 버튼 누르면

$(function(){
	$('.apply').click(function(){
		let studyNum = $(this).attr("data-num");
		
		let url = "${pageContext.request.contextPath}/mypage/myWrite/applyList";
		let query = "studyNum="+studyNum;
		
		let selector = "#studyApply";
		
		const fn = function(data){
			$(selector).html(data);
			
			$('#applyConfirmModal').modal('show');
		};

		ajaxFun(url, "get", query, "html", fn);
		
	});
});


$(function(){
	$("body").on("click", ".applyOk", function(){
		let studyNum = $(this).attr("study-num");
		let applyNum = $(this).attr("apply-num");
		
		let url = "${pageContext.request.contextPath}/mypage/myWrite/updateStatus";
		let query = "studyNum="+studyNum + "&applyNum="+applyNum;
		
		const fn = function(data){
			let url = "${pageContext.request.contextPath}/mypage/myWrite/applyList";
			let query = "studyNum="+studyNum;
			
			let selector = "#studyApply";
			
			const fn = function(data){
				$(selector).html(data);
			};

			ajaxFun(url, "get", query, "html", fn);
		};

		ajaxFun(url, "get", query, "json", fn);
		
	});
});


$(function(){
	$('.finish').click(function(){
		let studyNum = $(this).attr("data-num");
		
		let url = "${pageContext.request.contextPath}/mypage/myWrite/studyStatus";
		let query = "studyNum="+studyNum;
		
		const fn = function(data){
			location.href="${pageContext.request.contextPath}/mypage/myWrite/myStudyWrite?status=2";
		};

		ajaxFun(url, "get", query, "json", fn);
	});

});


function cancelBtn() {
	let applyNum = $('.cancel').attr("apply-num");
	
	location.href = "${pageContext.request.contextPath}/mypage/myWrite/cancel?applyNum="+applyNum;
}

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
		<div class="scroll">
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
						<tr>
							<td onclick="location.href='${studyArticleUrl}&studyNum=${vo.studyNum}'">${vo.region}</td>
							<td onclick="location.href='${studyArticleUrl}&studyNum=${vo.studyNum}'">${vo.subject}</td>
							<td onclick="location.href='${studyArticleUrl}&studyNum=${vo.studyNum}'">${vo.regDate}</td>
							<td onclick="location.href='${studyArticleUrl}&studyNum=${vo.studyNum}'">${vo.applied}/${vo.limit}</td>
							<td onclick="location.href='${studyArticleUrl}&studyNum=${vo.studyNum}'">${vo.status == 0 ? "모집중" : "모집완료"}</td>
							<td><button type="button" class="btn btn-secondary apply" data-num=${vo.studyNum}>확인하기</button>
							<c:choose>
								<c:when test="${vo.status == 0}">
									<td><button type="button" class="btn btn-secondary finish" data-num=${vo.studyNum}>완료</button></td>
								</c:when>
								<c:otherwise>
									<td><button type="button" class="btn btn-secondary" disabled="disabled">완료</button></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--  ---------------------------------------------------------------------- -->
		<h3 class="mt-3">지원한 스터디</h3>
		<div class="scroll">
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
					<c:forEach var="vo" items="${myList}">
						<tr>
							<td onclick="location.href='${studyArticleUrl2}&studyNum=${vo.studyNum}'">${vo.region}</td>
							<td onclick="location.href='${studyArticleUrl2}&studyNum=${vo.studyNum}'">${vo.subject}</td>
							<td onclick="location.href='${studyArticleUrl2}&studyNum=${vo.studyNum}'">${vo.regDate}</td>
							<td onclick="location.href='${studyArticleUrl2}&studyNum=${vo.studyNum}'">${vo.applied}/${vo.limit}</td>
							<td onclick="location.href='${studyArticleUrl2}&studyNum=${vo.studyNum}'">${vo.status == 0 ? "모집중" : "모집완료"}</td>
							<c:choose>
								<c:when test="${vo.applyStatus == 2}">
									<td><button type="button" class="btn btn-secondary" disabled="disabled">취소</button></td>
								</c:when>
								<c:otherwise>
									<td><button type="button" class="btn btn-secondary cancel" data-num=${vo.studyNum} apply-num=${vo.applyNum} onclick="cancelBtn();">취소</button></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
							
				</tbody>
			</table>
		</div>
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
			<div class="modal-body" id="studyApply">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
