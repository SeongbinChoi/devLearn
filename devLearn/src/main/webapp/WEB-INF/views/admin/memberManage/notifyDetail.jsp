<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="modal-dialog modal-dialog modal-dialog-centered modal-lg">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="notifyDetailModalLabel">신고내용</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="showNotifyList();"></button>
		</div>
		<div class="modal-body">
			<form name="notifyDetailForm" id="notifyDetailForm">
			  	<table class="table td-border my-10" style="border: 1px border-collpase;">
			   		<tr>
			   			<td style="width:15%;">신고 이름</td>
			   			<td style="width:35%;"><b>${notifyDto.notifierName}</b></td>
			   			<td style="width:15%;">신고 아이디</td>
			   			<td style="width:35%;"><b>${notifyDto.notifierEmail}</b></td>
			   		</tr>
			   		<tr>
			   			<td style="width:15%;">신고 사유</td>
			   			<td colspan="3"><b>${notifyDto.notifyReason}</b></td>
			   		</tr>
			   		<tr>
			   			<td style="width:15%;">피신고 이름</td>
			   			<td style="width:35%;"><b>${notifyDto.notifiedName}</b></td>
			   			<td style="width:15%;">피신고 아이디</td>
			   			<td style="width:35%;"><b>${notifyDto.notifiedEmail}</b></td>
			   		</tr>
			   		<tr>
			   			<td style="width:15%;">신고글 제목</td>
			   			<td colspan="3"><b>${notifyDto.subject}</b></td>
			   		</tr>
					<tr>
						<td>신고일</td>
						<td><b>${notifyDto.regDate}</b></td>
						<td>
							<input type="hidden" value="${notifyDto.qnaNum}" name="qnaNum">
						</td>
						<td></td>
					</tr>
					<tr>
						<td>처리상태</td>
						<td><b>${notifyDto.state == 0 ? "처리중" : "처리완료"}</b></td>
						<td>처리일</td>
						<td><b>${notifyDto.updateDate == null ? "미처리" : "notifyDto.updateDate"}</b></td>
					</tr>				
				</table>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary" onclick="toArticle();">글보기</button>
		</div>
	</div>
</div>