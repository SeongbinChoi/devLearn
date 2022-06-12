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
<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.css" type="text/css">

<style type="text/css">
.modal-body div:not(.repeatLeft) {
	margin-bottom: 15px;
}

.modal-body .long {
	width: 85%;
}

.modal textarea {
	width: 100%;
	height: 100px;
	resize: none;
}

.subject {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.selectColor {
	display: flex;
	align-items: center;
}

.start {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.end {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.form-check {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.repeatLeft {
	margin-bottom: 0;
}


.modal-footer {
	display: flex;
	justify-content: space-between;
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
		}
	});
}

$(function(){

    $('#selectYear').hide();
    
});

$(function(){
	$("input:checkbox").on('click', function() {
		let chk = $('#flexCheckDefault').is(':checked');
		
		if(chk){
			$('#selectYear').show();
		} else {
			$('#selectYear').hide();
		}
	});
});
	
var calendar = null;
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		locale: 'ko',
		selectable: true,
		select: function(info) {
			$('#addModal').modal('show');
			$('#sDate').val(info.startStr);
			$('#eDate').val(info.endStr);
			
		},
		events : [
			<c:forEach var="vo" items="${list}">
				{
					id : '${vo.planNum}',
					title : '${vo.subject}',
					start : '${vo.sDate}',
					end : '${vo.eDate}',
					color : '${vo.planColor}',
					allDay : true,
					extendedProps: {
						planNum: '${vo.planNum}',
						repeatCheck: '${vo.repeatCheck}',
						repeatCycle: '${vo.repeatCycle}',
				        memo: '${vo.memo}'
				    }
				},
			</c:forEach>
		],
		eventClick : function(info){
			viewSchedule(info.event);
		}
	});
	calendar.render();
});


$(function(){
	listPlan();
});

function listPlan() {
	let url = "${pageContext.request.contextPath}/mypage/myPlan";
	let query = "";
	
	const fn = function(data){
		
	};
	ajaxFun(url, "get", query, "html", fn);
}


// 일정 추가
$(document).ready(function(){
	$(".addBtn").click(function(){
		const f = document.addForm;
		var str;
		
	    str = f.subject.value.trim();
	    if(!str) {
	        alert("제목을 입력하세요. ");
	        f.subject.focus();
	        return;
	    }
	    
	    let chk = $('#flexCheckDefault').is(':checked');
	    
	    if(chk){
	    	$('#flexCheckDefault').val(1);
	    } else {
	    	$('#flexCheckDefault').val(0);
	    }
	    	
	
	    f.action = "${pageContext.request.contextPath}/mypage/myPlan";
	    f.submit();
	});
});


function viewSchedule(calEvent) {
	$('#detailModal').modal('show');
	console.log(calEvent);
	
	var title = calEvent.title;
	var start = calEvent.startStr;
	var end = calEvent.endStr;
	var num = calEvent.extendedProps.planNum;
	var memo = calEvent.extendedProps.memo;
	var repeat = calEvent.extendedProps.repeatCheck;
	var repeat_cycle = calEvent.extendedProps.repeatCycle;
	
	
	$(".deleteBtn").attr("data-num", num);
	$(".updateBtn").attr("data-num", num);
	
	$(".view-subject").html(title);
	$(".view-sDate").html(start);
	$(".view-eDate").html(end);
	
	s = repeat != 0 && repeat_cycle != 0 ? "반복일정 / 반복주기 " + repeat_cycle + "년" : "반복안함";
	$(".view-repeat").html(s);
	
	$(".view-memo").html(memo);
	
}


$(function(){
	// 일정 수정
	/*
	$(".deleteBtn").click(function(){
		$('#addModal').modal('show');
		
		var fn = function(data){
			var event = calendar.getEventById(planNum);
	        event.remove();
	        $("#detailModal").modal("hide");
		};
		
		var planNum = $(this).attr("data-num");
		var query = "planNum="+planNum;
		var url = "${pageContext.request.contextPath}/mypage/myPlan/delete";

		ajaxFun(url, "post", query, "json", fn);
		
		var repeat_cycle = calEvent.extendedProps.repeatCycle;
		
		var num = $(this).attr("data-num");
		location.href="${pageContext.request.contextPath}/schedule/update?num="+num;
	});
	*/
	// 일정 삭제
	$(".deleteBtn").click(function(){
		if(! confirm("일정을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
        
		var fn = function(data){
			var event = calendar.getEventById(planNum);
	        event.remove();
	        $("#detailModal").modal("hide");
		};
		
		var planNum = $(this).attr("data-num");
		var query = "planNum="+planNum;
		var url = "${pageContext.request.contextPath}/mypage/myPlan/delete";

		ajaxFun(url, "post", query, "json", fn);
		
	});
});

</script>

</head>
<body>

<jsp:include page="memberPage.jsp"/>

<h2>일정 관리</h2>
<div id='calendar'></div>


<!-- 일정 추가 모달 -->
<form name="addForm" method="post">
<div class="modal modal-dialog-scrollable" id="addModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="subject">
					<label class="form-label">제목</label>
					<input type="text" name="subject" class="form-control long">
				</div>
				
				<div class="selectColor">
					<label for="exampleColorInput" class="form-label">색상</label>
					<input type="color" name="planColor" class="form-control form-control-color mx-5" id="exampleColorInput" value="#563d7c" title="Choose your color">
				</div>
				
				<div class="start">
					<label class="form-label">시작일</label>
					<input type="text" name="sDate" class="form-control long" id="sDate" value="" readonly="readonly">
				</div>
				
				<div class="end">
					<label class="form-label">종료일</label>
					<input type="text" name="eDate" class="form-control long" id="eDate" value="" readonly="readonly">
				</div>
				
				<div class="form-check">
					<div class="repeatLeft">
						<label class="form-check-label" for="flexCheckDefault">
						  	반복
						</label>
						<input class="form-check-input" name="repeatCheck" type="checkbox" value="" id="flexCheckDefault">
					</div>
					<select class="form-select long" id="selectYear" name="repeatCycle"  aria-label="Default select example">
						<option selected value="0">:: 반복주기 ::</option>
						<option value="1">1년</option>
						<option value="2">2년</option>
						<option value="3">3년</option>
					</select>
				</div>
				
				
				<label class="form-label">메모</label>
				<textarea name="memo"></textarea>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary addBtn">등록하기</button>
			</div>
		</div>
	</div>
</div>	

</form>	



<!-- 일정 상세보기 모달 -->
<div class="modal modal-dialog-scrollable" id="detailModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정상세</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="subject">
					<label class="form-label">제목</label>
					<p class="view-subject"></p>
				</div>

				
				<div class="start">
					<label class="form-label">시작일</label>
					<p class="view-sDate"></p>
				</div>
				
				<div class="end">
					<label class="form-label">종료일</label>
					<p class="view-eDate"></p>
				</div>
				
				<div class="form-check">
					<div class="repeatLeft">
						<p class="view-repeat"></p>
					</div>

				</div>
				
				
				<label class="form-label">메모</label>
				<p class="view-memo"></p>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<p>
					<button type="button" class="btn btn-danger deleteBtn">삭제</button>
					<button type="button" class="btn btn-primary updateBtn">수정</button>
				</p>
			</div>
		</div>
	</div>
</div>	

	

</body>
</html>