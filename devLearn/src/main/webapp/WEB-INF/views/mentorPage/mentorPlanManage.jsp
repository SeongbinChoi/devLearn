<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.min.css">
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


document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		locale: 'ko',
		selectable: false,
		events : function(info, successCallback, failureCallback) {
				
			let url = "${pageContext.request.contextPath}/mentorPage/listMentoring";
			let startDay = info.startStr.substr(0, 10);
			let endDay = info.endStr.substr(0, 10);
			let query = "sDate="+startDay+"&eDate="+endDay;
			
			var fn = function(data){
				let arrayEvents = [];
				for(let i=0; i<data.list.length; i++){
					let item = data.list[i];
					let obj = {};
					obj.title = '예약된 멘토링 : ' + data.list.length + "개";
					obj.start = item.mentoringDate;
					obj.end = item.mentoringDate;
					obj.color = '#000fff';
					obj.allDay = true;
										
					arrayEvents.push(obj);
				}
				successCallback(arrayEvents);
			};
			
			ajaxFun(url, "get", query, "json", fn);
		},
			
		eventClick : function(info) {
			let mentoringDate = dateFormat(info.event.start).substr(0, 10).replace(/-/gi, "/").trim();
			$("input[name=subject]").val(mentoringDate);
			let url = "${pageContext.request.contextPath}/mentorPage/listMentoringPlan";
			let query = "mentoringDate=" + mentoringDate;
			
			const fn = function(data) {
				showModal(data);
			};
			ajaxFun(url, "get", query, "json", fn);
		}
	});
	calendar.render();
});

function dateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;
    second = second >= 10 ? second : '0' + second;

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
}

function login() {
	$("#loginModal").modal("show");	
}

function showModal(data) {
	let str = "<thead><tr><th style='width:35%;'>멘티 이메일</th>";
	str += "<th><style='width:40%;'>멘토링 시간</th>";
	str += "<th>Details</th></tr></thead>";
	for(let i = 0; i < data.list.length; i++) {
		str += "<tr><td>" + data.list[i].memberEmail + "</td>";
		str += "<td>" + data.list[i].mentoringDate + "</td>";
		str += "<td><button type='button' class='btn btn-primary' data-num =" + data.list[i].mentoringNum + ">상세보기</button></td></tr>";
	}
	$("#detailMentoring").html(str);
	
	$("#addModal").modal("show");
}


</script>

<jsp:include page="mentorPage.jsp"/>
  	<h2>멘토링 일정</h2>
    <div id='calendar'></div>

	<div class="main_container container">
		<div id="calendar"></div>
	</div>
	
<div class="modal modal-dialog-scrollable" id="addModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정 상세</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="subject">
					<label class="form-label">날짜</label>
					<input type="text" name="subject" class="form-control long subject" value="">
				</div>
					<label class="form-label">목록</label>
				<div class="table-responsive" style="overflow-y: scroll; height: 300px; border:1px solid #eee;">
					<table class="table table-responsive" id="detailMentoring" border="1" style="width:100%; text-align: center; vertical-align: center;">
						<thead>
							<tr>	
								<th style="width:35%;">멘티 이메일</th>
								<th style="width:40%;">멘토링 시간</th>
								<th>Detail</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>	
	
				