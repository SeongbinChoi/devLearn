<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



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

#detailModal .selectColor {
	justify-content: space-between;
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


<jsp:include page="memberPage.jsp"/>

<h2>일정 관리</h2>
<div id='calendar'></div>


<!-- 일정 추가 모달 -->
<div class="modal modal-dialog-scrollable" id="addModal" tabindex="-1">
<form name="addForm" method="post">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="subject">
					<label class="form-label">제목</label>
					<input type="text" name="subject" class="form-control long subject" value="">
				</div>
				
				<div class="selectColor">
					<label for="exampleColorInput" class="form-label">색상</label>
					<input type="color" name="planColor" class="form-control form-control-color mx-5" id="exampleColorInput" value="#563d7c" title="Choose your color">
				</div>
				
				<div class="start">
					<label class="form-label">시작일</label>
					<input type="text" name="sDate" class="form-control long" id="sDate" value="" readonly="readonly">
				</div>
				
				<div class="end" id="add-end">
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
</form>	
</div>	




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
				
				<div class="selectColor">
					<label class="form-label">색상</label>
					<p class="view-color"></p>
				</div>
				
				<div class="start">
					<label class="form-label">시작일</label>
					<p class="view-sDate"></p>
				</div>
				
				<div class="end" id="view-end">
					<label class="form-label">종료일</label>
					<p class="view-eDate"></p>
				</div>
				
				<div class="form-check">
					<div class="repeatLeft">
						<p class="view-repeat"></p>
						<input type="hidden" class="repeat-num" value="">
						<p class="view-cycle"></p>
						<input type="hidden" class="cycle-num" value="">
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


<!-- 일정 수정 모달 -->
<form name="updateForm" method="post">
<div class="modal modal-dialog-scrollable" id="updateModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="subject">
					<label class="form-label">제목</label>
					<input type="text" name="subject" class="form-control long update-subject" value="">
				</div>
				
				<div class="selectColor">
					<label for="exampleColorInput" class="form-label">색상</label>
					<input type="color" name="planColor" class="form-control form-control-color mx-5 update-color" id="exampleColorInput2" value="#563d7c" title="Choose your color">
				</div>
				
				<div class="start">
					<label class="form-label">시작일</label>
					<input type="text" name="sDate" class="form-control long update-sDate" id="sDate2" value="" readonly="readonly">
				</div>
				
				<div class="end" id="update-end">
					<label class="form-label">종료일</label>
					<input type="text" name="eDate" class="form-control long update-eDate" id="eDate2" value="" readonly="readonly">
				</div>
				
				<div class="form-check">
					<div class="repeatLeft">
						<label class="form-check-label" for="flexCheckDefault">
						  	반복
						</label>
						<input class="form-check-input update-rCheck" name="repeatCheck" type="checkbox" value="" id="flexCheckDefault2">
					</div>
					<select class="form-select long update-rCycle" id="selectYear2" name="repeatCycle"  aria-label="Default select example">
						<option selected value="0">:: 반복주기 ::</option>
						<option value="1">1년</option>
						<option value="2">2년</option>
						<option value="3">3년</option>
					</select>
				</div>
				
				
				<label class="form-label">메모</label>
				<textarea name="memo" class="update-memo"></textarea>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary updateSubmit">수정하기</button>
			</div>
		</div>
	</div>
</div>	

</form>	
	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
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

$('#addModal').on('hidden.bs.modal', function (e) {
    $(this).find('form')[0].reset();
});

$(function(){

    $('#selectYear').hide();
    $('#selectYear2').hide();
    
    $('#add-end').show();
    $('#view-end').show();
});

$(function(){
	$("input:checkbox").on('click', function() {
		
		let chk = $('#flexCheckDefault').is(':checked');
		if(chk){
			$('#selectYear').show();
			$('#add-end').hide();
		} else {
			$('#selectYear').hide();
			$('#add-end').show();
		}
		
		chk = $('#flexCheckDefault2').is(':checked');
		
		if(chk){
			$('#selectYear2').show();
			$('#update-end').hide();
		} else {
			$('#selectYear2').hide();
			$('#update-end').show();
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
			
		    let real_eDate = daysLater(info.endStr, 0);
			$('#eDate').val(real_eDate);
			
			$('#selectYear').hide();
			$('#add-end').show();
			
		},
		events : function(info, successCallback, failureCallback) {
			
			let url = "${pageContext.request.contextPath}/mypage/myPlan/myPlan";
			let startDay=info.startStr.substr(0, 10);
			let endDay=info.endStr.substr(0, 10);
			let query = "sDate="+startDay+"&eDate="+endDay;
			
			var fn = function(data){
				let arrayEvents = [];
				for(let i=0; i<data.list.length; i++){
					let item = data.list[i];
					let obj = {};
					obj.id = item.planNum;
					obj.title = item.subject;
					obj.start = item.sDate;
					obj.end = item.eDate;
					obj.color = item.planColor;
					obj.allDay = true;
					
					let objProp = {};
					objProp.planNum = item.planNum;
					objProp.repeatCheck = item.repeatCheck;
					objProp.repeatCycle = item.repeatCycle;
					objProp.memo = item.memo;
					
					obj.extendedProps = objProp;
				
					arrayEvents.push(obj);
				}
				
				/*
				let arrayEvents = [
					<c:forEach var="vo" items="${list}">
						{
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
				];
				*/
				successCallback(arrayEvents);
			};
			
			
			ajaxFun(url, "get", query, "json", fn);
		},
		
		eventClick : function(info){
			viewSchedule(info.event);
		}
	});
	calendar.render();
});


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
	    
	    
	    let real_eDate = $('#eDate').val();
	    let eDate = daysLater(real_eDate, 2);
		$('#eDate').val(eDate);
		
		
	    let chk = $('#flexCheckDefault').is(':checked');
	    
	    if(chk){
	    	$('#flexCheckDefault').val(1);
	    	let sDate = $('#sDate').val();
	    	$('#eDate').val(daysLater(sDate, 2));
	    	
	    } else {
	    	$('#flexCheckDefault').val(0);
	    }
	    
	    	
		var query = $("form[name=addForm]").serialize() ;
        
		var fn = function(data){
	        $("#addModal").modal("hide");
	        calendar.refetchEvents();
		};
		
		var url = "${pageContext.request.contextPath}/mypage/myPlan/myPlan";

		ajaxFun(url, "post", query, "json", fn);
	});
});


// 일정 상세
function viewSchedule(calEvent) {
	let num = calEvent.extendedProps.planNum;
	
	let url = "${pageContext.request.contextPath}/mypage/myPlan/detail";
	let query = "planNum="+num;
	
	var fn = function(data){
		$(".deleteBtn").attr("data-num", num);
		$(".updateBtn").attr("data-num", num);
		
		$(".view-subject").html(data.cal.subject);
		$(".view-color").html(data.cal.planColor);
		$(".view-sDate").html(data.cal.sDate);
		
		let real_eDate = daysLater(data.cal.eDate, 0);
		$(".view-eDate").html(real_eDate);
		
		$(".repeat-num").val(data.cal.repeatCheck);
		$(".cycle-num").val(data.cal.repeatCycle);

		$('#view-end').show();
		if(data.cal.repeatCheck == '1'){
			$('#view-end').hide();
		}
		
		repeat = data.cal.repeatCheck != 0 && data.cal.repeatCycle != 0 ? "반복일정" : "반복안함";
		repeat_cycle = data.cal.repeatCycle != 0 ? "반복주기 " + data.cal.repeatCycle + "년" : "";
		$(".view-repeat").html(repeat);
		$(".view-cycle").html(repeat_cycle);
		
		$(".view-memo").html(data.cal.memo);
		
		$('#detailModal').modal('show');
	};

	ajaxFun(url, "get", query, "json", fn);
	


	
}


$(function(){
	// 일정 수정폼	
	$(".updateBtn").click(function(){
		let planNum = $(this).attr("data-num");
		
		let url = "${pageContext.request.contextPath}/mypage/myPlan/detail";
		let query = "planNum="+planNum;
		
		var fn = function(data){
			$(".updateSubmit").attr("data-num", planNum);
			
			$(".update-subject").val(data.cal.subject);
			$(".update-color").val(data.cal.planColor);
			$(".update-sDate").val(data.cal.sDate);
			
			let real_eDate = daysLater(data.cal.eDate, 0);
			$(".update-eDate").val(real_eDate);
			$(".update-rCheck").val(data.cal.repeatCheck);
			
			$(".update-memo").val(data.cal.memo);
			
			$('#detailModal').modal('hide');
			$('#updateModal').modal('show');
			
			if(data.cal.repeatCheck == "1"){
				$("input:checkbox[id='flexCheckDefault2']").prop("checked", true);

			} else {
				$("input:checkbox[id='flexCheckDefault2']").prop("checked", false);
			}
			
			let chk = $('#flexCheckDefault2').is(':checked');
			
			if(chk){
				$('#selectYear2').show();
				
			} else {
				$('#selectYear2').hide();
			}
			
			$("#selectYear2").val("0").prop("selected", false);	
			$("#selectYear2").val(data.cal.repeatCycle).prop("selected", true);

		};

		ajaxFun(url, "get", query, "json", fn);
		

	});
	
	// 일정 수정
	$(".updateSubmit").click(function(){
		let real_eDate = $('#eDate2').val();
	    let eDate = daysLater(real_eDate, 2);
		$('#eDate2').val(eDate);
		
		let chk = $('#flexCheckDefault2').is(':checked');
	    
	    if(chk){
	    	$('#flexCheckDefault2').val(1);
	    	let sDate = $('#sDate2').val();
	    	$('#eDate2').val(daysLater(sDate, 2));
	    } else {
	    	$('#flexCheckDefault2').val(0);
	    }
		
		var query = $("form[name=updateForm]").serialize() ;
        
		var fn = function(data){
	        $("#updateModal").modal("hide");
	        calendar.refetchEvents();

		};
		
		
		var planNum = $(this).attr("data-num");
		query += "&planNum="+planNum;
		var url = "${pageContext.request.contextPath}/mypage/myPlan/update";

		ajaxFun(url, "post", query, "json", fn);
		
	});
	
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

