<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<form name="applyDetailForm" id="applyDetailForm">
	  	<table class="table td-border my-10" style="border: 1px border-collpase;">
	   		<tr>
	   			<td style="width:15%;">신고자 이름</td>
	   			<td style="width:35%;">${applyDto.eMail}</td>
	   			<td style="width:15%;">이름</td>
	   			<td style="width:35%;">${applyDto.name}</td>
	   		</tr>
	   		<tr>
	   			<td style="width:15%;">비지니스 메일</td>
	   			<td style="width:35%;">${applyDto.bMail}</td>
	   			<td style="width:15%;">전화번호</td>
	   			<td style="width:35%;">${applyDto.phoneNum}</td>
	   		</tr>
	   		<tr>
	   			<td>자기소개 내용</td>
	   			<td colspan="3" style="text-align: center; vertical-align: middle;">${applyDto.intro}</td>
	   		</tr>
			<tr>
				<td>현재 회원 등급</td>
				<td>
					<c:choose>
						<c:when test="${applyDto.mRole == 1}">
							회원
						</c:when>
						<c:when test="${applyDto.mRole == 10}">
							멘토
						</c:when>
						<c:when test="${applyDto.mRole == 20}">
							강사
						</c:when>
						<c:when test="${applyDto.mRole == 30}">
							멘토 &amp; 강사
						</c:when>
					</c:choose>
				</td>
				<td>회원 등급</td>
				<td>
					<select id="applyDetailSelect" name="changeRole" style="width: 100%;" ${applyDto.status == 1 ? "disabled='disabled'" : ""} >
						
					</select>
					<input type="hidden" value="${applyDto.eMail}" name="eMail">
					<input type="hidden" value="${applyDto.mRole}" name="mRole">
					<input type="hidden" value="${applyDto.applyRole}" name="applyRole">
				</td>
				</tr>
		</table>
	</form>
