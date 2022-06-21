<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.min.css">
<style>
#detailInfoTable tr {
	height: 40px;
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
					obj.title = '예정된 멘토링';
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
		str += "<td><button type='button' class='btn btn-sm btn-primary' data-num =" + data.list[i].mentoringNum + " onclick='showDetail(" + data.list[i].mentoringNum + ");'>상세보기</button></td></tr>";
	}
	$("#detailMentoring").html(str);
	
	$("#addModal").modal("show");
}

function showDetail(param) {
	let mentoringNum = param;
	let url = "${pageContext.request.contextPath}/mentorPage/MentoringDetail";
	let query = "mentoringNum=" + mentoringNum;
	
	const fn = function(data) {
		let str = "<tr style='height:20px;'><td style='width:30%;'>멘토링 명</td>";
		str += "<td style='width:70%;'>" + data.dto.mentorSubject + "</td></tr>";
		str += "<tr><td>멘티 이메일</td>";
		str += "<td>" + data.dto.memberEmail + "</td></tr>";
		str += "<tr><td>멘티 연락처</td>";
		str += "<td>" + data.dto.phoneNum + "</td></tr>";
		str += "<tr><td>예약 일정</td>";
		str += "<td>" + data.dto.mentoringDate + "</td></tr>";
		str += "<tr><td colspan='2' style='text-align: center;'>예약 일정</td></tr>";
		str += "<tr><td colspan='2'><textarea class='form-control' style='width:100%; height:300px;'>" + data.dto.applyMessage + "</textarea></td></tr>";
		$("#detailInfoTable").html(str);

		$("#detailModal").modal("show");
	};
	
	ajaxFun(url, "get", query, "json", fn);
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
					<input type="text" name="subject" class="form-control long subject" value="" readonly="readonly">
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

<div class="modal" id="detailModal" tabindex="-1" aria-labelledby="detailModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="detailModal">신청 정보 확인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		    </div>
		    <div class="modal-body check px-4">
				<div class="detailInfo">
					<table class="detailInfo" id="detailInfoTable" style="width:100%;">
						
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">닫기</button>
			</div>
		</div>
	</div>
</div>	
				