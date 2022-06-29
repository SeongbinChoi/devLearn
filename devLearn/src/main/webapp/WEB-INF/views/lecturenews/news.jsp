<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lectureDetail.css" type="text/css">	

<style type="text/css">
.body-container {
	max-width: 800px;
}

.news-list tr:nth-child(3n+1) { border: 1px solid #ccc; background: #f8f9fa; }
.news-list .deletenews, .news-list {cursor: pointer;}
.news-list {color: #000000; font-family: sans-serif;}
</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.memberRole == 99}">
	function deleteOk() {
		if(confirm("소식을 삭제하시겠습니까?")) {
			let query = "newsNum=${dto.newsNum}&${query}";
			let url = "${pageContext.request.contextPath}/lecturenews/delete?" + query;
			location.href = url;
		}
	}
</c:if>

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

// 소식 리스트
function listPage(page) {
	let url = "${pageContext.request.contextPath}/lecturenews/article";
	let query = "pageNo=" + page + "&lectureNum=${lectureNum}";
	
	const fn = function(data) {
		printNews(data);
	};
	ajaxFun(url, "get", query, "json", fn);
}

function printNews(data) {
	const nickName = "${sessionScope.lecture.memberNickname}";
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	$(".news-count").attr("data-pageNo", pageNo);
	$(".news-count").attr("data-totalPage", total_page);
	
	$("#listLecNews").show();
	$(".news-count").html("소식 " + dataCount + "개");
	
	$(".more-box").hide();
	if(parseInt(dataCount) === 0) {
		$(".news-list-body").empty();
		return;
	}
	
	if(pageNo < total_page) {
		$(".more-box").show();
	}
	
	let out = "";
	for(let idx=0; idx < data.list.length; idx++) {
		let newsNum = data.list[idx].newsNum;
		let subject = data.list[idx].subject;
		let regDate = data.list[idx].regDate;
		let content = data.list[idx].content;
		
		// 제목
		out += "<tr>";
		out += "	<td colspan='2' align='center'><span style='font-size: 15px;'>" + subject + "</span></td>";
		out += "</tr>";
		
		// 문의 내용
		out += "<tr>";
		out += "    <td align='right'><span> 작성일자 : " + regDate + "</span></td>";
		out += "</tr>";
		out += "<tr style='padding-bottom: 20px;'>";
		out += "	<td colspan='2' valign='top' height='200'><span>" + content + "</span></td>";
		out += "</tr>";
		
		// 파일
		out += "<c:forEach var='vo' items='${listFile}'>";
		out += "	<tr>";
		out += "		<td colspan='2'>";
		out += "		파&nbsp;&nbsp;일 : ";
		out += "		<a href='${pageContext.request.contextPath}/lecturenews/download?newsFileNum=" + newsFileNum + "'>"+ originalFilename + "</a>";
		out += "		</td>";
		out += "	</tr>";
		out += "</c:forEach>";
		
		out += "</br>";
		
		
	}
	
	$(".news-list-body").append(out);
}

$(function() {
	$(".more-box .more").click(function() {
		let pageNo = $(".news-count").attr("data-pageNo");
		let total_page = $(".news-count").attr("data-totalPage");
		
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
				<a class="nav-link" onclick="location.href='${pageContext.request.contextPath}/lectureInquiry/inquiry?lectureNum=${lectureNum}';">수강 전 문의</a>	
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">커뮤니티</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">새소식</a>
			</li>
		</ul>
	</nav>
	<hr>
	<div class="px-5">
		<h3><i class="bi bi-clipboard"></i> 새 소식 </h3>
		<br>
		<span> 강사가 전하는 강의에 대한 최신 소식입니다. </span>
	</div>
	<br>
	 
	<!-- 본문 -->
	<div class="contentBody">
		<div class="bodyMain col-8 px-5 py-2">
			<div id="listLecNews">
				<div class="mt-1 mb-1">
					<span class="news-count fw-bold text-primary" data-pageNo="1" data-totalPage="1"></span>
				</div>
				
				<table class="news-list table" style="border: thin;">
					<tbody class="news-list-body">
					
					</tbody>
				</table>
			</div>
			<div class="p-1 text-end">
				<c:if test="${sessionScope.member.memberEmail == memberEmail}">
					<input type="hidden" name="lectureNum" value="${lectureNum}">
					<button type="button" class="btnSend btn" style="background: #0D6EFD; color: white;" onclick="location.href='${pageContext.request.contextPath}/lecturenews/write';">글쓰기</button>
				</c:if>
			</div>
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