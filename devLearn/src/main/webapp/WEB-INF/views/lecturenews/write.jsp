<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">
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

<script type="text/javascript">
function sendOk() {
	var f = document.lectureNewsForm;
	var str;
	
	str = f.subject.value.trim();
	if(!str) {
		alert("제목을 입력하세요.");
		f.subject.focus();
		return;
	}
	
	str = f.content.value.trim();
	if(!str) {
		alert("내용을 입력하세요.");
		f.content.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/lecturenews/${mode}";
	f.submit();
}

<c:if test="${mode=='update'}">
	function deleteFile(newsfileNum) {
		var url = "${pageContext.request.contextPath}/lecturenews/deleteFile";
		$.post(url, {newsfileNum:newsfileNum}, function(data) {
			$("#f" + newsfileNum).remove();
		}, "json");
	}
</c:if>
</script>

<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3><i class="bi bi-clipboard"></i> 강의 새소식 </h3>
		</div>
		
		<div class="body-main">
			
			<form name="lectureNewsForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 write-form">
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">작성자</td>
						<td>
							<p class="form-control-plaintext">${sessionScope.member.nickname}</p>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">내용</td>
						<td>
							<div class="editor">${dto.content}</div>
							<input type="hidden" name="content">
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/lecturenews/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.newsNum}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="group" value="${group}">
							</c:if>
						</td>
					</tr>
				</table>
				
			</form>
		</div>
	</div>
</div>


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