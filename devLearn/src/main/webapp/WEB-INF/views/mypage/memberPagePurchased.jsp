<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

.scroll {
	overflow-y:scroll; height:600px;
}

#purchasedDetailModal tr td:not(.list-name) {
	text-align: center;
}

</style>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		},
	});
}


$(function(){
	$('.detail').click(function(){
		let sugangNum = $(this).attr("data-num");
		
		let url = "${pageContext.request.contextPath}/mypage/purchased/detailList";
		let query = "sugangNum="+sugangNum;
		
		let selector = "#purchasedList";
		
		const fn = function(data){
			$(selector).html(data);
			
			$('#purchasedDetailModal').modal('show');
		};

		ajaxFun(url, "get", query, "html", fn);
		
	});
});



</script>


<jsp:include page="memberPage.jsp"/>
	<h2>내 구매내역</h2>
	<div class="scroll">
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
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.sugangNum}</td>
						<td>${dto.lectureSdate}</td>
						<td>결제완료</td>
						<td>${dto.lectureSubject} 외 ${dto.totalCount-1}개</td>
						<td>
							<p>${dto.totalPay - dto.totalDiscount}</p>
							<p>- ${dto.totalDiscount}</p>
							<p>${dto.totalPay}</p>
						<td><button type="button" class="btn btn-secondary detail" data-num=${dto.sugangNum}>보기</button></td>
					</tr>
				</c:forEach>
			</tbody>
		
		</table>
	</div>

	<!-- 구매 상세내역 모달 -->
	<div class="modal fade" id="purchasedDetailModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">구매내역</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" id="purchasedList">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>