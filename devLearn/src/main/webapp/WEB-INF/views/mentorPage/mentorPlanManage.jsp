<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.min.css">
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth'
	});
	calendar.render();
});
</script>

<jsp:include page="mentorPage.jsp"/>
  	<h2>멘토링 일정</h2>
    <div id='calendar'></div>

<div class="main_container container">

<div id="calendar">

</div>

</div>
				