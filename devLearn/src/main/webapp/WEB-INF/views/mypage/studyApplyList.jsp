<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table">
	<tr>
		<td width="30%" class="table-light col-3 align-middle">이름</td>
		<td>이메일</td>
		<td width="20%">상태</td>
		<td width="20%">승인</td>
	</tr>
	<c:forEach var="dto" items="${applyList}">
		<tr>
			<td class="table-light col-3 align-middle list-name">${dto.memberName}</td>
			<td class="list-email">${dto.applicantEmail}</td>
			<td class="list-status">${dto.status == 0 ? "승인대기" : dto.status == 1 ? "승인완료" : "승인취소"}</td>
			<c:choose>
				<c:when test="${dto.status==0}">
					<td><button type="button" class="btn btn-primary applyOk" study-num="${dto.studyNum}" apply-num="${dto.applyNum}">승인</button></td>
				</c:when>
				<c:otherwise>
					<td><button type="button" class="btn btn-primary" disabled="disabled" study-num="" apply-num="">승인</button></td>
				</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
</table>