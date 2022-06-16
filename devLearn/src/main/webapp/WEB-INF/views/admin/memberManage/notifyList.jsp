<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="tableTop my-2 ml-2 d-flex">
	<span>${notifyCount}개의 신고</span>
	<form name="notifyForm"  class="ms-auto" style="display: block">
		<select name="state" onchange="notifyStateChange();">
			<option value="">전체</option>
			<option value="0" ${state == 0 ? 'selected="selected"' : ""}>처리중</option>
			<option value="1" ${state == 1 ? 'selected="selected"' : ""}>처리완료</option>
		</select>
		<input type="hidden" name="page"value="${notifyPage}">
	</form>
</div>		
<div class="table-responsive">
	<table class="table table-centered table-nowrap table-hover mb-0">
		<thead>
			<tr class="mb-3">
				<td>
					<h5 class="font-14 my-1 fw-normal">#</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">신고한 회원</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">신고 사유</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">신고글 제목</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">작성자</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">신고일</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">처리상태</h5>
				</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(notifyList) == 0 }">
				<tr>
					<td colspan="7">신고된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="notify" items="${notifyList}" varStatus="status">
				<tr>
					<td>
						<span class="font-14 my-1 fw-normal" style="font-size:14px;">${notifyCount - (page-1) * rows - status.index}</span>
					</td>
					<td>
						<span class="font-14 my-1 fw-normal" style="font-size:14px;">${notify.notifierName}</span>
					</td>
					<td>
						<span class="font-14 my-1 fw-normal" style="font-size:14px;">${notify.notifyReason}</span>
					</td>
					<td>
						<span class="font-14 my-1 fw-normal" style="font-size:14px;">${notify.subject}</span>
					</td>
					<td>
						<span class="font-14 my-1 fw-normal" style="font-size:14px;">${notify.notifiedName}</span>
					</td>
					<td>
						<span class="font-14 my-1 fw-normal" style="font-size:14px;">${notify.regDate}</span>
					</td>
					<td>
						<span class="font-14 my-1 fw-normal" style="font-size:14px;">${notify.state == 0 ? "처리중" : "처리완료"}</span>
					</td>
					<td>
						<button type="button" class="btn-sm btn-primary" onclick="notifyDetail(${notify.notifyNum});">자세히</button>
						<button type="button" class="btn-sm btn-primary" onclick="memberDetail('${notify.notifiedEmail}')">회원정보</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="notifyPaging mt-2">
		${notifyPaging}
	</div>
</div>