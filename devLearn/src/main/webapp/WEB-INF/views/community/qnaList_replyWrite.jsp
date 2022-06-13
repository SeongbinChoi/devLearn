<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qnaList_article.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/community_boot_board.css" type="text/css">
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


<script>
function sendOk() {
	var f = document.boardForm;
	var str;
	
	str = f.subject.value.trim();
	if( ! str) {
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
	
	f.action = "${pageContext.request.contextPath}/community/qnaList_${mode}";
	f.submit();
}
</script>



<!-- 메인코드 -->
	<div class="contentBody container col-11 my-5">
		<div class="sideMenu col-2">
			<div class="cmmu-menu list-group px-1">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/community/qnaList'"><i class="fa-solid fa-arrow-left-long"></i></button>
			</div>
		</div>
			
			
		<div class="mainContent col-8" style="float: none;">
			<!-- TOP버튼 -->
			<a id="top_btn" href="#"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></a>
			
			<div class="article_top">
				<div class="answer_info_main" style="height: 600px; border: 1px solid #f1f3f5; background-color: white;">
					<div class="answer_info_profile flex-row" style="padding: 24px 36px; border-bottom: none; display: flex; flex-direction: row;">
						<img alt="" src="https://cdn.inflearn.com/public/main/profile/default_profile.png" style="width:48px; height: 48px; border-radius: 100px; margin-right: 10px;">
						<div class="profile_option" style="display: flex; flex-direction: column;">
							<h5 class="answer_memberNickName"> ${sessionScope.member.memberNickname}님,답변해주세요!</h5>
							<span style="font-size: 13px; font-weight: 400; color: #abb0b5;">모두에게 도움이 되는 답변의 주인공이 되어주세요!</span>
						</div>
					</div>
					
			<form name="boardForm" method="post">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2" scope="row">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
        
					<tr>
						<td class="table-light col-sm-2" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.memberEmail}</p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2" scope="row">내 용</td>
						<td>
							<div class="editor">${dto.content}</div>
							<input type="hidden" name="content">
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless" style="margin-top: 20px;">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='replyUpdate'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/community/qnaList';">${mode=='replyUpdate'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='replyUpdate'}">
								<input type="hidden" name="qnaNum" value="${dto.qnaNum}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="rows" value="${rows}">
							</c:if>
							<c:if test="${mode=='reply'}">
								<input type="hidden" name="groupNum" value="${dto.groupNum}">
								<input type="hidden" name="orderNo" value="${dto.orderNo}">
								<input type="hidden" name="depth" value="${dto.depth}">
								<input type="hidden" name="parent" value="${dto.qnaNum}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="rows" value="${rows}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
			
				</div>
			</div>
		</div>
	<div>
		
	</div>
	
	
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