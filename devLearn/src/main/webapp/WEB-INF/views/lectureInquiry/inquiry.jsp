<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lectureDetail.css" type="text/css">

<style type="text/css">
.body-container {
	max-width: 800px;
}

.inquiry-form textarea { width: 100%; height: 75px; resize: none; }

.inquiry-list tr:nth-child(2n+1) { border: 1px solid #ccc; background: #f8f9fa; }
.inquiry-list .deleteInquiry, .inquiry-list .answer { cursor: pointer; }
.inquiry-list .deleteInquiry:hover { text-decoration: underline; color: #F28011; }

textarea::placeholder{
	opacity: 1;
	color: #333;
	text-align: center;
	line-height: 60px;
}
</style>

<script type="text/javascript">
function login() {
	location.href = "${pageContext.request.contextPath}/member/login";
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

$(function() {
	listPage(1);
});

// 문의 리스트
function listPage(page) {
	let url = "${pageContext.request.contextPath}/lectureInquiry/list";
	let query = "pageNo=" + page + "&lectureNum=${lectureNum}";
	
	const fn = function(data) {
		printInquiry(data);
	};
	ajaxFun(url, "get", query, "json", fn);
}

function printInquiry(data) {
	const uid = "${sessionScope.member.memberEmail}";
	const qNickname = "${sessionScope.member.memberNickname}";
	let permission = "${sessionScope.member.memberRole == 99 ? 'true' : 'false'}"; 
	
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	$(".inquiry-count").attr("data-pageNo", pageNo);
	$(".inquiry-count").attr("data-totalPage", total_page);
	
	$("#listLecInq").show();
	$(".inquiry-count").html("문의 " + dataCount + "개");
	
	$(".more-box").hide();
	if(parseInt(dataCount) === 0) {
		$(".inquiry-list-body").empty();
		return;
	}
	
	if(pageNo < total_page) {
		$(".more-box").show();
	}
	
	let out = "";
	for(let idx=0; idx < data.list.length; idx++) {
		let inquiryNum = data.list[idx].inquiryNum;
		
		let qmember = data.list[idx].qmember;
		let question = data.list[idx].question;
		let q_regDate = data.list[idx].q_regDate;
		
		let instructorEmail = data.list[idx].instructorEmail;
		let amember = data.list[idx].amember;
		let answer = data.list[idx].answer;
		let a_regDate = data.list[idx].a_regDate;
		let aNickname = data.list[idx].aNickname;
		
		// 문의자 이메일, 날짜, 삭제 버튼
		out += "<tr>";
		out += "	<td width='50%'><i class='bi bi-person-circle text-muted'></i> <span>" + qNickname + "</span></td>";
		out += "	<td width='50%' align='right'>" + q_regDate;
		
		if(uid === qmember || permission === "true") {
			out += "	| <span class='deleteInquiry' data-inquiryNum='" + inquiryNum + "'>삭제</span>";
		} else if(uid === instructorEmail && answer === null) {
			out += "	| <span class='answer' data-inquiryNum='" + inquiryNum + "'>답변</span>";	
		}
		out += "    </td>";
		out += "</tr>";
		
		// 문의 내용
		out += "<tr>";
		out += "    <td colspan='2' valign='top'>" + question + "</td>"; 
		out += "</tr>";
		
		if(answer != null) { // 답변 부분은 없다면 출력하면 안되니까  if
			// 답변자 이메일, 날짜
			out += "<tr>";
			out += "	<td width='45%'>&nbsp<i class='bi bi-arrow-return-right'></i>&nbsp<i class='bi bi-person-circle text-muted'></i> <span>" +  aNickname + "</span></td>";
			out += "	<td width='45%' align='right'>" + a_regDate;
			out += "    </td>";
			out += "</tr>";
			
			// 답변 내용
			out += "<tr>";
			out += "    <td colspan='2' valign='top'>&nbsp&nbsp&nbsp&nbsp&nbsp" + answer + "</td>"; 
			out += "</tr>";
		} 
		
	}
	
	$(".inquiry-list-body").append(out);
}

// 문의 등록
$(function() {
	$(".btnSend").click(function() {
		let question = $("#question").val().trim();
		if(! question) {
			$("#question").focus();
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/lectureInquiry/insert";
		let query = "question=" + encodeURIComponent(question) + "&lectureNum=${lectureNum}";
		
		const fn = function(data) {
			$("#question").val("");
			$(".inquiry-list-body").empty();
			listPage(1);
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});

// 답변 등록
$(function() {
	$(".btnAns").click(function() {
		let lectureNum = "${dto.lectureNum}";
		let answer = $("#answer").val().trim();
		if(! answer) {
			$("#answer").focus();
			return false;			
		}
		
		let url = "${pageContext.request.contextPath}/lectureInquiry/answer";
		let query = "answer=" + encodeURIComponent(answer) + "&lectureNum=${lectureNum}";
		
		const fn = function(data) {
			$("#answer").val("");
			$(".inquiry-list-body").empty();
			listPage(1);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

// 문의 삭제
$(function() {
	$("body").on("click", ".deleteInquiry", function() {
		if(! confirm("문의를 삭제하시겠습니까?")) {
			return false;
		}
		
		let inquiryNum = $(this).attr("data-inquiryNum");
		let url = "${pageContext.request.contextPath}/lectureInquiry/deleteInquiry";
		let query = "inquiryNum=" + inquiryNum + "&lectureNum=${lectureNum}";
		const fn = function(data) {
			$(".inquiry-list-body").empty();
			listPage(1);
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});

$(function() {
	$(".more-box .more").click(function() {
		let pageNo = $(".inquiry-count").attr("data-pageNo");
		let total_page = $(".inquiry-count").attr("data-totalPage");
		
		if(pageNo < total_page) {
			pageNo++;
			listPage(pageNo);
		}
	});
});

</script>

<div class="banner">
	<div class="container px-4">
		<div class="title row align-items-center">
			<div class="title_left mx-4">
				<img alt="thumbnail" src="https://images.velog.io/images/neity16/post/5d2d346f-4545-4118-b574-6498f5d38169/spring.png">
			</div>
			<div class="title_right">
				<p class="mb-2">개발 · 프로그래밍 > 백엔드</p>
				<p class="title_right_2 mb-4">${dto.lectureSubject}</p>
				<p class="mb-2">
					<c:forEach var="s" begin="1" end="5">
						<i class="fas fa-star" style="color: #FDCC11; font-size:13px;"></i>
					</c:forEach>
					 (5.0) &nbsp;&nbsp;&nbsp; 50개의 수강평 · 999명의 수강생
				</p>
				<p class="mb-0"><i class="fa-regular fa-user" style="color: white; font-size:16px;"></i>${dto.memberNickname}</p>
			</div>
		</div>
	</div>
</div>


<div class="container">

	<nav id="navbar-example2" class="navbar navbar-light px-3">
		<ul class="nav">
			<li class="nav-item">
				<a class="nav-link" onclick="location.href='/dev/lectures/detail?lectureNum=${lectureNum}#scrollspyHeading1';">강의소개</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" onclick="location.href='/dev/lectures/detail?lectureNum=${lectureNum}#scrollspyHeading2';">커리큘럼</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" onclick="location.href='/dev/lectures/detail?lectureNum=${lectureNum}#scrollspyHeading3';">수강평</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">수강 전 문의</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">커뮤니티</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" onclick="location.href='${pageContext.request.contextPath}/lecturenews/news?lectureNum=${lectureNum}';">새 소식</a>
			</li>
		</ul>
	</nav>
	<hr>
	<div>
		<h3><i class="bi bi-clipboard"></i> 수강 전 문의 </h3>
		<br>
		<span> 강의를 수강하기 전에 궁금한 사항을 질문해보세요. 강사가 직접 친절하게 답변해 드립니다! </span>
	</div>
	<br>
	 
	<!-- 일단 답변형 게시판 같은건데 한 줄로 주루룩 나오는건 방명록처럼 나오게 만들면 된다는 것 -->
	<div class="contentBody">
		<div class="bodyMain col-8 px-5 py-3">
			<div id="listLecInq">
				<div class="mt-1 mb-1">
					<span class="inquiry-count fw-bold text-primary" data-pageNo="1" data-totalPage="1"></span>
				</div>
				
				<table class="inquiry-list table table-borderless">
					<tbody class="inquiry-list-body">
						
					</tbody>
				</table>
				
				<div class="more-box mt-2 text-end">
					<span class="more btn btn-light">&nbsp;더보기&nbsp;<i class="bi bi-chevron-down"></i>&nbsp;</span>
				</div>
			</div>
			<br>
			
			<form name="inquiryForm" method="post">
				<div class="inquiry-form border border-secondary mt-3 p-3">
					<div class="p-1">
						<span class="fw-bold">문의 작성</span>
						<br>
						<span> - 공개된 게시판이므로 전화번호 등의 개인정보는 남기지 말아주세요. </span>
						<br>
						<span> - 광고, 욕설, 비방, 도배 등 강의와 무관한 글은 예고 없이 삭제될 수 있습니다. </span>
					</div>
					<div class="p-1">
						<textarea name="question" id="question" class="form-control" placeholder="${empty sessionScope.member ? '로그인 후 등록 가능합니다.':''}"></textarea>
					</div>
					<div class="p-1 text-end">
						<input type="hidden" name="lectureNum" value="${lectureNum}">
						<button type="button" class="btnSend btn" style="background: #0D6EFD; color: white;" ${empty sessionScope.member ? "disabled='disabled'":""}>등록 <i class="bi bi-check2"></i></button>
					</div>
				</div>
			</form>
		</div>
		
		<!-- 사이드메뉴 -->
		<div class="sideBar col-4 py-4">
			
				<div class="card col-9" style="float: none; margin:0 auto;">
					<div class="card-header">
						${dto.dcPercent}% 할인 중인 강의
					</div>
					
					<div class="card-body mx-2 my-3">
						<div class="price mb-3">
							<p>${dto.dcPercent}%</p>
							<p><fmt:formatNumber value="${dto.finalPrice}" type="number"/>원&nbsp;</p>
							<p class="mb-1"><del><fmt:formatNumber value="${dto.lecturePrice}" type="number"/>원</del></p>
						</div>
						<a href="#" class="btn btn-primary col-12 mb-2">수강신청 하기</a>
						<a href="#" class="btn btn-outline-primary col-12 mb-2">장바구니 담기</a>
					</div>
					
					<div class="card-footer">
						<ul class="mb-0">
							<li>지식공유자: ${dto.memberNickname}</li>
							<li>총 30개 수업(5시간)</li>
							<li>수강기한: 무제한</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>