<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<form name="notifyDetailForm" id="notifyDetailForm">
	  	<table class="table td-border my-10" style="border: 1px border-collpase;">
	   		<tr>
	   			<td style="width:15%;">신고자 이름</td>
	   			<td style="width:35%;">${notifyDto.notifierName}</td>
	   			<td style="width:15%;">신고자 아이디</td>
	   			<td style="width:35%;">${notifyDto.notifierEmail}</td>
	   		</tr>
	   		<tr>
	   			<td style="width:15%;">신고 사유</td>
	   			<td colspan="3">${notifyDto.notifyReason}</td>
	   		</tr>
	   		<tr>
	   			<td style="width:15%;">피신고자 이름</td>
	   			<td style="width:35%;">${notifyDto.notifiedName}</td>
	   			<td style="width:15%;">피신고자 아이디</td>
	   			<td style="width:35%;">${notifyDto.notifiedEmail}</td>
	   		</tr>
	   		<tr>
	   			<td style="width:15%;">신고글 제목</td>
	   			<td colspan="3">${notifyDto.subject}</td>
	   		</tr>
			<tr>
				<td>신고일</td>
				<td>${notifyDto.regDate}</td>
				<td>
					<input type="hidden" value="${notifyDto.qnaNum}" name="qnaNum">
				</td>
				<td></td>
			</tr>
			<tr>
				<td>처리상태</td>
				<td>${notifyDto.state == 0 ? "처리중" : "처리완료"}</td>
				<td>처리상태</td>
				<td>${notifyDto.updateDate}</td>
			</tr>				
		</table>
	</form>