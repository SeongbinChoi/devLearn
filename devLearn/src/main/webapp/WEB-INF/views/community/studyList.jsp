<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/studyList.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/community_boot_board.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

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
}
</style>



<div class="banner mb-5">
	<div class="container px-4">
		<div class="title row align-items-center" style="height: 200px;">
			<p><span>스터디</span><br>함께 성장할 스터디를 모집해보세요!</p>
		</div>
	</div>
</div>


<div class="contentBody container col-11 my-5">

	<div class="sideMenu col-2">
		<div class="cmmu-menu list-group px-1">
			<a class="list-group-item list-group-item-action disabled list-group-item-secondary">커뮤니티</a>
			<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/community/qnaList">· 질문과 답변</a>
			<a class="list-group-item list-group-item-action active" aria-current="true" href="${pageContext.request.contextPath}/community/studyList">· 스터디</a>
		</div>
	</div>
		
	<div class="mainContent col-9" style="float: none; margin:0 auto;">
		<!-- TOP버튼 -->
		<a id="top_btn" href="#"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></a>
			
		<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="find-tab" data-bs-toggle="tab" data-bs-target="#nav-find" type="button" role="tab" aria-controls="find" aria-selected="false">모집중</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="finish-tab" data-bs-toggle="tab" data-bs-target="#nav-finish" type="button" role="tab" aria-controls="finish" aria-selected="false">모집완료</button>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">지역별</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">서울</a></li>
					<li><a class="dropdown-item" href="#">인천</a></li>
					<li><a class="dropdown-item" href="#">경기</a></li>
					<li><a class="dropdown-item" href="#">대전</a></li>
					<li><a class="dropdown-item" href="#">대구</a></li>
					<li><a class="dropdown-item" href="#">부산</a></li>
					<li><a class="dropdown-item" href="#">울산</a></li>
					<li><a class="dropdown-item" href="#">광주</a></li>
					<li><a class="dropdown-item" href="#">세종</a></li>
					<li><a class="dropdown-item" href="#">제주</a></li>
				</ul>
			</li>
		</ul>
		
		
		<div class="input-group mb-3 input-group-lg mb-5">
			<span class="input-group-text" id="basic-addon1 inputGroup-sizing-lg" style="background: white;"><i class="fas fa-search"></i></span>
			<input type="text" id="keyword" class="form-control" placeholder="관심 스터디를 검색해보세요!" aria-label="Username" aria-describedby="basic-addon1">
			<button class="btn btn-outline-secondary px-5" type="button" id="button-addon2">검색</button>
		</div>
		
		
		<div class="contentHeader">
			<div class="nav-filter nav nav-pills">
				<a class="nav-link active" aria-current="page" href="#">최신순</a>
				<a class="nav-link" href="#">답변많은순</a>
			</div>
			<div class="btnGroup">
				<button type="button" class="btn btn-outline-primary" onclick='location.href="${pageContext.request.contextPath}/community/studyList";'><i class="fas fa-redo-alt"></i>새로고침</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#studyModal">글쓰기</button>
			</div>
		</div>
		
		<hr>
		
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="all-tab">
				<!-- 스터디 - 전체 -->
				<c:forEach var="i" begin="1" end="10">
					<a href="${pageContext.request.contextPath}/community/studyList_aritcle">
						<div class="question px-3 py-1">
							<div class="question_info">
								<div class="question_title col-12">
									<div class="mark_ing">
										모집중
									</div>
									
									<div class="subject col-9">
										<p>
											웹 프로젝트 팀원 모집합니다.
										</p>
									</div>
								</div>
								
								<div class="question_body col-12 mb-3"> 
									<div class="body_content col-10">
										<p>
											스터디 모집글을 아래 양식을 참고해 작성해주세요. 
											꼼꼼히 작성하면 멋진 스터디 팀원을 만나실 수 있을거예요. 
											[개발 스터디 모집 내용 예시] 스터디 주제 : 코딩테스트 준비
											스터디 목표 : 취직 코딩테스트를 위해서
										</p>
									</div>
									<div class="answerNum mx-4">
										<div class="num_center">
											<span>0<br>댓글</span>
										</div>
									</div>
								</div>
								
								<div class="question_footer">
									<p>김자바 | 2022-05-29</p>
								</div>
							</div>
						</div>
					</a>
					<hr>
				</c:forEach>
			</div>
			
			<div class="tab-pane fade" id="nav-find" role="tabpanel" aria-labelledby="find-tab">
				<!-- 스터디 - 모집중 -->
				<c:forEach var="i" begin="1" end="10">
					<a href="${pageContext.request.contextPath}/community/studyList_aritcle">
						<div class="question px-3 py-1">
							<div class="question_info">
								<div class="question_title col-12">
									<div class="mark_ing">
										모집중
									</div>
									<div class="subject col-9">
										<p>
											웹 프로젝트 팀원 모집합니다.
										</p>
									</div>
								</div>
								
								<div class="question_body col-12 mb-3"> 
									<div class="body_content col-10">
										<p>
											스터디 모집글을 아래 양식을 참고해 작성해주세요. 
											꼼꼼히 작성하면 멋진 스터디 팀원을 만나실 수 있을거예요. 
											[개발 스터디 모집 내용 예시] 스터디 주제 : 코딩테스트 준비
											스터디 목표 : 취직 코딩테스트를 위해서
										</p>
									</div>
									<div class="answerNum mx-4">
										<div class="num_center">
											<span>0<br>댓글</span>
										</div>
									</div>
								</div>
								
								<div class="question_footer">
									<p>김자바 | 2022-05-29</p>
								</div>
							</div>
						</div>
					</a>
					<hr>
				</c:forEach>
			</div>
			
			
			<div class="tab-pane fade" id="nav-finish" role="tabpanel" aria-labelledby="finish-tab">
				<!-- 스터디 - 모집완료 -->
				<c:forEach var="i" begin="1" end="10">
					<a href="${pageContext.request.contextPath}/community/studyList_aritcle">
						<div class="question px-3 py-1">
							<div class="question_info">
								<div class="question_title col-12">
									<div class="mark_finsh">
										모집완료
									</div>
									<div class="subject col-9">
										<p>
											웹 프로젝트 팀원 모집합니다.
										</p>
									</div>
								</div>
								
								<div class="question_body col-12 mb-3"> 
									<div class="body_content col-10">
										<p>
											스터디 모집글을 아래 양식을 참고해 작성해주세요. 
											꼼꼼히 작성하면 멋진 스터디 팀원을 만나실 수 있을거예요. 
											[개발 스터디 모집 내용 예시] 스터디 주제 : 코딩테스트 준비
											스터디 목표 : 취직 코딩테스트를 위해서
										</p>
									</div>
									<div class="answerNum mx-4">
										<div class="num_center">
											<span>0<br>댓글</span>
										</div>
									</div>
								</div>
								
								<div class="question_footer">
									<p>김자바 | 2022-05-29</p>
								</div>
							</div>
						</div>
					</a>
					<hr>
				</c:forEach>
			</div>
		</div>
		
		<nav aria-label="...">
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
			  <input type="text" class="form-control" id="community_subject" placeholder="제목을 입력해주세요.">
			</div>
			<div class="mb-3 tab-content" id="community_tabContent">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  	<div class="tab-pane fade show active" id="study_content" role="tabpanel">
			  		<div class="editor"></div>
				</div>
			</div>
			<div class="mb-3">
				<button class="btn btn-primary" type="button" data-bs-dismiss="modal">취소</button>
				<input class="btn btn-primary" type="button" value="저장">
			</div>
	      </div>
	    </div>
	  </div>
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