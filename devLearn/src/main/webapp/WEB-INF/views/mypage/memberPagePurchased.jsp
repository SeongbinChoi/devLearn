<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
.receiptTable {
	width: 100%;
	margin-top: 30px;
	border-collapse: collapse;
	text-align: center;
}

.receiptTable th, .receiptTable td{
	border: 1px solid #000;
}

.receiptTable th {
	height: 30px;
}

.receiptTable td {
	height: 100px;
	vertical-align: middle;
}

.receiptTable td p {
	margin: 0;
}

.receiptTable td p:nth-of-type(2) {
	border-bottom: 1px solid #000;
	background: #ccc;
}

.receiptTable td:nth-child(6n+4) {
	text-align: left;
	padding-left: 15px;
}

.receiptTable td:nth-child(6n+5) {
	text-align: right;
	padding: 10px;
}

.receiptTable tr:nth-child(2n+2) {
	background: #eee;
}

td a {
	color: #000;
}

td a:hover {
	cursor: pointer;
	color: #0d6edf;
	font-weight: 600;
}
</style>
</head>
<body>
<jsp:include page="memberPage.jsp"/>
	<h2>내 구매내역</h2>
	
	<table class="receiptTable">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>상태</th>
				<th>주문명</th>
				<th>금액</th>
				<th>거래명세서</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="5">
				<tr>
					<td>1234565</td>
					<td>2022-05-05</td>
					<td>결제완료</td>
					<td>강의명강의명강의명강의명강의명</td>
					<td>
						<p>￦30,000</p>
						<p>- ￦3,000</p>
						<p>￦27,000</p>
					<td><a href="#">보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	
	</table>
</main>
</body>
</html>