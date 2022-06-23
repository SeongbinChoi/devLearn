<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/studyList_article.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_boot_board.css" type="text/css">

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
	width: 100px;
    height: 25px;
}

img {
	width: 100%;
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

.reply-menu-item {
	cursor: pointer;
}
</style>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
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


// 페이지 처음 들어왔을때 댓글 리스트(페이징 없음)출력
$(function(){
	listPage();
});


// 댓글 리스트
function listPage() {
	let url = "${pageContext.request.contextPath}/community/listReply";
	let query = "studyNum=${dto.studyNum}";
	let selector = "#listReply";
	
	const fn = function(data) {
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}


// 댓글 등록
$(function () {
	$(".btnSendReply").click(function () {
		let studyNum = "${dto.studyNum}";
		const $tb = $(this).closest("table");
		
		let content = $tb.find("textarea").val().trim();
		if(! content) {
			alert("댓글 내용을 입력하세요");
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/community/insertReply"; 
		let query = "studyNum=${dto.studyNum}&content=" + content + "&parent=0";
		
		
		const fn = function(data) {
			$tb.find("textarea").val("");
			
			let state = data.state;
			if(state === "true") {
				listPage();
			} else if(state === "false") {
				alert("댓글을 추가하지 못했습니다.");
			}
		};
 
		ajaxFun(url, "post", query, "json", fn);
	});
});


// 댓글 삭제 
$(function () {
	$("body").on("click", ".deleteReply", function () {
		if(! confirm("댓글을 삭제하시겠습니까? ")) {
			return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		let url = "${pageContext.request.contextPath}/community/deleteReply";
		let query = "replyNum="+replyNum+"&studyNum=${dto.studyNum}";
		
		console.log(query);
		
		const fn = function(data) {
			listPage();
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});


// 댓글의 답글 리스트 가져오기
function listReplyAnswer(parent) {
	let url = "${pageContext.request.contextPath}/community/listReplyAnswer";
	let query = "parent=" + parent;
	let selector = "#listReplyAnswer" + parent;
	
	const fn = function(data) {
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}


// 댓글의 답글 갯수 세기
function countReplyAnswer(parent) {
	let url = "${pageContext.request.contextPath}/community/countReplyAnswer";
	let query = "parent=" + parent;
	
	const fn = function(data) {
		let count = data.count;
		let selector = "#answerCount" + parent;
		$(selector).html(count);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}


// 답글 버튼(댓글의 댓글 등록폼과 답글 리스트 보여주기)
$(function () {
	$("body").on("click", ".btnReplyAnswerLayout", function () {
		const $trReplyAnswer = $(this).closest("tr").next();
		
		let isVisible = $trReplyAnswer.is(":visible");
		let replyNum = $(this).attr("data-replyNum");
		
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
		
			// 답글 리스트
			listReplyAnswer(replyNum);
			
			// 답글 개수
			countReplyAnswer(replyNum);
		}
		
	});
});


// 댓글의 댓글 등록
$(function () {
	$("body").on("click", ".btnSendReplyAnswer", function() {
		let studyNum = "${dto.studyNum}";
		let replyNum = $(this).attr("data-replyNum");
		const $td = $(this).closest("td");
		
		let content = $td.find("textarea").val().trim();
		if(! content) {
			alert("댓글을 입력하세요.");
			$td.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/community/insertReply";
		let query = "studyNum=" + studyNum + "&content=" + content + "&parent=" + replyNum;
		
		const fn = function(data) {
			$td.find("textarea").val("");
			
			var state = data.state;
			if(state === "true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});


// 댓글의 댓글 삭제
$(function () {
	$("body").on("click", ".deleteReplyAnswer", function() {
		if(! confirm("댓글을 삭제하시겠습니까?")) {
			return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		let parent = $(this).attr("data-parent");
		
		let url = "${pageContext.request.contextPath}/community/deleteReply";
		let query = "replyNum=" + replyNum + "&mode=reply";
		
		const fn = function(data) {
			listReplyAnswer(parent);
			countReplyAnswer(parent);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});


// 스터디 글쓰기
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

	f.action = "${pageContext.request.contextPath}/community/study_update";
	f.submit();
}


// 스터디 게시글 삭제
function deleteBoard() {
	if(confirm("게시글을 삭제하시겠습니까?")) {
		let query = "studyNum=${dto.studyNum}&${query}";
		let url = "${pageContext.request.contextPath}/community/stduy_delete?" + query;
		location.href = url;
	}
}


// 스터디 신청
function studyApply() {
	if(confirm("스터디 신청하시겠습니까??")) {
		let query = "studyNum=${dto.studyNum}&${query}"
		
		console.log(query);
		
		let url = "${pageContext.request.contextPath}/community/studyApply?" + query;
		location.href = url;
	}
}

</script>


<!-- 메인코드 -->
	<div class="contentBody container col-11 my-5 h-100">
	
		<div class="sideMenu col-2">
			<div class="cmmu-menu list-group px-1">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/community/studyList?${query}'"><i class="fa-solid fa-arrow-left-long"></i></button>
			</div>
		</div>
			
			
		<div class="mainContent col-8 h-100" style="min-height: 500px;">
			<!-- TOP버튼 -->
			<a id="top_btn" href="#"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></a>
			
			<div class="article_top" id="nav-tabContent">
				<div class="title d-flex" id="study_artice_subject">
					<c:choose>
						<c:when test="${dto.status == 0}">
							<div class="mark_ing" style="margin-top: 13px;">모집중(${dto.applied}/${dto.limit})</div>
						</c:when>
						<c:otherwise>
							<div class="mark_finish" style="margin-top: 13px;">모집완료</div>
						</c:otherwise>
					</c:choose>
					<div class="p-2 w-100">[${dto.region}]${dto.subject}</div>
					<c:choose>
					<c:when test="${(sessionScope.member.memberEmail != dto.memberEmail) && dto.status == 0}">
						<input type="hidden" name="studyNum" value="${dto.studyNum}">
						<button type="button" class="p-2 flex-shrink-0 btn btn-danger" onclick="studyApply();">스터디신청</button>
					</c:when>
					<c:otherwise>
						<div class="p-2 flex-shrink-0"><button type="button" class="btn btn-danger" style="display : none;">스터디신청</button></div>
					</c:otherwise>
					</c:choose>
				</div>
				<div class="subTitle">
					<h6 class="userName" id="userName">${dto.memberNickname}</h6>
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
					<c:if test="${not empty preReadStudy}">
						<a href="${pageContext.request.contextPath}/community/studyList_article?${query}&studyNum=${preReadStudy.studyNum}">${preReadStudy.subject}</a>
					</c:if>
					</p>
					
					<p>다음글 :
					<c:if test="${not empty nextReadStudy}">
						<a href="${pageContext.request.contextPath}/community/studyList_article?${query}&studyNum=${nextReadStudy.studyNum}">${nextReadStudy.subject}</a>
					</c:if>
				</div>
				<hr>
				
				<div style="margin-bottom: 30px;">
					<c:choose>
						<c:when test="${(sessionScope.member.memberEmail == dto.memberEmail) && dto.status == 0}">
							<!-- 모집중인 경우 -> 모달로 수정가능 변경 -->
							<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#studyModal">수정</button>
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
				</div>
				
				
				<div class="answer_info" style="background-color: #E7E7E7;">
					<div class="answer_info_header">
						<div class="answer_info_title" style="color: #616568; font-weight: 500; font-size: 18px;">
							<span class="title-icon" style="font-size: 30px; margin-left: 10px;">A</span>
							스터디 원하시면 댓글을 달아보세요~
						</div>
					</div>
					
					<div class="answer_info_main" style="width : 100%; height: 100%; border: 1px solid #f1f3f5; background-color: white;">
						<form name="replyForm" method="post">
							<div class="answer_info_profile flex-row" style="padding: 24px 36px; border-bottom: none; display: flex; flex-direction: row;">
								<img alt="" src="https://cdn.inflearn.com/public/main/profile/default_profile.png" style="width:48px; height: 48px; border-radius: 100px; margin-right: 10px;">
								<div class="profile_option" style="display: flex; flex-direction: column;">
									<h5 class="answer_userName">${sessionScope.member.memberNickname} 님,답글을 남겨보세요!</h5>
								</div>
							</div>
							
							
							<table class="table table-borderless reply-form">
								<tr>
									<td>
										<textarea class='form-control' name="content"></textarea>
									</td>
								</tr>
							
								<tr class="answer_submit" style="margin-top: 10px;">
									<td>
										<button type="button" class="btn btn-primary btnSendReply" style="float: right;">답변 등록</button>
									</td>
								</tr>
							</table>
						</form>
						
						<div id="listReply"></div>
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
			  <input type="text" class="form-control" id="community_subject" placeholder="제목을 입력해주세요." name="subject" value="${dto.subject}">
			</div>
			<div class="mb-3">
			<p>
			  <label for="exampleFormControlInput1" class="form-label" style="padding-right: 20px;">모집인원</label>
			  <select name="limit" style="margin-right: 150px;">
			  	<option value="select">--선택--</option>
			  	<option value="1" ${dto.limit == 1 ? "selected='selected'" : ""}>1명</option>
			  	<option value="2" ${dto.limit == 2 ? "selected='selected'" : ""}>2명</option>
			  	<option value="3" ${dto.limit == 3 ? "selected='selected'" : ""}>3명</option>
			  	<option value="4" ${dto.limit == 4 ? "selected='selected'" : ""}>4명</option>
			  </select>
			</p>
			
			<p>
			  <label for="exampleFormControlInput1" class="form-label">스터디 지역</label>
			  <select name="regionNum">
			  	<option value="select">--선택--</option>
			  	<option value="1" ${dto.regionNum == 1 ? "selected='selected'" : ""}>서울</option>
			  	<option value="2" ${dto.regionNum == 2 ? "selected='selected'" : ""}>경기</option>
			  	<option value="3" ${dto.regionNum == 3 ? "selected='selected'" : ""}>인천</option>
			  </select>
			</p>
			</div>
			<div class="mb-3 tab-content" id="community_tabContent">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  	<div class="tab-pane fade show active" id="study_content" role="tabpanel">
			  		<div class="editor">${dto.content}</div>
			  		<input type="hidden" name="content">
				</div>
			</div>
			<div class="mb-3">
				<button class="btn btn-primary" type="button" data-bs-dismiss="modal">취소</button>
				<button class="btn btn-primary" type="button" onclick="sendOk();">저장</button>
				<input type="hidden" name="rows" value="${rows}">
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="studyNum" value="${dto.studyNum}">
			</div>
	      </div>
	    </div>
	  </div>
	</div>
</form>


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