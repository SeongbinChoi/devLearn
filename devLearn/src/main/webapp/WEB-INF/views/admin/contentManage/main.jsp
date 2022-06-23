<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
<style type="text/css">
.status-section {
	height: 60px;
	width: 450px;
	padding: 12px 8px;
	border: 1px solid #ddd;
	border-radius: 10px;
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

<script type="text/javascript">
$(function(){
	$('.stateLink').removeClass("is-active");
	$("#state${state}").addClass("is-active");
});
</script>

	<div class="container">
		<div class="contents pt-5">
	 		<div class="status-section d-flex align-items-center mt-4">
				<span>&nbsp;&nbsp;STATUS</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 
				<ul>
					<li><a href="${pageContext.request.contextPath}/admin/contentManage/main" class="stateLink is-active" id="state99">전체</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/contentManage/main?state=0" class="stateLink" id="state0">승인대기</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/contentManage/main?state=1" class="stateLink" id="state1">승인완료</a></li>
				</ul>
			</div>
	 		
	 		<div class="mt-3">
		 		<table class="table table-centered table-nowrap table-hover mb-0">
		 			<thead>
			 			<tr>
			 				<td>#</td>
			 				<td>썸네일</td>
			 				<td>제목</td>
			 				<td>강사</td>
			 				<td>등록일</td>
			 				<td>상태</td>
			 			</tr>
		 			</thead>
					<tbody>
			 			<c:forEach var="dto" items="${list}" varStatus="status">
			 				<tr>
				 				<td>${dataCount - (page-1) * rows - status.index}</td>
				 				<td>(썸네일<br>준비중)</td>
				 				<td>${dto.subject}</td>
				 				<td>${dto.instName}</td>
				 				<td>${dto.regDate}</td>
				 				<td>
				 					<c:choose>
				 						<c:when test="${dto.state == 0}">
				 							승인대기
				 						</c:when>
				 						<c:otherwise>
				 							승인완료
				 						</c:otherwise>
				 					</c:choose>
				 				</td>
			 				</tr>
			 			</c:forEach>
					</tbody>
		 		</table>
		 		<div class="paginate mt-5">
		 			${paging}
		 		</div>
	 		</div>
	 		
	 	</div>
	</div>
