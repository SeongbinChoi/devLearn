<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qnaList.css" type="text/css">
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
	overflow-y: scroll;
}

.ck-editor__editable {
    min-height: 250px;
    max-height: 250px;
}
</style>

<script type="text/javascript">
$(function(){
	$("#tab-${group}").addClass("active");
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("data-tab");
		//let url = "${pageContext.request.contextPath}/sbbs/list?group="+tab;	
		//location.href = url;
    });
});

function sendOk() {
	var f = document.boardForm;
	var str;
	
	str = f.subject.value.trim();
	if(! str) {
		alert("제목을 입력하세요.");
		f.subject.focus();
		return false;
	}
	
	str = window.editor.getData().trim();
    if(! str) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
    f.content.value = str;
    
	f.action = "${pageContext.request.contextPath}/community/qnaList_write";
	f.submit();
}

function searchList() {
	const f = document.searchForm;
	f.submit();
}

function login() {
	$("#qnaModal").modal("show");
}
</script>



<!-- 메인코드 -->
<!-- banner -->
<div class="banner mb-5">
	<div class="container px-4">
		<div class="title row align-items-center" style="height: 200px;">
			<p><span>질문과 답변</span><br>함께 토론하며 문제를 해결해나가요</p>
		</div>
	</div>
</div>
	
<!-- 메인 컨텐츠 -->
<div class="contentBody container col-11 my-5">
	<!-- sidebar -->
	<div class="sideMenu col-2">
		<div class="cmmu-menu list-group px-1">
			<a class="list-group-item list-group-item-action disabled list-group-item-secondary">커뮤니티</a>
			<a class="list-group-item list-group-item-action active" aria-current="true" href="${pageContext.request.contextPath}/community/qnaList">· 질문과 답변</a>
			<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/community/studyList">· 스터디</a>
		</div>
	</div>
	
	<!-- 네비게이션 바(탭) 및  -->
	<div class="mainContent col-9" style="float: none; margin:0 auto;">
		<!-- TOP버튼 -->
		<a id="top_btn" href="#"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></a>
		
		<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="unsolved-tab" data-bs-toggle="tab" data-bs-target="#nav-unsolved" type="button" role="tab" aria-controls="unsolved" aria-selected="false">미해결</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="solved-tab" data-bs-toggle="tab" data-bs-target="#nav-solved" type="button" role="tab" aria-controls="solved" aria-selected="false">해결</button>
			</li>
		</ul>
	
	<!-- 검색란 -->
	<div class="input-group mb-3 input-group-lg mb-5">
		<form name="searchForm" action="${pageContext.request.contextPath}/community/qnaList" method="post" class="input-group">
			<span class="input-group-text" id="basic-addon1 inputGroup-sizing-lg" style="background: white;"><i class="fas fa-search"></i></span>
			<input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="궁금한 질문을 검색해보세요!" aria-label="Username" aria-describedby="basic-addon1">
			<input type="hidden" name="rows" value="${rows}">
			<button class="btn btn-outline-secondary px-5" type="button" id="button-addon2" onclick="searchList()">검색</button>
		</form>
	</div>
			
		<!-- 중간 탭(최신순|답변많은순 ...) -->
		<div class="contentHeader">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="0" aria-selected="true" data-tab="0" style="color: blue;">최신순</button>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="1" aria-selected="true" data-tab="1" style="color: blue;">답변많은순</button>
				</li>
			</ul>

			<div class="btnGroup">
				<button type="button" class="btn btn-outline-primary" onclick='location.href="${pageContext.request.contextPath}/community/qnaList";'><i class="fas fa-redo-alt"></i>새로고침</button>
				<c:choose>
					<c:when test="${sessionScope.member.memberEmail == null}">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">글쓰기</button>
					</c:when>
					
					<c:otherwise>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#qnaModal">글쓰기</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr>
			
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="all-tab">
					<!-- 질문 - 전체 -->
					<c:forEach var="dto" items="${list}">
						<c:choose>
							<c:when test="${sessionScope.member.memberEmail == null}">
								<a href="${articleUrl}&qnaNum=${dto.qnaNum}" data-bs-toggle="modal" data-bs-target="#loginModal">
							</c:when>
							
							<c:otherwise>
								<a href="${articleUrl}&qnaNum=${dto.qnaNum}">
							</c:otherwise>
						</c:choose>
							
							<c:choose>
								<c:when test="${dto.parent == 0}">
									<div class="question px-3 py-1">
										<div class="question_info">
											<div class="question_title col-12">
												<c:choose>
													<c:when test="${dto.selected == 0}">
														<div class="mark_unsolved st">미해결</div>
													</c:when>
													<c:otherwise>
														<div class="mark_solved st">해결</div>
													</c:otherwise>	
												</c:choose>
												
											<div class="subject col-9">
												<p>
													${dto.subject}
												</p>
											</div>
										</div>
											
										<div class="question_body col-12"> 
											<div class="body_content col-10">
												${dto.content}
											</div>
											<div class="answerNum mx-4">
												<div class="num_center">
													<span>${dto.replyNum}<br>답변</span>
												</div>
											</div>
										</div>
										
										<div class="question_footer">
											<p>${dto.memberNickName} | ${dto.regDate} | 조회수 : ${dto.hitCount}</p>
										</div>
									</div>
								</div>
							</c:when>
							
							<c:otherwise>
								<div class="question px-3 py-1">
									<c:forEach var="n" begin="1" end="${dto.depth}">&nbsp;&nbsp;&nbsp;</c:forEach>
										<c:if test="${dto.depth != 0}">└&nbsp;</c:if>
											<span style="font-size: 18px; font-weight: bold;">${dto.subject}</span>
												<div class="question_footer" style="font-size: 18px; margin-top: 5px;">
													<c:forEach var="n" begin="0" end="${dto.depth}">&nbsp;&nbsp;</c:forEach>
														${dto.memberNickName} | ${dto.regDate} | 조회수 : ${dto.hitCount}
												</div>
								</div>
							</c:otherwise>
						</c:choose>
					</a>
				<hr>
			</c:forEach>
				
				<div class="question px-3 py-1">
					${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }			
				</div>
			</div>
			
			
				<div class="tab-pane fade" id="nav-unsolved" role="tabpanel" aria-labelledby="unsolved-tab">
					<!-- 질문 - 미해결 -->
					<c:forEach var="dto" items="${list}">
						<c:if test="${dto.selected == 0}">
							<c:choose>
								<c:when test="${sessionScope.member.memberEmail == null}">
									<a href="${articleUrl}&qnaNum=${dto.qnaNum}" data-bs-toggle="modal" data-bs-target="#loginModal">
								</c:when>
								
								<c:otherwise>
									<a href="${articleUrl}&qnaNum=${dto.qnaNum}">
								</c:otherwise>
							</c:choose>
							
								<c:choose>
									<c:when test="${dto.parent == 0}">
										<div class="question px-3 py-1">
											<div class="question_info">
												<div class="question_title col-12">
													<c:choose>
														<c:when test="${dto.selected == 0}">
															<div class="mark_unsolved st">미해결</div>
														</c:when>
														<c:otherwise>
															<div class="mark_solved st">해결</div>
														</c:otherwise>	
													</c:choose>
													
												<div class="subject col-9">
													<p>
														${dto.subject}
													</p>
												</div>
											</div>
												
											<div class="question_body col-12"> 
												<div class="body_content col-10">
													${dto.content}
												</div>
												<div class="answerNum mx-4">
													<div class="num_center">
														<span>${dto.depth}<br>답변</span>
													</div>
												</div>
											</div>
											
											<div class="question_footer">
												<p>${dto.memberNickName} | ${dto.regDate} | 조회수 : ${dto.hitCount}</p>
											</div>
										</div>
									</div>
								</c:when>
								
								<c:otherwise>
									<div class="question px-3 py-1">
										<c:forEach var="n" begin="1" end="${dto.depth}">&nbsp;&nbsp;&nbsp;</c:forEach>
											<c:if test="${dto.depth != 0}">└&nbsp;</c:if>
												<span style="font-size: 18px; font-weight: bold;">${dto.subject}</span>
													<div class="question_footer" style="font-size: 18px; margin-top: 5px;">
														<c:forEach var="n" begin="0" end="${dto.depth}">&nbsp;&nbsp;</c:forEach>
															${dto.memberNickName} | ${dto.regDate} | 조회수 : ${dto.hitCount}
													</div>
									</div>
								</c:otherwise>
							</c:choose>
						</a>
					<hr>
					</c:if>
					<c:if test="${dto.selected == 1}">
					</c:if>
			</c:forEach>
				
				<div class="question px-3 py-1">
					${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }			
				</div>
			</div>
			
		
			
				<div class="tab-pane fade" id="nav-solved" role="tabpanel" aria-labelledby="solved-tab">
					<!-- 질문 - 해결 -->
					<c:forEach var="dto" items="${list}">
						<c:if test="${dto.selected == 1}">
							<c:choose>
								<c:when test="${sessionScope.member.memberEmail == null}">
									<a href="${articleUrl}&qnaNum=${dto.qnaNum}" data-bs-toggle="modal" data-bs-target="#loginModal">
								</c:when>
								
								<c:otherwise>
									<a href="${articleUrl}&qnaNum=${dto.qnaNum}">
								</c:otherwise>
							</c:choose>
							
								<c:choose>
									<c:when test="${dto.parent == 0}">
										<div class="question px-3 py-1">
											<div class="question_info">
												<div class="question_title col-12">
													<c:choose>
														<c:when test="${dto.selected == 0}">
															<div class="mark_unsolved st">미해결</div>
														</c:when>
														<c:otherwise>
															<div class="mark_solved st">해결</div>
														</c:otherwise>	
													</c:choose>
													
												<div class="subject col-9">
													<p>
														${dto.subject}
													</p>
												</div>
											</div>
												
											<div class="question_body col-12"> 
												<div class="body_content col-10">
													${dto.content}
												</div>
												<div class="answerNum mx-4">
													<div class="num_center">
														<span>${dto.depth}<br>답변</span>
													</div>
												</div>
											</div>
											
											<div class="question_footer">
												<p>${dto.memberNickName} | ${dto.regDate} | 조회수 : ${dto.hitCount}</p>
											</div>
										</div>
									</div>
								</c:when>
								
								<c:otherwise>
									<div class="question px-3 py-1">
										<c:forEach var="n" begin="1" end="${dto.depth}">&nbsp;&nbsp;&nbsp;</c:forEach>
											<c:if test="${dto.depth != 0}">└&nbsp;</c:if>
												<span style="font-size: 18px; font-weight: bold;">${dto.subject}</span>
													<div class="question_footer" style="font-size: 18px; margin-top: 5px;">
														<c:forEach var="n" begin="0" end="${dto.depth}">&nbsp;&nbsp;</c:forEach>
															${dto.memberNickName} | ${dto.regDate} | 조회수 : ${dto.hitCount}
													</div>
									</div>
								</c:otherwise>
							</c:choose>
						</a>
					<hr>
					</c:if>
					<c:if test="${dto.selected == 0}">
					</c:if>
			</c:forEach>
				
				<div class="question px-3 py-1">
					${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }			
				</div>
			</div>
			
		</div>
	</div>
</div>


<!-- Modal -->
<form name="boardForm" method="post">
	<div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
				    	<button class="nav-link active" id="pills-qna-tab" data-bs-toggle="pill" data-bs-target="#qna_content" type="button" role="tab" aria-controls="pills-qna" aria-selected="true">질문과 답변</button>
				  	</li>
				</ul>
			</div>
	      	<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input type="text" class="form-control" id="community_subject" placeholder="제목을 입력해주세요." name="subject">
			</div>
			<div class="mb-3 tab-content" id="community_tabContent">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  	<div class="tab-pane fade show active" id="qna_content" role="tabpanel">
			  		<div class="editor"></div>
					<input type="hidden" name="content">
				</div>
			</div>
			<div class="mb-3">
				<input type="hidden" name="content2">
				<button class="btn btn-primary" type="button" data-bs-dismiss="modal">취소</button>
				<button class="btn btn-primary" type="button" onclick="sendOk();">저장</button>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
​</form>



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
