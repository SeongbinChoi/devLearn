<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
*{
	margin: 0;  padding: 0; box-sizing: border-box;
}


.banner {
	height: 200px;
	background: #333B3D;
	color: white;
}

.banner .title span {
	font-size: 25px;
	font-weight: bold;
}


.contentBody {
	display: flex;
}

.contentBody a {
	color: black; text-decoration: none; outline: none;
}

.contentBody a:hover {
	text-decoration: none;
}

.contentBody .picked {
	color: #0d6efd;
}

.sideMenu {
	font-weight: bold;
	color: gray;
}

.sideMenu a {
	color: gray;
}

.contentHeader {
	display: flex;
	justify-content: space-between;
}

.contentHeader .nav a {
	font-weight: bold;
	color: gray;
}

.contentHeader .nav a:active {
	color: #0d6efd;
}

.contentHeader .nav a:hover {
	color: #0d6efd;
}

.contentHeader {
	display: flex;
	justify-content: space-between;
}

.contentHeader .nav a {
	font-weight: bold;
	color: gray;
}

.contentHeader .nav a:active {
	color: #0d6efd;
}

.contentHeader .nav a:hover {
	color: #0d6efd;
}

.notice .notice_title {
	font-size: 26px;
	font-weight: bold;
}

.notice .notice_body {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.notice .body_content {
	font-size: .75rem;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 원하는 줄 수 표시 */
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.notice .notice_footer {
	font-weight: bold;
	color: #BDBDBD;
}

.notice_content {
	
}

.title_start {
	color : #0d6efd;
	margin-right: 7px;
}

.answerNum {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	border: 1px solid #BDBDBD;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	color: gray;
}

.answerNum .num_center {
	text-align: center;
}

.mr {
	margin-right: 8px;
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
function sendOk() {
	const f = document.noticeWriteForm;
	
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
	
	f.action="${pageContext.request.contextPath}/admin/noticeManage/write";
	f.submit();
}
</script>


	<div class="contentBody container col-11 my-5">
		
		<div class="mainContent col-9" style="margin: 0 auto;">
		<div class="writeNotice mb-4">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#noticeWriteModal">
				공지 작성하기
			</button>
		</div>

			<!-- 질문 -->
			<c:forEach var="vo" items="${list}" varStatus="status">
				<div class="notice px-3">
					<a href="${pageContext.request.contextPath}/admin/noticeManage/article?noticeNum=${vo.noticeNum}">
						<div class="notice_info">
							<div class="notice_title">
								<p><span class="title_start">N.</span>${vo.subject}</p>
							</div>
							
							<div class="notice_body col-12"> 
								<div class="body_content col-10">
									<span class="notice_content mr">${vo.regDate}</span> <span class="notice_content mr">글쓴이: ${vo.nickName}<i class="fas fa-check-circle"></i></span> <span class="notice_content mr">대상 : 전체</span>
								</div>
							</div>
						</div>
					</a>
				</div>
			<hr>
			
			</c:forEach>
	
			<div class="page-box">
				${paging}
			</div>
		</div>
		
		
	</div>
	
	<!-- Modal -->
<form name="noticeWriteForm" method="post">
	<div class="modal fade" id="noticeWriteModal" tabindex="-1" aria-labelledby="noticeWriteModal" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="noticeWriteModalLabel">공지 작성하기</h5>
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
			  <input type="text" class="form-control" id="noticeSubject" placeholder="제목을 입력해주세요." name="subject">
			</div>
			<div class="mb-3 tab-content" id="community_tabContent">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  	<div class="tab-pane fade show active" id="noticeContent" role="tabpanel">
			  		<div class="editor"></div>
					<input type="hidden" name="content">
				</div>
			</div>
			<div class="mb-3">
				<input type="hidden" value="${sessionScope.member.memberEmail}"name="eMail">
				<input type="hidden" value="${sessionScope.member.memberNickname}"name="nickName">
				<button class="btn btn-primary" type="button" data-bs-dismiss="modal">취소</button>
				<button class="btn btn-primary" type="button" onclick="sendOk();">저장</button>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
​</form>

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