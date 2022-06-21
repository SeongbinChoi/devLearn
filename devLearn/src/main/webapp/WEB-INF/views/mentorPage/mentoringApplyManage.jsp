<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentoringManage.css" type="text/css">
<script type="text/javascript">
// ajax
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
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

function login() {
	$("#loginModal").modal("show");
}


$(function() {
	$(".showModal").click(function() {
		let mentoringNum = $(this).attr("data-num");
		let url = "${pageContext.request.contextPath}/mentorPage/readMentoringApply";
		let query = "mentoringNum=" + mentoringNum;
		
		const fn = function(data) {
			showDetailModal(data);
		};
		
		ajaxFun(url, "get", query, "json", fn);
	});
});

function showDetailModal(data) {
	$("#detailModal").modal("show");
	let str = "";
	
	$("#applyEmail").val(data.dto.memberEmail);
	$("#applyPhoneNum").val(data.dto.phoneNum);
	$("#applyName").val(data.dto.memberName);
	$("#applyMentoringDate").val(data.dto.mentoringDate);
	$("#applyPrice").val(data.dto.mentoringPrice);
	$("#applyDate").val(data.dto.applyDate);
	$("#applyMessage").val(data.dto.applyMessage);
	$("#approveDate").val(data.dto.approveDate);
	$("#applyStatus").val(data.dto.status);
	$("input[name=mentoringNum]").val(data.dto.mentoringNum);
	
	if(data.dto.status == 0) {
		str = "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>Close</button>";
		str += "<button type='button' class='btn btn-primary' onclick='sendOk(1);'>승인</button>";
		str += "<button type='button' class='btn btn-danger' onclick='sendOk(2);'>거절</button>";
		$(".modal-footer").html(str);
	} else {
		str = "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>Close</button>";
		$(".modal-footer").html(str);
	}
}


function sendOk(param) {
	const f = document.applyManageForm;
	$("input[name=status]").val(param);	
	
	f.action = "${pageContext.request.contextPath}/mentorPage/updateApply";
	f.submit();	
}
	
</script>

<jsp:include page="mentorPage.jsp"/>
	<div class="status-section d-flex align-items-center">
		<span>STATUS</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 
		<ul class="filter-menu">
			<li><a href="${pageContext.request.contextPath}/mentorPage/applyManage?status=all" id="all" class="is-active">전체</a></li>
			<li><a href="${pageContext.request.contextPath}/mentorPage/applyManage?status=wait" id="wait">승인대기</a></li>
			<li><a href="${pageContext.request.contextPath}/mentorPage/applyManage?status=accept" id="accept">예약확정</a></li>
			<li><a href="${pageContext.request.contextPath}/mentorPage/applyManage?status=cancel" id="cancel">취소/환불</a></li>
		</ul>
	</div>
	<div class="mentor-content">
		<div class="table-responsive" style="overflow-y: scroll; height: 600px; border:1px solid #eee;">
			<table class="list-table table table-striped table-responsive">
				<thead>
					<tr>
						<th style="width: 10%;">신청번호</th>
						<th>제목</th>
						<th style="width: 15%;">멘토링 날짜</th>
						<th style="width: 10%;">결제액</th>
						<th colspan="2" style="width: 25%;">신청상태</th>
					</tr>
				</thead>
				<tbody>			
					<c:forEach var="dto" items="${list}">
						<tr>	
							<td>1</td>
							<td>${dto.mentorSubject}</td>
							<td>${dto.mentoringDate}</td>
							<td>${dto.mentoringPrice}</td>		
							<td>
								<c:choose>
									<c:when test="${dto.status eq 0}">승인 대기</c:when>
									<c:when test="${dto.status eq 1}">예약 확정</c:when>
									<c:when test="${dto.status eq 2}">승인 거절</c:when>
									<c:when test="${dto.status eq 3}">이용 완료</c:when>
									<c:when test="${dto.status eq 4}">취 소</c:when>
									<c:when test="${dto.status eq 5}">환 불</c:when>
								</c:choose>
							</td>
							<td>
								<button type="button" class="btn btn-secondary showModal" data-num="${dto.mentoringNum}">자세히 보기</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="detailModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="detailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detailModalLabel">신청 상세 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form name="applyManageForm" method="post">
      	<table class="table td-border my-10" style="border: 1px border-collpase;">
      		<tr>
      			<td style="width:15%;">E-mail</td>
      			<td style="width:35%;"><input type="text" class="form-control" id="applyEmail" readonly="readonly"></td>
      			<td style="width:15%;">연락처</td>
      			<td style="width:35%;"><input type="text" class="form-control" id="applyPhoneNum" readonly="readonly"></td>
      		</tr>
      		<tr>
      			<td style="width:15%;">이름</td>
      			<td style="width:35%;"><input type="text" class="form-control" id="applyName" readonly="readonly"></td>
      			<td style="width:15%;">예약 일자</td>
      			<td style="width:35%;"><input type="text" class="form-control" id="applyMentoringDate" readonly="readonly"></td>
      		</tr>
      		<tr>
      			<td style="width:15%;">결제 금액</td>
      			<td style="width:35%;"><input type="text" class="form-control" id="applyPrice" readonly="readonly"></td>
      			<td style="width:15%;">신청 일자</td>
      			<td style="width:35%;"><input type="text" class="form-control" id="applyDate" readonly="readonly"></td>
      		</tr>
      		<tr>
      			<td colspan="1" style="width:15%; text-align:center; vertical-align: center;">메시지</td>
      			<td colspan="3">
      				<textarea style="width: 100%; height: 70px;" id="applyMessage" readonly="readonly"></textarea>
      			</td>
      		</tr>
      		<tr>
      			<td style="width:15%;">관리 일자</td>
      			<td style="width:35%;"><input type="text" class="form-control" id="approveDate" readonly="readonly"></td>
      			<td style="width:15%;">상태</td>
      			<td style="width:35%;"><input type="text" class="form-control" id="applyStatus" readonly="readonly"></td>
      		</tr>
      	</table>
      	<input type="hidden" name="mentoringNum" value="">
      	<input type="hidden" name="status" value="">
      </form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>