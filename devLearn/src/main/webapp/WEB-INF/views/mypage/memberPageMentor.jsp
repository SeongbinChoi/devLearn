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
.status-section {
	height: 60px;
	padding: 12px 8px;
	border: 1px solid #ddd;
	border-radius: 10px;
}

.status-section span {
	font-weight: 600;
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

.list-table {
	width: 100%;
	margin: 20px auto;
	border-collapse: collapse;
	text-align: center;
}

.list-table td, .list-table th {
	border: 1px solid #ddd;
	height: 50px;
	vertical-align: middle;
}

.list-table td:nth-child(4n+2) {
	padding-left: 5px;
	text-align: left;
}

.list-table td:last-child {
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="memberPage.jsp"/>
	<div class="status-section d-flex align-items-center">
		<span>&nbsp;&nbsp;STATUS</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 
		<ul>
			<li><a href="#" class="is-active">전체</a></li>
			<li><a href="#">승인대기</a></li>
			<li><a href="#">예약확정</a></li>
			<li><a href="#">이용완료</a></li>
			<li><a href="#">취소/환불</a></li>
		</ul>
	</div>
	<div class="mentor-content">
		<table class="list-table table table-striped">
			<thead>
				<tr>
					<th style="width: 10%;">신청번호</th>
					<th>제목</th>
					<th style="width: 15%;">멘토링 날짜</th>
					<th style="width: 10%;">결제액</th>
					<th colspan="2" style="width: 20%;">신청상태</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="1" end="5">
					<tr>	
						<td>100111</td>
						<td>신입/주니어 개발자 취업 및 커리어 멘토링</td>
						<td>2022-08-19 20:00</td>
						<td>15,000</td>		
						<td>승인 대기중</td>
						<td><button type="button" class="btn btn-secondary">신청취소</button></td>
					</tr>
					<tr>	
						<td>100111</td>
						<td>신입/주니어 개발자 취업 및 커리어 멘토링</td>
						<td>2022-08-19 20:00</td>
						<td>15,000</td>		
						<td >예약 확정</td>
						<td><button type="button" class="btn btn-secondary" hidden="hidden">신청취소</button></td>
					</tr>
					<tr>	
						<td>100111</td>
						<td>신입/주니어 개발자 취업 및 커리어 멘토링</td>
						<td>2022-08-19 20:00</td>
						<td>15,000</td>		
						<td>승인 대기중</td>
						<td><button type="button" class="btn btn-secondary">신청취소</button></td>
					</tr>						
				</c:forEach>
			</tbody>
		</table>
	</div>
</main>

</body>
</html>