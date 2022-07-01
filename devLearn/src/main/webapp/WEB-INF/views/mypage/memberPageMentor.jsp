<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.status-section {
	height: 60px;
	padding: 12px 8px;
	border: 1px solid #ddd;
	border-radius: 10px;
}

.status-section span {
	font-weight: 600;
}

.status-section ul {
	padding: 0;
	margin: 0 0 0 40px;
	list-style: none;

}

.status-section li {
	float: left;
	margin-right: 25px;
}

.status-section li a:not(.is-active) {
	text-decoration: none;
	color: #aaa;
}

.status-section li a:hover {
	color: #0d6efd;
	font-weight: 700;
}

.is-active {
	color: #0d6efd;
	font-weight: 700;
	text-decoration: none;
}

.list-table {
	width: 100%;
	margin: 20px auto;
	border-collapse: collapse;
	text-align: center;
}

.list-table td, .list-table th {
	border: 1px solid #ddd;
	height: 50px;
	vertical-align: middle;
}

.list-table td:nth-child(4n+2) {
	padding-left: 5px;
	text-align: left;
}

.list-table td:last-child {
	text-align: center;
}

.status-section .mentorTab li .clicked{
	color:#0d6efd;
	font-weight: bold;	
}


.review-content {
	width: 300px;
	height: 230px;
	border-radius: 4px;
	border: 1px solid lightgray;
	resize: none;
}


.fa-star {
	color: gray;
	cursor: pointer;
}

.star {
	color: #FDCC11;
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

$(function(){
	
	$('.tabLink').removeClass("clicked");
	$('#mentor${status}').addClass("clicked");
	
});


$(function() {
	$(".detail").click(function() {
		let mentoringNum = $(this).attr("data-num");
		
		let url = "${pageContext.request.contextPath}/mypage/mentor/detail";
		let query = "mentoringNum="+mentoringNum;
		
		var fn = function(data){
			
			$(".view-subject").html(data.am.mentorSubject);
			$(".view-nick").html(data.am.memberNickname);
			$(".view-content").html(data.am.mentorContent);
			
			$(".view-period").html(data.am.mentoringDate);
			
			$(".view-price").html(data.am.mentoringPrice);
			
			$('#mentorInfoModal').modal('show');
		};

		ajaxFun(url, "get", query, "json", fn);
		

	});
});



$(function() {
	
	$(".reviewBtn").click(function() {

		let mentoringNum = $(this).attr("data-num");
		let mentorNum = $(this).attr("mentor-num");
		
		let url = "${pageContext.request.contextPath}/mypage/mentor/readReview";
		let query = "mentoringNum="+mentoringNum;
		
		var fn = function(data){
			$('.reviewSubmit').attr('data-num', mentoringNum);
			$('.reviewSubmit').attr('mentor-num', mentorNum);
			
			if(data.readReview != null){
				console.log(data.readReview);
				let point = data.readReview.mentorRate;
				$('.point-list i').parent().children('i').removeClass('star');
				$('.point-list i:nth-child('+point+')').addClass('star').prevAll('i').addClass('star');
				
				$(".review-content").html(data.readReview.mentorReviewContent);
				
				
			} else {
				$(".review-content").html("");
				$('.point-list i').parent().children('i').removeClass('star');
				$('.point-list i:nth-child(1)').addClass('star');
			}
			
			
			$('#mentorReviewModal').modal('show');
		};

		ajaxFun(url, "get", query, "json", fn);
		

	});
});


$(function() {
	$('.point-list i').click(function(){
		  $(this).parent().children('i').removeClass('star');
		  $(this).addClass('star').prevAll('i').addClass('star');
		  
		  for(let x=2; x<=5; x++){
			  if(! $('i:nth-child('+x+')').hasClass('star')){
				  $('.reviewSubmit').attr('point-num', x-1);
				  break;
			  }
			  if(x == 5){
				  $('.reviewSubmit').attr('point-num', 5);
				  break;
			  }
		  }
		  
		  return false;
	});
	
	

});


$(function() {
	$('.reviewSubmit').click(function() {
		const f = document.reviewForm;
		let mentoringNum = $(this).attr("data-num");
		let mentorRate = $(this).attr("point-num");
		let mentorNum = $(this).attr("mentor-num");
		
		$(".mentoringNum").val(mentoringNum);
		$(".mentorRate").val(mentorRate);
		$(".mentorNum").val(mentorNum);
		
		let url = "${pageContext.request.contextPath}/mypage/mentor/insertReview";
		
		f.action = url;
		f.submit();
		
	});	
	
});

</script>


<jsp:include page="memberPage.jsp"/>
	<div class="status-section d-flex align-items-center">
		<span>&nbsp;&nbsp;STATUS</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 
		<ul class="mentorTab">
			<li><a href="${pageContext.request.contextPath}/mypage/mentor/list?status=9" class="tabLink clicked" id="mentor9">전체</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/mentor/list?status=0" class="tabLink" id="mentor0">승인대기</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/mentor/list?status=1" class="tabLink" id="mentor1">예약확정</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/mentor/list?status=3" class="tabLink" id="mentor3">이용완료</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/mentor/list?status=4" class="tabLink" id="mentor4">취소/환불</a></li>
		</ul>
	</div>
	<div class="mentor-content">
		<table class="list-table table table-striped">
			<thead>
				<tr>
					<th style="width: 10%;">신청번호</th>
					<th>제목</th>
					<th style="width: 15%;">멘토링 날짜</th>
					<th style="width: 10%;">결제액</th>
					<th colspan="2" style="width: 20%;">신청상태</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>	
						<td>${dto.listNum}</td>
						<td>${dto.mentorSubject}</td>
						<td>${dto.mentoringDate}</td>
						<td>${dto.mentoringPrice}</td>		
						<td>${dto.status == 0 ? "승인 대기중" : dto.status == 1 ? "예약 확정" : "이용 완료"}</td>
						<c:choose>
							<c:when test="${dto.status == 0}">
								<td><button type="button" class="btn btn-secondary deleteBtn" data-num="${dto.mentoringNum}">신청취소</button></td>
							</c:when>
							<c:when test="${dto.status == 1}">
								<td><button type="button" class="btn btn-secondary detail detailBtn" data-num="${dto.mentoringNum}">자세히</button></td>
							</c:when>
							<c:when test="${dto.status == 3}">
								<td><button type="button" class="btn btn-secondary reviewBtn" data-num="${dto.mentoringNum}" mentor-num="${dto.mentorNum}">후기작성</button></td>
							</c:when>
							<c:otherwise>
								<td><button type="button" class="btn btn-secondary detail detailBtn" data-num="${dto.mentoringNum}">자세히</button></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div>
			${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }
		</div>
	</div>

	
	<!-- 자세히보기 모달 -->
	<div class="modal fade" id="mentorInfoModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">멘토링 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<td class="table-light col-3 align-middle">제목</td>
							<td>
								<p class="form-control-plaintext view-subject"></p>
							</td>
						</tr>
						<tr>
							<td class="table-light col-3 align-middle">멘토</td>
							<td>
								<p class="form-control-plaintext view-nick"></p>
							</td>
						</tr>
						<tr>
							<td class="table-light col-3 align-middle">내용</td>
							<td>
								<p class="form-control-plaintext view-content"></p>
							</td>
						</tr>
	
						<tr>
							<td class="table-light col-3 align-middle">상담날짜</td>
							<td>
								<p class="form-control-plaintext view-period"></p>
							</td>
						</tr>
	
						<tr>
							<td class="table-light col-3 align-middle">결제금액</td>
							<td>
								<p class="form-control-plaintext view-price"></p>
							</td>
						</tr>
						
						<tr>
							<td class="table-light col-3 align-middle">결제방법</td>
							<td>
								<p class="form-control-plaintext view-method"></p>
							</td>
						</tr>

					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 후기작성 모달 -->
	<form name="reviewForm" method="post">
		<div class="modal fade" id="mentorReviewModal" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">후기 작성</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table">
							
							<tr>
								<td class="table-light col-3 align-middle">평점</td>
								<td class="point-list">
									<span>
										<i class="fas fa-star star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</span>
								</td>
							</tr>
		
							<tr>
								<td class="table-light col-3 align-middle">후기</td>
								<td>
									<textarea class="review-content" name="mentorReviewContent"></textarea>
								</td>
							</tr>
	
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary reviewSubmit" point-num="1" data-num="" mentor-num="">작성하기</button>
						<input type="hidden" name="mentoringNum" class="mentoringNum" value="">
						<input type="hidden" name="mentorRate" class="mentorRate" value="">
						<input type="hidden" name="mentorNum" class="mentorNum" value="">
					</div>
				</div>
			</div>
		</div>
	</form>