<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<meta charset="UTF-8">
<style type="text/css">
* {
	margin: 0; padding: 0; box-sizing: border-box;
}
.chart-section {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.chart-months {
	width: 500px;
	height: 500px;
	padding: 12px 8px;
	border: 1px solid #ddd;
}

.chart-boxes{
	display: flex;
	width: 500px;
	height: 500px;
	flex-wrap: wrap;
	gap: 10px;
	justify-content: space-between;
}

.chart-section p:first-of-type {
	padding-top: 10px;
	padding-left: 20px;
	font-size: 20px;
	font-weight: 600;
}

.chart-section p:nth-of-type(2) {
	text-align: center;
	font-size: 50px;
	font-weight: 800;
	padding-top: 40px;
}

.sugang, .grade {
	width: 240px;
	height: 240px;
	padding: 12px 8px;
	border: 1px solid #ddd;
}

.total-rev {
	width: 500px;
	height: 245px;
	padding: 12px 8px;
		
	border: 1px solid #ddd;
}

</style>
<jsp:include page="/WEB-INF/views/instructorPage/instructorPage.jsp"/>
	<div class="chart-section">
		<div class="chart-months" id="hchart">
			<p>월별 수익 차트</p>
		</div>
		<div class="chart-boxes">
			<div class="sugang">
				<p>함께한 수강생</p>
				<p>439명</p>
			</div>
			<div class="grade">
				<p>평점</p>
				<p>5.0</p>
			</div>
			<div class="total-rev">
				<p>총 수익</p>
				<p>20,000,000</p>
			</div> 	
		</div>
	</div>