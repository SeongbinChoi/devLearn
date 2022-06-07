<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/studyList.css" type="text/css">

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
			<a class="list-group-item list-group-item-action" href="#">· 질문과 답변</a>
			<a class="list-group-item list-group-item-action active" aria-current="true" href="#">· 스터디</a>
		</div>
	</div>
		
	<div class="mainContent col-9" style="float: none; margin:0 auto;">
		<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">모집중</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">모집완료</button>
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
			<input type="text" class="form-control" placeholder="관심 스터디를 검색해보세요!" aria-label="Username" aria-describedby="basic-addon1">
			<button class="btn btn-outline-secondary px-5" type="button" id="button-addon2">검색</button>
		</div>
		
		<div class="contentHeader">
			<div class="nav-filter nav nav-pills">
				<a class="nav-link active" aria-current="page" href="#">최신순</a>
				<a class="nav-link" href="#">답변많은순</a>
			</div>
			<div class="btnGroup">
				<button type="button" class="btn btn-outline-primary"><i class="fas fa-redo-alt"></i>새로고침</button>
				<button type="button" class="btn btn-primary">글쓰기</button>
			</div>
		</div>
		
		<hr>
		
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="home-tab">
				<!-- 질문 -->
				
				<c:forEach var="i" begin="1" end="10">
					<a href="#">
						<div class="question px-3 py-1">
							<div class="question_info">
								<div class="question_title col-12">
									<div class="mark_ing">
										모집중
									</div>
									<!-- 
									<div class="mark_finsh">
										모집완료
									</div>
									 -->
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
			
			<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="profile-tab">
				<!-- 질문 -->
				
				<c:forEach var="i" begin="1" end="10">
					<a href="#">
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
			
			<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="contact-tab">
				<!-- 질문 -->
				
				<c:forEach var="i" begin="1" end="10">
					<a href="#">
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