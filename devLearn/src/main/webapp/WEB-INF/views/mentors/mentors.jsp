<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentors.css" type="text/css">
<script type="text/javascript">

/* $(function(){
	$("#datetimepicker").datetimepicker({
		datapicker:false,
		allowTimes:[
			'12:00', '13:00', '15:00'
		]
	});
	
}); */

$(function(){
	$(".applyBtn").click(function(){
		let applyDate = $("#datetimepicker").val();
		document.getElementById('applyDate').innerHTML = "";
		document.getElementById('applyDate').innerHTML = applyDate;
	});

});

function applyMentoring() {
	
}

function login() {
	$("#loginModal").modal("show");
}

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
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

// 멘토링 상세 페이지 모달에 값 뿌리는 ajax
$(function() {
	$(".showModal").click(function() {
		let mentorNum = $(this).attr("data-num");
		let url = "${pageContext.request.contextPath}/mentors/mentorDetail";
		let query = "mentorNum=" + mentorNum;
		
		const fn = function(data) {
			printDetailModal(data);
		};
			
		ajaxFun(url, "get", query, "json", fn);
	});
});

// 멘토링 신청 페이지 모달에 값 뿌리는 ajax
$(function() {
	$("#applyMentoring").click(function() {
		let mentorNum = $(this).attr("data-num");
		let url = "${pageContext.request.contextPath}/mentors/mentorApply";
		let query = "mentorNum=" + mentorNum;
		
		const fn = function(data) {
			printApplyModal(data);
		};
		
		ajaxFun(url, "get", query, "json", fn);
	})
});

// 멘토링 신청 정보 확인 모달에 값 뿌리는 ajax
$(function() {
	$("#applyMentoring2").click(function() {
		let mentorNum = $(this).attr("data-num");
		let url = "${pageContext.request.contextPath}/mentors/ApplyInfoCheck";
		let mentoringDate = $("#datetimepicker").val().trim();
		let phoneNum = $("#memberPhone").val().trim();
		let applyMessage = $("#applyMentoringMsg").val().trim();
		let query = "mentorNum=" + mentorNum + "&mentoringDate=" + mentoringDate + "&phoneNum=" + phoneNum + "&applyMessage=" + applyMessage;
		
		const fn = function(data) {
			printApplyInfoModal(data);
		};
		
		ajaxFun(url, "get", query, "json", fn);
	})
});

// 멘토링 소개 모달에 데이터 뿌리는 함수
function printDetailModal(data) {
	$(".info_title").html(data.dto.mentorSubject);
	$(".info_title").next("p").html(data.dto.mentorContent);
	$(".modal-footer").children("p").html("1회 멘토링 : 1시간 / " + data.dto.mentorPrice + "원 / 1명");
	$("#applyMentoring").attr("data-num", data.dto.mentorNum);
	$("#applyMentoring2").attr("data-num", data.dto.mentorNum);
	
	$("#mentorInfoModal").modal("show");
}

// 멘토링 신청 모달에 데이터 뿌리는 함수
function printApplyModal(data) {
	$("#datetimepicker").datetimepicker("destroy");
	$("#datetimepicker").val("");
	$("#datetimepicker").datetimepicker({ 
		datapicker:false,
		allowTimes:allowTime(data),
		minDate: 0,
		disabledWeekDays:disableDay(data)
	});
};

// 멘토링 신청 확인 모달에 데이터 뿌리는 함수
function printApplyInfoModal(data) {
	$("#mentoringSubject").html(data.dto.mentorSubject);
	$("#mentorName").html(data.dto.memberNickname);
	$("#applyDate").html(data.mentoringDate);
	$("#menteePhoneNum").html(data.phoneNum);
	$("#applyMsg").html(data.applyMessage);
	$(".priceInfo").html(data.dto.mentorPrice);
	$("input[name=mentorNum]").val(data.dto.mentorNum);
	$("input[name=mentorPrice]").val(data.dto.mentorPrice);
	$("input[name=mentoringDate]").val(data.mentoringDate);
	$("input[name=phoneNum]").val(data.phoneNum);
	$("input[name=applyMessage]").val(data.applyMessage);
}

// 가능 시간 반환 함수
function allowTime(data) {
	let ableTimeArr = [];
		
	for(let i = 0; i < data.ableTime.length; i++) {
		ableTimeArr.push(data.ableTime[i] + ":00");
	}
	return ableTimeArr;	
}

//  요일 비활성 반환 함수
function disableDay(data) {
	let disableDayArr = [];
	let str = data.dto.ableDay;
	let arr = str.split(",");
	
	for(let i = 0; i < 7; i++) {
		if(arr.indexOf(String(i)) === -1) {
			disableDayArr.push(i);
		}
	}
	return disableDayArr;
}

// 카테고리 설정 함수
function selectFn() {
	let choiceValue = $("#choiceValue").val();
	let categoryNum = $("input[name='categoryNum']:checked").val();
	
	location.href="${pageContext.request.contextPath}/mentors/mentor?choiceValue="+choiceValue+"&categoryNum="+categoryNum;
}


</script>

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>멘토링</span><br>업계 선배들 혹은 동료들에게서 인사이트를 얻어보세요.<br>더 빨리, 더 멀리 갈 수 있어요.</p>
			</div>
		</div>
	</div>
	<div class="container mb-5">
		<div class="contents">
			<div class="side col-2.5 px-4">
				<select class="form-select mb-3" name="choiceValue" id="choiceValue" aria-label="Default select example">
				  <option value="0" <c:if test="${choiceValue eq 0}">selected="selected"</c:if> onclick="selectFn();">:: 검색조건 ::</option>
				  <option value="1" <c:if test="${choiceValue eq 1}">selected="selected"</c:if> onclick="selectFn();">신규 멘토</option>
				  <option value="2" <c:if test="${choiceValue eq 2}">selected="selected"</c:if> onclick="selectFn();">인기순</option>
				</select>
				<div class="card">
					<div class="card-header">
					 	카테고리
					</div>
					<div class="form-check ms-3 mb-2 mt-3 px-3">
					  <input class="form-check-input" type="radio" name="categoryNum" value="0" id="flexCheckDefault" <c:if test="${categoryNum eq 0}">checked="checked"</c:if> onclick="selectFn();">
					  <label class="form-check-label" for="flexCheckDefault">전체</label>
					</div>
					<c:forEach var="vo" items="${categoryList}">
						<div class="form-check ms-3 mb-2 mt-3 px-3">
						  <input class="form-check-input" type="radio" name="categoryNum" value="${vo.categoryCode}" id="flexCheckDefault" <c:if test="${categoryNum eq vo.categoryCode}">checked="checked"</c:if> onclick="selectFn();">
						  <label class="form-check-label" for="flexCheckDefault">${vo.categoryName}</label>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col">
				<div class="row row-cols-1 row-cols-md-4 g-3 mb-5">
					<c:forEach var="dto" items="${list}">
					  <div class="col">
				    	<div class="card h-100">
							<div class="card-body my-3 mx-2">
								<div class="mentor_header">
									<div class="mentor_img mb-4">
										<figure class="figure">
											<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded img-fluid" alt="">
										</figure>
									</div>
									<button class="mentor_review px-1 py-1" data-bs-toggle="modal" data-bs-target="#reviewModal">
										<span><i class="fas fa-star"></i></span>
										<span>${dto.reviewAve}<span>/5 〉</span></span>
									</button>
								</div>
								<p class="card-title">${dto.mentorSubject}</p>
								<p class="card-text">by.${dto.memberNickname}</p>
							</div>
							<div class="card-body">
								<div class="btn-group" role="group" aria-label="Basic outlined example">
								  <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/mentor_profile.jsp'">프로필</button>
								  <button type="button" class="btn btn-outline-primary showModal" data-num="${dto.mentorNum}">내용보기</button>
								</div>
							</div>
					    </div>
					  </div>
					</c:forEach>
				</div>
				
				<nav aria-label="...">
				  <ul class="pagination justify-content-center">
				    <li class="page-item disabled">
				      <span class="page-link">Previous</span>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item active" aria-current="page">
				      <span class="page-link">2</span>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				</nav>	
			</div>
		</div>
	</div>
		
	<!-- Review Modal -->
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">멘토링 후기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-4">
	      	<c:forEach var="i" begin="1" end="5">
				<div class="review_content mb-5">
					<p>
						<c:forEach var="s" begin="1" end="5">
							<i class="fas fa-star"></i>
						</c:forEach>
					</p>
					<p>혼자 개발하는 경우가 많아 코드를 어떻게 개선할 수 있을까 고민하다가 신청하게 되었는데 준비도 많이 해주시고 여러가지 방안을 제시해주셔서 도움이 많이 되었습니다. 실제 코드도 봐주시고 평소에 개발하면서 궁금한 부분들도 속시원하게 답변해 주셔서 좋았습니다. 앞으로도 개발하다가 고민거리가 생기면 찾아뵐것 같습니다. 이런 채널이 있다는게 감사한것 같아요. 감사합니다 !!</p>
				</div>
			</c:forEach>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 멘토링 소개 모달 -->
	<div class="modal" id="mentorInfoModal" tabindex="-1" aria-labelledby="mentorInfoLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="mentorInfoLabel">멘토링 소개</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-4">
			<div class="mentor_info mb-5">
				<div class="info_title bg-light text-dark fw-bold rounded shadow-sm mb-3 px-1 py-1">
	     	    </div>
				<p>
				</p>
			</div>
	      </div>
	      
	      <div class="modal-footer">
	      	 <p></p>
      	 	 <button type="button" class="btn btn-primary" id="applyMentoring" data-bs-target="#applyMentoringModal" data-bs-toggle="modal">신청하기</button>
          </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 멘토링 신청 정보 작성 모달  -->
	<div class="modal" id="applyMentoringModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="applyMentoringLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="applyMentoringLabel">신청하기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-4">
			<div class="mentor_info mb-5">
				<div class="schedule">
					<label for="datetimepicker" class="form-label">스케줄 설정</label>
					<p><input type="text" class="form-control" name="mentoringDate" readonly="readonly" placeholder="날짜 및 시간 선택" id="datetimepicker" ></p>
				</div>
				<div class="memberEmail mt-3 mb-3">
					<label for="connectEmail" class="form-label">연락 가능한 이메일</label>
					<input type="email" class="form-control" id="connectEmail" name="memberEmail" readonly="readonly" value="${sessionScope.member.memberEmail}">
				</div>
				<div class="memberPhone mt-3 mb-3">
					<label for="memberPhone" class="form-label">연락처</label>
					<input type="text" class="form-control" id="memberPhone" name="phoneNum" placeholder="000-0000-0000" value="${sessionScope.member.phoneNum}">
				</div>
				<div class="message mt-3 mb-3">
					<label for="applyMentoringMsg" class="form-label">멘토에게 남길 메시지</label>
					<textarea id="applyMentoringMsg" class="ac-input apply-mentoring__input" name="applyMessage"
						placeholder="멘토링 받고 싶은 내용을 상세하게 남겨주시면 더욱 의미있는 시간을 가질 수 있어요!" style="width: 100%; height: 250px;"></textarea>
				</div>
			</div>
	      </div>
	      <div class="modal-footer">
	      	 <a class="btn btn-outline-primary" data-bs-toggle="modal" href="#mentorInfoModal" role="button">이전으로</a>
      	 	 <button type="button" class="btn btn-primary applyBtn" id="applyMentoring2" data-bs-target="#applyCheckModal" data-bs-toggle="modal">신청하기</button>
          </div>
	    </div>
	  </div>
	</div>

		<!-- 멘토링 신청 정보 확인 모달 -->
	<form name="applyForm" method="post" action="${pageContext.request.contextPath}/mentors/mentoringApply">
	<div class="modal" id="applyCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">신청 정보 확인</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body check px-4">
			<div class="applyInfo">
				<table class="applyInfo">
					<tr>
						<td>멘토링 명</td>
						<td id="mentoringSubject"></td>
					</tr>
					<tr>
						<td>멘토</td>
						<td id="mentorName"></td>
					</tr>
					<tr>
						<td>멘티</td>
						<td>${sessionScope.member.memberNickname}</td>
					</tr>
					<tr>
						<td>일정 </td>
						<td id="applyDate"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td id="menteePhoneNum"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td id="menteeEmail">${sessionScope.member.memberEmail}</td>
					</tr>
					<tr>
						<td>메시지</td>
						<td id="applyMsg"></td>
					</tr>
				</table>
			</div>
	      </div>
	      <div class="modal-body check px-4">
			<div class="applyInfo">
				결제 금액
			</div>
			<div class="priceInfo">
				원
			</div>
	      </div>
	      <div class="modal-footer">
	      		<a class="btn btn-outline-primary" data-bs-toggle="modal" href="#applyMentoringModal" role="button">이전으로</a>
      	 	 <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
          </div>
	    </div>
	  </div>
	</div>
	<input type="hidden" name="mentorNum" value="">
	<input type="hidden" name="mentorPrice" value="">
	<input type="hidden" name="mentoringDate" value="">
	<input type="hidden" name="phoneNum" value="">
	<input type="hidden" name="applyMessage" value="">
	</form>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.full.min.js"></script>
