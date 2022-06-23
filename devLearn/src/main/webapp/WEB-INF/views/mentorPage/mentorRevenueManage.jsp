<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentorRevenue.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
	let revenue;
	for(let i = 0; i < ${mentoringDetailList.size()}; i++) {
		revenue += "${mentoringDetailList[i].mentoringPrice}";
	}
	console.log(revenue);
	let arr = new Array();
		arr.push(parseInt("${revenueList.get(0).VALUE}"));
		arr.push(parseInt("${revenueList.get(1).VALUE}"));
		arr.push(parseInt("${revenueList.get(2).VALUE}"));
		arr.push(parseInt("${revenueList.get(3).VALUE}"));
		arr.push(parseInt("${revenueList.get(4).VALUE}"));
		arr.push(parseInt("${revenueList.get(5).VALUE}"));
		arr.push(parseInt("${revenueList.get(6).VALUE}"));
		arr.push(parseInt("${revenueList.get(7).VALUE}"));
		arr.push(parseInt("${revenueList.get(8).VALUE}"));
		arr.push(parseInt("${revenueList.get(9).VALUE}"));
		arr.push(parseInt("${revenueList.get(10).VALUE}"));
		arr.push(parseInt("${revenueList.get(11).VALUE}"));
	console.log(arr);
	
	const chartDom = document.getElementById('chart');
	let myChart = echarts.init(chartDom);
	let option;

	option = {
		title: {
			text: '멘토링 수익 현황'
		},					
		xAxis: {
			type: 'category',
			data: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		},
		yAxis: {
			type: 'value'
		},
		series: [
		    {
		      data: arr,
		      type: 'line'
		    }
		  ]
	};

	option && myChart.setOption(option);		
});

function selectFn() {
	let year = $("#mentoringYear").val();
	
	location.href = "${pageContext.request.contextPath}/mentorPage/revenueManage?year=" + year;
}

</script>
<jsp:include page="mentorPage.jsp"/>
<h2>수익 관리</h2>
<div style="float: right;">
	<select class="form-control" id="mentoringYear">
		<c:forEach var="vo" items="${mentoringYearList}">
			<option value="${vo.YEAR}" <c:if test="${vo.YEAR eq year}">selected="selected"</c:if> onclick="selectFn();">${vo.YEAR}</option>		
		</c:forEach>
	</select>
</div>
<div class="contents py-3" style="clear: both;">
	<div class="row">
		<div class="col-sm-4">
			<div class="card widget-flat">
				<div class="card-body">
					<div class="float-end">
					<i class="mdi mdi-account-multiple widget-icon"></i>
					</div>
					<h5 class="text-muted fw-normal mt-0" title="Number of Customers">총 수익</h5>
					<h3 class="mt-3 mb-3"><fmt:formatNumber value="${allRevenue}" pattern="#,###"/>원</h3>
				</div> <!-- end card-body-->
			</div> <!-- end card-->
		</div> <!-- end col-->
		<div class="col-sm-4">
			<div class="card widget-flat">
				<div class="card-body">
					<div class="float-end">
					<i class="mdi mdi-account-multiple widget-icon"></i>
					</div>
					<h5 class="text-muted fw-normal mt-0" title="Number of Customers">이번달 수익</h5>
					<h3 class="mt-3 mb-3"><fmt:formatNumber value="${monthRevenue}" pattern="#,###"/>원</h3>
				</div> <!-- end card-body-->
			</div> <!-- end card-->
		</div> <!-- end col-->
		<div class="col-sm-4">
			<div class="card widget-flat">
				<div class="card-body">
					<div class="float-end">
					<i class="mdi mdi-account-multiple widget-icon"></i>
					</div>
					<h5 class="text-muted fw-normal mt-0" title="Number of Customers">년도별 수익</h5>
					<h3 class="mt-3 mb-3"><fmt:formatNumber value="${mentoringPrice}" pattern="#,###"/>원</h3>
				</div> <!-- end card-body-->
			</div> <!-- end card-->
		</div> <!-- end col-->
	</div><!-- end row -->
</div>

<div class="chart my-2" id="chart">

</div>
<div class="table-responsive" style="overflow-y: scroll; height: 400px; border:1px solid #eee;">
	<table class="table table-striped rev-table">
		<thead>
			<tr>
				<th style="width: 10%;">멘토링 번호</th>
				<th scope="col" style="width:30%;">제목</th>
				<th>멘티 이메일</th>
				<th style="width: 15%;">멘토링 진행일</th>
				<th style="width: 15%;">금액</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${mentoringDetailList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${vo.mentorSubject}</td>
					<td>${vo.memberEmail}</td>
					<td>${vo.mentoringDate}</td>
					<td>${vo.mentoringPrice}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="btnDIV pt-5">
		<button type="button" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#calc" >정산하기</button>
		<button type="button" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#authen" >인증정산하기</button>
	</div>


<!-- 정산 모달 -->
<div class="modal fade" id="calc" tabindex="-1" aria-labelledby="calcLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="calcLabel" style="font-weight: 800;">멘토링 수익 정산</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="margin:0 auto; ">
				<p style="text-align: center;">현재 정산 가능 금액 <span style="color: #0d6efd; font-weight: 800;">100,000,000</span>원</p>
        		<select style="height: 40px;padding: 5px;border-radius: 5px;">
        			<option>::은행::</option>
        			<option>국민은행</option>
        			<option>신한은행</option>
        			<option>우리은행</option>
        			<option>하나은행</option>
        			<option>카카오뱅크 </option>
        		</select>
        		<input type="text" placeholder="금액을 입력하세요" style="height: 40px;padding: 5px;border-radius: 5px;">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">정산받기</button>
			</div>
		</div>
	</div>
</div>
<!-- 인증 포함 2중 모달 -->
<div class="modal fade" id="authen" aria-hidden="true" aria-labelledby="authenLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="authenLabel">인증하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	비지니스 이메일에 전송된 인증번호를 입력해주세요
        <input type="text">
        <button></button>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#calculate" data-bs-toggle="modal">정산하기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="calculate" aria-hidden="true" aria-labelledby="calculateLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="calculateLabel">정산하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p style="text-align: center;">현재 정산 가능 금액 <span style="color: #0d6efd; font-weight: 800;">100,000,000</span>원</p>
       		<select style="height: 40px;padding: 5px;border-radius: 5px;">
       			<option>::은행::</option>
       			<option>국민은행</option>
       			<option>신한은행</option>
       			<option>우리은행</option>
       			<option>하나은행</option>
       			<option>카카오뱅크 </option>
       		</select>
   		<input type="text" placeholder="금액을 입력하세요" style="height: 40px;padding: 5px;border-radius: 5px;">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#calculate" data-bs-toggle="modal">돌아가기</button>
      </div>
    </div>
  </div>
</div>
