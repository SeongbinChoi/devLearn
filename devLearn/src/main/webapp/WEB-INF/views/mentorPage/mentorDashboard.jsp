<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentorDashboard.css" type="text/css">

<jsp:include page="mentorPage.jsp"/>
	<div class="chart-section">
		<div class="chart-months" id="hchart">
			<p>월별 수익 차트</p>
		</div>
		<div class="chart-boxes">
			<div class="mentee">
				<p>함께한 멘티</p>
				<p>1,309명</p>
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