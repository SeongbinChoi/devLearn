<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/studyList.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_boot_board.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<!-- css 및 js -->			
<style>
a#top_btn {
	position: fixed;
	left: 3%;
	bottom: 15%;
	display: none;
	z-index: 99;
}

.ck.ck-editor {
	max-width: 97%;
}

.ck-editor__editable {
    min-height: 250px;
    max-height: 250px;
}

.mark_ing {
	width: 80px;
}

.mark_finish {
	width: 57px;
	height: 25px;
	background: lightgray;
	color: white;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	margin-right: 5px;
	line-height: 25px;
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
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

function list_category() {
	const $tab = $("button[role='tab'].active");
	let categoryNum = $tab.attr("data-categoryNum"); 

	let url = "${pageContext.request.contextPath}/community/studyList";
	let query = "categoryNum="+categoryNum;
	let search = $("form[name=searchForm]").serialize();
	query = query + "&" + search;
	
	let selector = "#nav-all";
	
	const fn = function(data) {
		
		$(selector).html( ($(data).find("#nav-all")) );
	};
	
	ajaxFun(url, "get", query, "html", fn);
}

function list_detail() {
	const $tab = $("button[role='tab1'].active");
	let detailNum = $tab.attr("data-detailNum");
	
	let url = "${pageContext.request.contextPath}/community/studyList";
	let query = "detailNum="+detailNum;
	let search = $("form[name=searchForm]").serialize();
	query = query + "&" + search;
	
	let selector = "#nav-all";
	
	const fn = function(data) {
		
		$(selector).html( ($(data).find("#nav-all")) );
	};
	
	ajaxFun(url, "get", query, "html", fn);
}


function sendOk() {
	var f = document.boardForm;
	var str;
	
	str = f.subject.value.trim();
	if(! str) {
		alert("제목을 입력하세요.");
		f.subject.focus();
		return false;
	}

	str = f.limit.value;
    if(str == "select") {
        alert("모집인원을 선택하세요.");
       	f.limit.focus();
        return;
    }
    
    str = f.regionNum.value;
    if(str == "select") {
        alert("스터디 지역을 선택하세요.");
       	f.regionNum.focus();
        return;
    }

    str = window.editor.getData().trim();
    if(! str) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
    f.content.value = str;

	f.action = "${pageContext.request.contextPath}/community/study_write";
	f.submit();
}

function searchList() {
	const f = document.searchForm;
	f.submit();
}

</script>


<!-- 메인코드 -->
<!-- banner -->
<div class="banner mb-5">
	<div class="container px-4">
		<div class="title row align-items-center" style="height: 200px;">
			<p><span>스터디</span><br>함께 성장할 스터디를 모집해보세요!</p>
		</div>
	</div>
</div>

<!-- 메인 컨텐츠 -->
<div class="contentBody container col-11 my-5">
	<!-- sidebar -->
	<div class="sideMenu col-2">
		<div class="cmmu-menu list-group px-1">
			<a class="list-group-item list-group-item-action disabled list-group-item-secondary">커뮤니티</a>
			<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/community/qnaList">· 질문과 답변</a>
			<a class="list-group-item list-group-item-action active" aria-current="true" href="${pageContext.request.contextPath}/community/studyList">· 스터디</a>
		</div>
	</div>
		
	<!-- 네비게이션 바(탭) 및  -->
	<div class="mainContent col-9" style="float: none; margin:0 auto;">
		<!-- TOP버튼 -->
		<a id="top_btn" href="#"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></a>
			
		<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="all" aria-selected=${categoryNum == 2 ? "true" : "false"} data-categoryNum="2" onclick="list_category();">전체</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="find-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="find" aria-selected=${categoryNum == 0 ? "true" : "false"} data-categoryNum="0" onclick="list_category();">모집중</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="finish-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="finish" aria-selected=${categoryNum == 1 ? "true" : "false"} data-categoryNum="1" onclick="list_category();">모집완료</button>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">지역별</a>
				<ul class="dropdown-menu">
					<li><button class="dropdown-item" id="find-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="find" aria-selected=${categoryNum == 0 ? "true" : "false"} data-categoryNum="0" onclick="list_category();">서울</button></li>
					<li><button class="dropdown-item" id="find-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="find" aria-selected=${categoryNum == 0 ? "true" : "false"} data-categoryNum="0" onclick="list_category();">경기</button></li>
					<li><button class="dropdown-item" id="find-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="find" aria-selected=${categoryNum == 0 ? "true" : "false"} data-categoryNum="0" onclick="list_category();">인천</button></li>
				</ul>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">스터디 가능 위치</a>
				<ul class="dropdown-menu">
					<li><button class="dropdown-item" id="find-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="find" aria-selected=${categoryNum == 0 ? "true" : "false"} data-categoryNum="0" onclick="list_category();">서울</button></li>
					<li><button class="dropdown-item" id="find-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="find" aria-selected=${categoryNum == 0 ? "true" : "false"} data-categoryNum="0" onclick="list_category();">경기</button></li>
					<li><button class="dropdown-item" id="find-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="find" aria-selected=${categoryNum == 0 ? "true" : "false"} data-categoryNum="0" onclick="list_category();">인천</button></li>
				</ul>
			</li>
		</ul>
		
		
		<!-- 검색란 -->
		<div class="input-group mb-3 input-group-lg mb-5">
			<form name="searchForm" action="${pageContext.request.contextPath}/community/studyList" method="post" class="input-group">
				<span class="input-group-text" id="basic-addon1 inputGroup-sizing-lg" style="background: white;"><i class="fas fa-search"></i></span>
				<input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="관심 스터디를 검색해보세요!" aria-label="Username" aria-describedby="basic-addon1">
				<input type="hidden" name="rows" value="${rows}">
				<button class="btn btn-outline-secondary px-5" type="button" id="button-addon2" onclick="searchList()">검색</button>
			</form>
		</div>
		
		
		<!-- 중간 탭(최신순|답변많은순 ...) -->
		<div class="contentHeader">
			<ul class="nav nav-pills" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab1" aria-controls="0" aria-selected=${detailNum == 0 ? "true" : "false"} data-detailNum="0" onclick="list_detail();">최신순</button>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab1" aria-controls="1" aria-selected=${detailNum == 1 ? "true" : "false"} data-detailNum="1" onclick="list_detail();">답변많은순</button>
				</li>
			</ul>
			
			<div class="btnGroup">
				<button type="button" class="btn btn-outline-primary" onclick='location.href="${pageContext.request.contextPath}/community/studyList";'><i class="fas fa-redo-alt"></i>새로고침</button>
				<c:choose>
					<c:when test="${sessionScope.member.memberEmail == null}">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">글쓰기</button>
					</c:when>
					
					<c:otherwise>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#studyModal">글쓰기</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr>
		
		
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="all-tab">
				<!-- 스터디 - 전체 -->
				<c:forEach var="dto" items="${list}">
					<c:choose>
						<c:when test="${sessionScope.member.memberEmail == null}">
							<a href="${articleUrl}&studyNum=${dto.studyNum}" data-bs-toggle="modal" data-bs-target="#loginModal">
						</c:when>
							
						<c:otherwise>
							<a href="${articleUrl}&studyNum=${dto.studyNum}">
						</c:otherwise>
					</c:choose>
						
						<div class="study px-3 py-1">
							<div class="study_info">
								<div class="study_title col-12">
										<c:choose>
											<c:when test="${dto.status == 0}">
												<div class="mark_ing col-2">모집중(${dto.applied}/${dto.limit})</div>
											</c:when>
											
											<c:otherwise>
												<div class="mark_finish col-2">모집완료(${dto.applied}/${dto.limit})</div>
											</c:otherwise>
										</c:choose>
									
										<div class="subject col-8">
											<p>
												[${dto.region}]${dto.subject}
											</p>
										</div>
									</div>
								
								<div class="study_body col-12"> 
									<div class="body_content col-10">
										${dto.content}
									</div>
									<div class="answerNum mx-4">
										<div class="num_center">
											<span>0<br>댓글</span>
										</div>
									</div>
								</div>
								
								<div class="study_footer">
									<p></p>
									<p>${dto.memberNickName} | ${dto.regDate} | 조회수 : ${dto.hitCount}</p>
								</div>
							</div>
						</div>
					</a>
					<hr>
				</c:forEach>
				
				<div class="study px-3 py-1">
					${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }			
				</div>
			</div>

		</div>
	</div>
</div>


<!-- Modal -->
<form name="boardForm" method="post">	
	<div class="modal fade" id="studyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">커뮤니티</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="mb-3">
				<ul class="nav nav-pills mb-3" id="pills_button" role="tablist">
					<li class="nav-item" role="presentation">
				    	<button class="nav-link active" id="pills-study-tab" data-bs-toggle="pill" data-bs-target="#study_content" type="button" role="tab" aria-controls="pills-study" aria-selected="true">스터디</button>
				  	</li>
				</ul>
			</div>
	      	<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input type="text" class="form-control" id="community_subject" placeholder="제목을 입력해주세요." name="subject">
			</div>
			<div class="mb-3">
			<p>
			  <label for="exampleFormControlInput1" class="form-label" style="padding-right: 20px;">모집인원</label>
			  <select name="limit" style="margin-right: 150px;">
			  	<option value="select">--선택--</option>
			  	<option value="1">1명</option>
			  	<option value="2">2명</option>
			  	<option value="3">3명</option>
			  	<option value="4">4명</option>
			  </select>
			</p>
			
			<p>
			  <label for="exampleFormControlInput1" class="form-label">스터디 지역</label>
			  <select name="regionNum">
			  	<option value="select">--선택--</option>
			  	<option value="1">서울</option>
			  	<option value="2">경기</option>
			  	<option value="3">인천</option>
			  </select>
			</p>
			</div>
			<div class="mb-3 tab-content" id="community_tabContent">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  	<div class="tab-pane fade show active" id="study_content" role="tabpanel">
			  		<div class="editor"></div>
			  		<input type="hidden" name="content">
				</div>
			</div>
			<div class="mb-3">
				<button class="btn btn-primary" type="button" data-bs-dismiss="modal">취소</button>
				<button class="btn btn-primary" type="button" onclick="sendOk();">저장</button>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
</form>



<!-- 맨위로 올리기 -->
<script>
	$(function() {
		$(window).scroll(function(){
		    
		    if ($(this).scrollTop() > 200) {
				$('#top_btn').fadeIn();
	           } else {
	               $('#top_btn').fadeOut();
	           }
		    
		  });
		    
		$("#top_btn").click(function(){
		  window.scrollTo({top : 0, behavior: 'smooth'}); 
		});
	});
</script>


<!-- ck에디터 -->
<script type="text/javascript">
ClassicEditor
	.create( document.querySelector( '.editor' ), {
		fontFamily: {
            options: [
                'default',
                '맑은 고딕, Malgun Gothic, 돋움, sans-serif',
                '나눔고딕, NanumGothic, Arial'
            ]
        },
        fontSize: {
            options: [
                9, 11, 13, 'default', 17, 19, 21
            ]
        },
		toolbar: {
			items: [
				'heading','|',
				'fontFamily','fontSize','bold','italic','fontColor','|',
				'alignment','bulletedList','numberedList','|',
				'imageUpload','insertTable','sourceEditing','blockQuote','mediaEmbed','|',
				'undo','redo','|',
				'link','outdent','indent','|',
			]
		},
		image: {
            toolbar: [
                'imageStyle:full',
                'imageStyle:side',
                '|',
                'imageTextAlternative'
            ],

            // The default value.
            styles: [
                'full',
                'side'
            ]
        },
		language: 'ko',
		ckfinder: {
	        uploadUrl: '${pageContext.request.contextPath}/image/upload' // 업로드 url (post로 요청 감)
	    }
	})
	.then( editor => {
		window.editor = editor;
	})
	.catch( err => {
		console.error( err.stack );
	});
</script>