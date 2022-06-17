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

.article .article_title {
	width: 100%;	
	font-size: 33px;
	font-weight: bold;
}

.article .article_body {
	display : flex;
}

.article .article_content {
	flex: none;
	width: 75%;
    font-size: 16px;
}

.article .article_post {
	flex: none;
	width: 25%;
	border: 1px solid #cfcfcf;
    border-radius: 3px;
    padding: 1rem;
    height: 400px;
}

.article .article_body .article_post .article_label {
	font-size: .85rem;
    font-weight: 400;
    color: #929292;
}

.reply-form textarea { 
	width: 100%; 
	height: 75px;
	height: 120px;
}


.mr {
	flex: none;
	margin-right: 8px;
}

.writer {
	flex: none;
	font-size : 18px;
}

ul {
	font-size: 14px;
    list-style: none;
}

li {
	margin-bottom: 3px;	
}

.button {
	background-color: #fff;
    border-width: 1px;
    color: #363636;
    justify-content: center;
    padding: calc(0.375em - 1px) 0.75em;
    text-align: center;
    white-space: nowrap;
    box-shadow: none;
    border-radius: 4px;
    border: 1px solid #dbdbdb;
}

img {
	width: 100%;
}
</style>

<script type="text/javascript" >
	

</script>

</head>
<body>

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>새소식</span></p>
			</div>
		</div>
	</div>
	
	<div class="contentBody container my-5">
		
		<div class="article" style="margin: 0 auto;">
			<div class="article_title d-flex">
				<p>${dto.subject}</p>
				<p class="ms-auto"><button type="button" class="btn btn-primary" onclick="">글 수정</button></p>
			</div>
			<hr>
			<div class="article_body">
				<div class="article_content pt-3 pe-5">
					<p class="pb-3">
					<span class="writer mr"><b>작성자: ${dto.nickName}</b> <i class="fas fa-check-circle"></i></span> <span>${dto.regDate}</span>
					</p>
					${dto.content }
				<hr class="mt-5">
				</div>
				<div class="article_post col-3">
					<p class="article_label">최근 작성된 공지글</p>
					<ul style="padding-left: 0px;"> 
						<c:forEach var="subject" items="${subjectList}">
							<li><a href="${pageContext.request.contextPath}/admin/noticeManage/article?noticeNum=${subject.noticeNum}">✓${subject.subject}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>	
	</div>
	
<form name="noticeWriteForm" method="post">
	<div class="modal fade" id="noticeUpdateModal" tabindex="-1" aria-labelledby="noticeUpdateModal" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="noticeUpdateModalLabel">공지 작성하기</h5>
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
			  		<div class="editor">${dto.content}</div>
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