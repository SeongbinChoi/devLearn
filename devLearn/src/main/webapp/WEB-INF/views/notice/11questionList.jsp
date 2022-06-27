<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/11questionList.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<style type="text/css">
.ck.ck-editor {
	max-width: 97%;
	overflow-y: scroll;
}

.ck-editor__editable {
    min-height: 250px;
    max-height: 250px;
}


</style>

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>자주 묻는 질문</span><br>문의유형을 선택하면 문의유형에 따라 [자주 묻는 질문]을 확인할 수 있습니다.<br>찾는 질문과 답변이 보이지 않으면 [질문 검색]을 이용해 원하는 질문과 답변을 찾아 주세요</p>
			</div>
		</div>
	</div>
	
	<div class="content container col-11 my-5 ">
		<div class="sideMenu col-2">
			<div class="card">
				<div class="card-header">
				  공지사항
				</div>
				<a class="list-group-item list-group-item-action " aria-current="true" href="${pageContext.request.contextPath}/notice/notice">· 공지사항</a>
				<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/eventList">· 이벤트</a>
				<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/faq">· FAQ </a>
				<c:if test="${sessionScope.member.memberEmail != null}">
					<a class="list-group-item list-group-item-action active"  aria-current="true"  href="${pageContext.request.contextPath}/notice/mTomInquiry">· 1:1문의 </a>
				</c:if>
			</div>
		</div>
		<div class="right-side col-9 " style="float:none; margin:0 auto;">
			<div class="titleSection d-flex justify-content-between">
				<div class="titleSection-title-txt" >
					<p class="titleSection-title">내 문의내역</p>
					<p class="">최근 6개월 동안 접수하신 1:1문의내역 및 답변 내용을 확인하실 수 있습니다.	</p>
					<small>※ 문의 내용 중 개인정보가 포함되었거나 중복된 문의인 경우 삭제될 수 있습니다.</small>
				</div>
				<div class="titleSection-title-btn">
					<div class="title-btn-bottom">		
						<button type="button"  class="writeButton btn btn-primary" data-bs-toggle="modal" data-bs-target="#noticeQnaModal">문의 작성</button>
					</div>
				</div>	
			</div>
			<table class="listTable table table-hover">
			<thead>
				<tr>
					<th >번호</th>
					<th >카테고리</th>
					<th>제목</th>
					<th >처리상태</th>
				</tr>
			</thead>				
			<tbody>
				<c:choose>
					<c:when test="">
						<tr>
							<td colspan="4">최근 문의하신 내용이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="1" end="10" step="1"> 
							<tr onclick="href.location='#'">
								<td>${11-i}</td>
								<td>카테고리</td>
								<td>${i}번째 제목</td>
								<td>처리중</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			</table>
			<nav aria-label="paing" >
				<ul class="pagination justify-content-center mt-5">
					<li class="page-item disabled">
			    		<span class="page-link">Previous</span>
			  		</li>
			  		<li class="page-item"><a class="page-link" href="#">1</a></li>
			    	<li class="page-item active" aria-current="page">
			      		<span class="page-link">2</span>
		    		</li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				    	<a class="page-link" href="#">Next</a>
			    	</li>
				</ul>
			</nav>
		</div>
			
	</div>

	<!-- Modal -->
<form name="noticeQnaWriteForm" method="post">
	<div class="modal fade" id="noticeQnaModal" tabindex="-1" aria-labelledby="noticeQnaModal" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="noticeQnaModalLabel">1:1 문의 작성하기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="mb-3">
				<ul class="nav nav-pills mb-3" id="pills_button" role="tablist">
					<li class="nav-item" role="presentation">
				    	<button class="nav-link active" id="mtmquiry" type="button">1:1 문의</button>
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
			<div class="mb-3" style="margin: 0 auto;">
				<input type="hidden" value="${sessionScope.member.memberEmail}"name="eMail">
				<input type="hidden" value="${sessionScope.member.memberNickname}"name="nickName">
				<button class="btn btn-primary" type="button" data-bs-dismiss="modal">취소</button>
				<button class="btn btn-primary" type="button" onclick="sendOk();">문의</button>
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