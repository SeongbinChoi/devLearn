<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qnaList_article.css" type="text/css">
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

</style>

<script type="text/javascript">
function deleteBoard() {
	<c:if test="${sessionScope.member.memberEmail == dto.memberEmail || sessionScope.member.memberRole == 99}">
	if(confirm("게시글을 삭제하시겠습니까?")) {
		let query = "qnaNum=${dto.qnaNum}&groupNum=${dto.groupNum}&${query}";
		let url = "${pageContext.request.contextPath}/community/qnaList_delete?" + query;
		location.href = url;
	}
	</c:if>
}

function chatak() {	
	<c:if test="${sessionScope.member.memberEmail == dto.memberEmail}">
	if(confirm("질문을 해결하셨습니까?")) {
		let query = "qnaNum=${dto.qnaNum}&${query}";
		let url = "${pageContext.request.contextPath}/community/qnaList_updateSelected?" + query;
		location.href = url;
	}
	</c:if>
}

function singoSubmit() {
	var f = document.singo;
	var str;
	
	str = f.notifyReason.value.trim();
	if(! str) {
        alert("신고사유을 입력하세요. ");
        f.content.focus();
        return false;
    }
	
	f.action = "${pageContext.request.contextPath}/community/qna_singo";
	f.submit();
}

function update() {
	var f = document.qnaList_update;
	var str;
	
	str = f.subject.value.trim();
	if( ! str) {
		alert("제목을 입력하세요.");
		f.subject.focus();
		return false;
	}
	alert(str);
	
	str = window.editor.getData().trim();
    if(! str) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
    f.content.value = str;
    alert(str);
    
    f.action = "${pageContext.request.contextPath}/community/qnaList_update";
	f.submit();
}
</script>


<!-- 메인코드 -->
	<div class="contentBody container col-11 my-5">
	
		<div class="sideMenu col-2">
			<div class="cmmu-menu list-group px-1">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/community/qnaList?${query}'"><i class="fa-solid fa-arrow-left-long"></i></button>
			</div>
		</div>
			
			
		<div class="mainContent col-8" style="float: none;">
			<!-- TOP버튼 -->
			<a id="top_btn" href="#"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></a>
			
			<div class="article_top" id="nav-tabContent">
				<div class="title d-flex" id="qna_artice_subject">
					<c:choose>
						<c:when test="${dto.selected == 0}">
							<div class="mark_unsolved" style="margin-top: 13px;">미해결</div> 
						</c:when>
						
						<c:otherwise>
							<div class="mark_solved" style="margin-top: 13px;">해결</div> 
						</c:otherwise>
					</c:choose>
					<div class="p-2 w-100">${dto.subject}</div>
					<c:choose>
					<c:when test="${(sessionScope.member.memberEmail != dto.memberEmail)}">
						<button type="button" class="p-2 flex-shrink-0 btn btn-danger" data-bs-toggle="modal" data-bs-target="#singoModal">신고</button>
					</c:when>
					<c:otherwise>
						<div class="p-2 flex-shrink-0"><button type="button" class="btn btn-danger" style="display : none;">신고</button></div>
					</c:otherwise>
					</c:choose>
				</div>
				
				<div class="subTitle">
					<h6 class="userName" id="userName">${dto.memberNickName}</h6>
					<span class="enrollDate">&nbsp; · ${dto.regDate} | 조회수 : ${dto.hitCount}</span>
				</div>
				<hr>
			</div>
			
			
			<div class="content">
				<div class="content_main" style="padding-bottom: 5px;">
					<p>
					${dto.content}
					</p>
					<p style="margin-bottom: 10px;">
				</div>
				
				<hr>
				<div>
					<p>이전글 :
					<c:if test="${not empty preReadQna}">
						<a href="${pageContext.request.contextPath}/community/qnaList_article?${query}&qnaNum=${preReadQna.qnaNum}">${preReadQna.subject}</a>
					</c:if>
					</p>
					
					<p>다음글 :
					<c:if test="${not empty nextReadQna}">
						<a href="${pageContext.request.contextPath}/community/qnaList_article?${query}&qnaNum=${nextReadQna.qnaNum}">${nextReadQna.subject}</a>
					</c:if>
				</div>
				<hr>
				
				<div>
					<c:choose>
						<c:when test="${sessionScope.member.memberEmail != null && dto.selected == 0}">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/community/qnaList_reply?qnaNum=${dto.qnaNum}&page=${page}&rows=${rows}'">답변</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-light" disabled="disabled">답변</button>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${(sessionScope.member.memberEmail == dto.memberEmail && dto.parent == 0) && dto.selected == 0}">
							<!-- 게시글의 경우 -> 모달로 변경 -->
							<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#qnaUpdateModal">수정</button>
						</c:when>
						<c:when test="${(sessionScope.member.memberEmail == dto.memberEmail && dto.parent != 0) && dto.selected == 0}">
							<!-- 답변의 경우 -> article로 수정 -->
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/community/qnaList_replyUpdate?qnaNum=${dto.qnaNum}&page=${page}&rows=${rows}'">수정</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-light" disabled="disabled">수정</button>
						</c:otherwise>
					</c:choose>
			    	
					<c:choose>
			    		<c:when test="${sessionScope.member.memberEmail == dto.memberEmail || sessionScope.member.memberRole > 50}">
			    			<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
			    		</c:otherwise>
			    	</c:choose>
			    	
			    	<c:choose>
			    		<c:when test="${(sessionScope.member.memberEmail == dto.memberEmail) && (dto.parent == 0 && dto.selected == 0) && dto.replyNum >= 1}">
							<button type="button" class="btn btn-light" onclick="chatak();" style="float:right;">해결</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-light" disabled="disabled" style="float:right; display: none;">해결</button>
						</c:otherwise>
			    	</c:choose>
				</div>
			</div>
		</div>
	</div>
	
<!-- Modal -->
<form name="qnaList_update" method="post">
	<div class="modal fade" id="qnaUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
			  <input type="text" class="form-control" id="community_subject" placeholder="제목을 입력해주세요." name="subject" value="${dto.subject}">
			</div>
			<div class="mb-3 tab-content" id="community_tabContent">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  	<div class="tab-pane fade show active" id="qna_content" role="tabpanel">
			  		<div class="editor">${dto.content}</div>
					<input type="hidden" name="content">
				</div>
			</div>
			<div class="mb-3">
				<input type="hidden" name="content2">
				<button class="btn btn-primary" type="button" data-bs-dismiss="modal">취소</button>
				<button class="btn btn-primary" type="button" onclick="update();">수정</button>
				<input type="hidden" name="qnaNum" value="${dto.qnaNum}">
				<input type="hidden" name="rows" value="${rows}">
				<input type="hidden" name="page" value="${page}">
			</div>
	      </div>
	    </div>
	  </div>
	</div>
​</form>


<!-- 신고 Modal -->
<form name="singo" method="post">
	<div class="modal fade" id="singoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
				    	<button class="nav-link active" id="pills-qna-tab" data-bs-toggle="pill" data-bs-target="#qna_content" type="button" role="tab" aria-controls="pills-qna" aria-selected="true" disabled="disabled">신고</button>
				  	</li>
				</ul>
			</div>
	      	<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">신고자</label>
			  <input type="text" class="form-control" id="notified_nickName" name="singoNickName" value="${sessionScope.member.memberNickname}" readonly>
			</div>
	      	<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">신고사유</label>
			  <textarea class="form-control" id="notified_subject" placeholder="신고사유를 입력해주세요." name="notifyReason" style="height: 200px; max-height: 200px;"></textarea>
			</div>
			<div class="mb-3">
				<input type="hidden" name="content2">
				<button class="btn btn-primary" type="button" data-bs-dismiss="modal">취소</button>
				<button class="btn btn-primary" type="button" onclick="singoSubmit();">신고하기</button>
				<input type="hidden" name="NqnaNum" value="${dto.qnaNum}">
				<input type="hidden" name="NmemberEmail" value="${dto.memberEmail}">
				<input type="hidden" name="rows" value="${rows}">
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="subject" value="${dto.subject}">
			</div>
	      </div>
	    </div>
	  </div>
	</div>
​</form>

	
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