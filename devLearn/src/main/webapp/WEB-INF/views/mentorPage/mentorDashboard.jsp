<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentorDashboard.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
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
	const chartDom = document.getElementById('echart');
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
			type: 'value',
			axisLabel: {
				padding: -5
			}
		},
		series: [
		    {
		      data: arr,
		      type: 'bar'
		    }
		  ]
	};

	option && myChart.setOption(option);		
});
</script>
<jsp:include page="mentorPage.jsp"/>
	<div class="chart-section">
		<div class="chart-months" id="echart">
			<p>월별 수익 차트</p>
		</div>
		<div class="chart-boxes">
			<div class="mentee">
				<p>함께한 멘티</p>
				<p>${dataMap['MENTEECNT']} 명</p>

			</div>
			<div class="grade">
				<p>평점</p>
				<p><fmt:formatNumber value="${dataMap['AVG']}" pattern="0.0"/> / 5.0</p>
			</div>
			<div class="total-rev">
				<p>총 수익</p>
				<p><fmt:formatNumber value="${dataMap['REVENUE']}" pattern="#,###"/>원</p>
				<small style="color:#ccc;">승인 완료 통계이므로 데이터가 차이날 수 있습니다.</small>
			</div> 	
		</div>
	</div>