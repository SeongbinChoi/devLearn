<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table td-border my-10" style="border: 1px border-collpase;">
	<c:forEach var="dto" items="${stateList}">
		<tr>
			<td style="width: 15%;">변경일<td>
			<td style="width: 35%">${dto.stateDate}</td>
			<td style="width: 15%;">사유<td>
			<td style="width: 35%">
				<c:choose>
					<c:when test="${dto.stateCode == 1}">
						불법적인 방법으로 로그인
					</c:when>
					<c:when test="${dto.stateCode == 2}">
						불건전 게시물 등록
					</c:when>
					<c:when test="${dto.stateCode == 3}">
						다른 유저 비방
					</c:when>
					<c:when test="${dto.stateCode == 4}">
						타 계정 도용
					</c:when>
					<c:when test="${dto.stateCode == 5}">
						기타 약관 위반
					</c:when>
					<c:when test="${dto.stateCode == 6}">
						1년이상 로그인 하지 않음
					</c:when>
					<c:when test="${dto.stateCode == 9}">
						패스워드 6회 이상 실패
					</c:when>
					<c:when test="${dto.stateCode == 10}">
						퇴사
					</c:when>
					<c:when test="${dto.stateCode == 11}">
						해제
					</c:when>
				</c:choose>
			</td>
			<td>처리한 관리자</td>
			<td>${dto.adminId}</td>
		</tr>		
	</c:forEach>
	<tr>
		<td colspan="6" style="text-align: right; font-size: 12px;" >최근 5건의 변경만 조회 됩니다.</td>
	</tr>
</table>
