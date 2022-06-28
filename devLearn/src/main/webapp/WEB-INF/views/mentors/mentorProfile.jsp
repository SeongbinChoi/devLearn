<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentorProfile.css" type="text/css">
<script type="text/javascript">
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

$(function(){
	$("#datetimepicker").datetimepicker({
		allowTimes:[
			  '09:00', '10:00', '11:00', '12:00',
			  '14:00', '15:00', '16:00', '17:00', '18:00'
		]
	});
});

$(function(){
	$(".applyBtn").click(function(){
		let applyDate = $("#datetimepicker").val();
		document.getElementById('applyDate').innerHTML = "";
		document.getElementById('applyDate').innerHTML = applyDate;
	});

});

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

function printDetailModal(data) {
	$(".info_title").html(data.dto.mentorSubject);
	$(".info_title").next("p").html(data.dto.mentorContent);
	$(".modal-footer").children("p").html("1회 멘토링 : 1시간 / " + data.dto.mentorPrice + "원 / 1명");
	$("#applyMentoring").attr("data-num", data.dto.mentorNum);
	$("#applyMentoring2").attr("data-num", data.dto.mentorNum);
	
	$("#mentorInfoModal").modal("show");
}

</script>
	<div class="container mentor_profile">
		<div class="sideBar col-3">
			<div class="side_top py-5 px-3">
				<div class="top-body">
					<div class="title mx-3 mb-2">
						<div class="namePart">
							<p class="card-title">${profileDto.memberNickname}</p>
							<span><i class="fa-regular fa-user"></i> 100 &nbsp;&nbsp;&nbsp;<i class="fa-regular fa-star"></i> 4.5(50)</span>
						</div>
						<div class="mentor_img my-1">
							<figure class="figure">
								<c:choose>
									<c:when test="${profileDto.saveFileName eq null}">
										<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded img-fluid" alt="" style="width:60px; height:60px;">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/uploads/profile/${profileDto.saveFileName}" class="is-rounded img-fluid" alt="" style="width:60px; height:60px;">
									</c:otherwise>
								</c:choose>
							</figure>
						</div>
					</div> 
					<button type="button" class="btn btn-primary apply mx-3 mb-2 showModal" data-bs-toggle="modal" data-bs-target="#mentorInfoModal" data-num="${mentorNum}">멘토링 신청하기</button>
				</div>
				
				<hr>
				
				<div class="sec_body">
					<a class="nav-link active picked" aria-current="page" href="#">· 홈</a>
					<a class="nav-link" href="#">· 강의</a>
					<a class="nav-link" href="#">· 수강후기</a>
				</div>
			</div>
		</div>
		
		<div class="mainContents col py-5 px-5">
			<div class="mentor_info">
				<p class="miniTitle mb-4">소개</p>
				<p class="mb-5">
					${profileDto.intro}
				</p>
				<hr>
			</div>
			
			<div class="mentor_lecture">
				<div class="lec_top mb-4 mt-5">
					<p class="miniTitle">강의(8)</p>
					<button type="button" class="btn btn-outline-primary" onclick="location.href='#'">더보기</button>
				</div>
				<div class="row row-cols-1 row-cols-md-3 g-4">
					<c:forEach var="i" begin="1" end="6">
						<div class="col">
							<div class="card h-100">
								<img src="https://s3.ap-northeast-2.amazonaws.com/grepp-cloudfront/programmers_imgs/learn/thumb-course-java-intermediate.jpg" class="card-img-top" alt="">
								<div class="card-body py-3">
									<p class="card-title">어렵게 배우는 자바</p>
									<p class="card-text">자바의 신</p>
									<p>
										<c:forEach var="s" begin="1" end="5">
											<i class="fas fa-star" style="color: #FDCC11; font-size:13px;"></i>
										</c:forEach>
										 (10)
									</p>
									<p class="price">
										<fmt:formatNumber value="99999" type="currency" />
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<hr class="mt-5">
			</div>
			
			
			<div class="mentor_review">
				<div class="lec_top mb-4 mt-5">
					<p class="miniTitle">수강후기</p>
				</div>
				<c:forEach var="vo" items="${reviewList}">
					<div class="review_content mb-5">
						<p>
							<c:forEach begin="1" end="${vo.mentorRate}">
								<i class="fas fa-star" style="color: #FDCC11;"></i>
							</c:forEach>
							<c:forEach begin="${vo.mentorRate}" end="4">
								<i class="far fa-star"></i>
							</c:forEach>
						</p>
						<p>${vo.mentorReviewContent}</p>
					</div>
				</c:forEach>
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

<script type="text/javascript">

</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.full.min.js"></script>
