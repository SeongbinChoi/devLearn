<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qnaList.css" type="text/css">

<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>질문과 답변</span><br>함께 토론하며 문제를 해결해나가요</p>
			</div>
		</div>
	</div>
	
	
	<div class="contentBody container col-11 my-5">
	
		<div class="sideMenu col-2">
			<div class="cmmu-menu list-group px-1">
				<a class="list-group-item list-group-item-action disabled list-group-item-secondary">커뮤니티</a>
				<a class="list-group-item list-group-item-action active" aria-current="true" href="#">· 질문과 답변</a>
				<a class="list-group-item list-group-item-action" href="#">· 스터디</a>
			</div>
		</div>
			
		<div class="mainContent col-9" style="float: none; margin:0 auto;">
			<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">미해결</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">해결</button>
				</li>
			</ul>
			
			
			<div class="input-group mb-3 input-group-lg mb-5">
				<span class="input-group-text" id="basic-addon1 inputGroup-sizing-lg" style="background: white;"><i class="fas fa-search"></i></span>
				<input type="text" class="form-control" placeholder="궁금한 질문을 검색해보세요!" aria-label="Username" aria-describedby="basic-addon1">
				<button class="btn btn-outline-secondary px-5" type="button" id="button-addon2">검색</button>
			</div>
			
			<div class="contentHeader">
				<div class="nav-filter nav nav-pills">
					<a class="nav-link active" aria-current="page" href="#">최신순</a>
					<a class="nav-link" href="#">답변많은순</a>
				</div>
				<div class="btnGroup">
					<button type="button" class="btn btn-outline-primary"><i class="fas fa-redo-alt"></i>새로고침</button>
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#qnaModal">글쓰기</button>
				</div>
			</div>
			
			<hr>
			
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<!-- 질문 -->
			
					<c:forEach var="i" begin="1" end="10">
						<a href="#">
							<div class="question px-3 py-1">
								<div class="question_info">
									<div class="question_title">
										<p>슬랙 아이콘, css 리소스 로드 오류</p>
									</div>
									
									<div class="question_body col-12 mb-3"> 
										<div class="body_content col-10">
											<p>안녕하세요! 위와같은 오류가 나서요 26번 css랑 28번 font에 문제가 있는 것 같기도 하고
												https://blinders.tistory.com/84 이 블로그에서는 html-webpack-plugin 플러그인이 필요하다는 거 같은데
												해결 방법 도움 여쭈어요ㅠㅠ
											</p>
										</div>
										<div class="answerNum mx-4">
											<div class="num_center">
												<span>0<br>답변</span>
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
				
				<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					<!-- 질문 -->
			
					<c:forEach var="i" begin="1" end="10">
						<a href="#">
							<div class="question px-3 py-1">
								<div class="question_info">
									<div class="question_title">
										<p>슬랙 아이콘, css 리소스 로드 오류(미해결)</p>
									</div>
									
									<div class="question_body col-12 mb-3"> 
										<div class="body_content col-10">
											<p>안녕하세요! 위와같은 오류가 나서요 26번 css랑 28번 font에 문제가 있는 것 같기도 하고
												https://blinders.tistory.com/84 이 블로그에서는 html-webpack-plugin 플러그인이 필요하다는 거 같은데
												해결 방법 도움 여쭈어요ㅠㅠ
											</p>
										</div>
										<div class="answerNum mx-4">
											<div class="num_center">
												<span>0<br>답변</span>
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
				
				<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
										<!-- 질문 -->
			
					<c:forEach var="i" begin="1" end="10">
						<a href="#">
							<div class="question px-3 py-1">
								<div class="question_info">
									<div class="question_title">
										<p>슬랙 아이콘, css 리소스 로드 오류(해결)</p>
									</div>
									
									<div class="question_body col-12 mb-3"> 
										<div class="body_content col-10">
											<p>안녕하세요! 위와같은 오류가 나서요 26번 css랑 28번 font에 문제가 있는 것 같기도 하고
												https://blinders.tistory.com/84 이 블로그에서는 html-webpack-plugin 플러그인이 필요하다는 거 같은데
												해결 방법 도움 여쭈어요ㅠㅠ
											</p>
										</div>
										<div class="answerNum mx-4">
											<div class="num_center">
												<span>0<br>답변</span>
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
	<div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">커뮤니티</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="mb-3">
				<input class="btn btn-primary" type="button" value="질문">
				<input class="btn btn-primary" type="button" value="자유주제">
				<input class="btn btn-primary" type="button" value="스터디">
			</div>
	      	<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요.">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">태그</label>
			  <input type="email" class="form-control" id="exampleFormControlInput1" value="#" placeholder="태그를 설정해주세요.">
			  <label for="exampleFormControlInput1" class="form-label" style="font-size: 12px;">  최대 10개의 태그를 달수있어요!</label>
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
			  placeholder="- 학습 관련 질문을 남겨주세요. 상세히 작성하면 더 좋아요!&#13;&#10;- 먼저 유사한 질문이 있었는지 검색해보세요.&#13;&#10;- 서로 예의를 지키며 존중하는 문화를 만들어가요.&#13;&#10;- 잠깐!데브런 서비스 운영 관련 문의는 1:1 문의하기를 이용해주세요."
			  style="height: 350px;"></textarea>
			</div>
			<div class="mb-3">
				<input class="btn btn-primary" type="button" value="취소">
				<input class="btn btn-primary" type="submit" value="저장">
			</div>
	      </div>
	    </div>
	  </div>
	</div>
