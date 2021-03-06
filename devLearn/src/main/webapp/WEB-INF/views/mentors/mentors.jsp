<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentors.css" type="text/css">
 <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">

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
// 오늘부터 3주 후 까지만 활성화
function printApplyModal(data) {
	let maxDate = dateFormat(new Date()).replace(/-/gi, "/");
	$("#datetimepicker").datetimepicker("destroy");
	$("#datetimepicker").val("");
	
	$("#datetimepicker").datetimepicker({ 
		datapicker:false,
		lang:'ko',
		allowTimes:allowTime(data),
		minDate: '0',
		maxDate: maxDate,
		disabledWeekDays:disableDay(data)
	});
	console.log(maxDate);
};


// 멘토링 신청 확인 모달에 데이터 뿌리는 함수
function printApplyInfoModal(data) {
	$("#mentoringSubject").html(data.dto.mentorSubject);
	$("#mentorName").html(data.dto.memberNickname);
	$("#applyDate").html(data.mentoringDate);
	$("#menteePhoneNum").html(data.phoneNum);
	$("#applyMsg").html(data.applyMessage);
	$(".priceInfo").html(data.dto.mentorPrice);
	$("#iamportPayment").attr("data-num", data.dto.mentorNum);
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

//데이터 형식 변경 함수
function dateFormat(date) {
	convertDate = new Date(date);
	convertDate.setDate(date.getDate() + 21);
	// console.log(convertDate);
 let month = convertDate.getMonth() + 1;
 let day = convertDate.getDate();

 month = month >= 10 ? month : '0' + month;
 day = day >= 10 ? day : '0' + day;

 return convertDate.getFullYear() + '-' + month + '-' + day;
}

// 카테고리 설정 함수
function selectFn() {
	let choiceValue = $("#choiceValue").val();
	let categoryNum = $("input[name='categoryNum']:checked").val();
	
	location.href="${pageContext.request.contextPath}/mentors/mentor?choiceValue="+choiceValue+"&categoryNum="+categoryNum;
}

// 멘토링 후기 함수
$(function() {
	$(".mentor_review").click(function() {
		let mentorNum = $(this).attr("data-num");
		let choiceValue = $("#choiceValue").val();
		let categoryNum = $("input[name='categoryNum']:checked").val();
		let url = "${pageContext.request.contextPath}/mentors/mentorReviewList";
		let query = "mentorNum=" + mentorNum + "&choiceValue=" + choiceValue + "&categoryNum=" + categoryNum + "&page=${page}";
		
		
		const fn = function(data) {
			console.log(data);
			let str = "";
			$.each(data.list, function(index, item) {
				str += "<div class='review_content mb-5'>";	
				str += "<p>";
					for(let i = 0; i < item.mentorRate; i++) {
						str += "<i class='fas fa-star'></i>";
					}
					for(let i = 0; i < 5 - item.mentorRate; i++) {
						str += "<i class='far fa-star'></i>"
					}
				str += "</p>";
				str += "<p>" + item.mentorReviewContent + "</p></div>";
			});
			console.log(str);
			$(".reviewContainer").html(str);
		};
		
		ajaxFun(url, "get", query, "json", fn);
	})
});
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
				<select class="form-select mb-3" name="choiceValue" id="choiceValue" aria-label="Default select example" onchange="selectFn();">
				  <option value="0" <c:if test="${choiceValue eq 0}">selected="selected"</c:if>>:: 검색조건 ::</option>
				  <option value="1" <c:if test="${choiceValue eq 1}">selected="selected"</c:if>>신규 멘토</option>
				  <option value="2" <c:if test="${choiceValue eq 2}">selected="selected"</c:if>>인기순</option>
				</select>
				<div class="card">
					<div class="card-header">
					 	카테고리
					</div>
					<div class="form-check ms-3 mb-2 mt-3 px-3">
					  <input class="form-check-input" type="radio" name="categoryNum" value="00" id="flexCheckDefault" <c:if test="${categoryNum eq '00'}">checked="checked"</c:if> onclick="selectFn();">
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
											<c:choose>
												<c:when test="${dto.saveFilename eq null}">
													<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded img-fluid" alt="" style="width:60px; height:60px;">
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/uploads/profile/${dto.saveFilename}" class="is-rounded img-fluid" alt="" style="width:60px; height:60px;">
												</c:otherwise>
											</c:choose>
										</figure>
									</div>
									<button class="mentor_review px-1 py-1" data-num="${dto.mentorNum}" data-bs-toggle="modal" data-bs-target="#reviewModal">
										<span><i class="fas fa-star"></i></span>
										<span><fmt:formatNumber value="${dto.reviewAve}" pattern="0.0"/><span>/5 〉</span></span>
									</button>
								</div>
								<p class="card-title">${dto.mentorSubject}</p>
								<p class="card-text">by.${dto.memberNickname}</p>
							</div>
							<div class="card-body">
								<div class="btn-group" role="group" aria-label="Basic outlined example">
								  <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/mentors/mentorProfile?mentorNum=${dto.mentorNum}';">프로필</button>
								  <button type="button" class="btn btn-outline-primary showModal" data-num="${dto.mentorNum}">내용보기</button>
								</div>
							</div>
					    </div>
					  </div>
					</c:forEach>
				</div>
				
				<nav aria-label="...">
				  <div class="pagination justify-content-center page-box">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
				  </div>
				</nav>	
			</div>
		</div>
	</div>
		
	<!-- Review Modal -->
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content" style="height: 900px;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">멘토링 후기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-4 reviewContainer">
	      	
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
	<div class="modal" id="applyCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">신청 정보 확인</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body check px-4">
			<div class="applyInfo">
				<table class="applyInfo table table-bordered">
					<tr>
						<td style="width:20%;">멘토링 명</td>
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
      	 	 <!-- <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">확인</button> -->
      	 	 <button type="button" id="iamportPayment" class="btn btn-primary" data-bs-dismiss="modal" data-num="">결제하기</button>
          </div>
	    </div>
	  </div>
	</div>
<script type="text/javascript">
$(function() {
	$("#iamportPayment").click(function() {
		let url = "${pageContext.request.contextPath}/mentors/mentoringPayment";
		let mentorNum = $(this).attr("data-num");
		let mentoringDate = $("input[name=mentoringDate]").val().trim();
		let memberEmail = $("input[name=memberEmail]").val().trim();
		let phoneNum = $("input[name=phoneNum]").val().trim();
		let applyMessage = $("textarea[name=applyMessage]").val().trim();
		
		let query = "mentorNum=" + mentorNum + "&mentoringDate=" + mentoringDate + "&phoneNum=" + phoneNum + "&applyMessage=" + applyMessage;
		
		const fn = function(data) {
			requestPay(data);
		};
		
		ajaxFun(url, "get", query, "json", fn);
	});
});
	
//결제 스크립트 아임포트
var IMP = window.IMP;
IMP.init("imp99705384");

function requestPay(data) {
	IMP.request_pay (
		{ // param
			pg: "kakaopay.TC0ONETIME", //pg사명.CID
			pay_method: "card",
			merchant_uid: "mentoring-" + data.dto.mentorNum + data.paymentSeq, // 중복되지 않게
			name: data.dto.mentorSubject,
			amount: data.dto.mentorPrice,
			buyer_email: "${sessionScope.member.memberEmail}",
			buyer_name: "${sessionScope.member.memberName}",
		buyer_tel: data.phoneNum
		},
		function (rsp) { // callback
			console.log(rsp);
			if (rsp.success) {
				let url = "${pageContext.request.contextPath}/mentors/mentoringApply";
				let mentorNum = data.mentorNum;
				let memberEmail = rsp.buyer_email;
				let mentoringPrice = rsp.paid_amount;
				let mentoringDate = data.mentoringDate;
				let phoneNum = rsp.buyer_tel;
				let applyMessage = data.applyMessage;
				let paymentCode = rsp.merchant_uid;
				console.log(mentoringPrice);
				let query = "mentorNum=" + mentorNum + "&memberEmail=" + memberEmail + "&mentoringPrice=" + mentoringPrice;
					query += "&mentoringDate=" + mentoringDate + "&phoneNum=" + phoneNum + "&applyMessage=" + applyMessage;
					query += "&paymentCode=" + paymentCode + "&payState=" + rsp.pay_method + "&approveNum=" + rsp.pg_tid;	
				console.log(query);
				
				const fn = function(data) {
					window.location.href="${pageContext.request.contextPath}/mentors/mentor";
				};			
				ajaxFun(url, "post", query, "json", fn);
			} else {
				alert("실패 : 코드(" + rsp.error_code + ") / 메세지(" + rsp.error_msg + " :: 결제 실패..)");
			}
		}
	);
};

</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.full.min.js"></script>
