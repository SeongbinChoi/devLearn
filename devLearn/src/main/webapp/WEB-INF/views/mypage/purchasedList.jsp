<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table">
	<tr>
		<td width="55%">강의명</td>
		<td width="15%" class="align-middle">가격</td>
		<td width="15%">할인액</td>
		<td width="15%">총액</td>
	</tr>
	<c:forEach var="dto" items="${detailList}">
		<tr>
			<td class="table-light col-3 align-middle list-name">${dto.lectureSubject}</td>
			<td class="list-price">${dto.lecturePay}</td>
			<td class="list-discount">${dto.discount}</td>
			<td class="list-total">${dto.lecturePay - dto.discount}</td>
		</tr>
	</c:forEach>
</table>