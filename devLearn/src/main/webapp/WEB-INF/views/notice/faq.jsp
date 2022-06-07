<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faq.css" type="text/css">

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>자주 묻는 질문</span><br>문의유형을 선택하면 문의유형에 따라 [자주 묻는 질문]을 확인할 수 있습니다.<br>찾는 질문과 답변이 보이지 않으면 [질문 검색]을 이용해 원하는 질문과 답변을 찾아 주세요</p>
			</div>
		</div>
	</div>
	
	<div class="content container col-11 my-5 ">
		<!-- 사이드바 -->
		<div class="side-nav col-2">
			<div class="sideMenu ">
				<div class="notice-menu list-group px-1">
					<a class="list-group-item list-group-item-action disabled list-group-item-secondary" style="background: rgba(0,0,0,0.03);">공지사항</a>
					<a class="list-group-item list-group-item-action " href="#">· 공지사항</a>
					<a class="list-group-item list-group-item-action" href="#">· 이벤트</a>
					<a class="list-group-item list-group-item-action active" aria-current="true"  href="#">· FAQ</a>
				</div>			
			</div>
			<div class="my-question list-group px-1 mt-3">
				<a class="list-group-item list-group-item-action" href="#">· 내 문의</a>
			</div>
		</div>
	
		<div class="right-side col-9 " style="float:none; margin:0 auto;">
			<div class="top-nav">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#account" type="button" role="tab" aria-controls="account" aria-selected="false">계정</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#lecture" type="button" role="tab" aria-controls="lecture" aria-selected="false">강의</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#mentor" type="button" role="tab" aria-controls="mentor" aria-selected="false">멘토</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#payment" type="button" role="tab" aria-controls="payment" aria-selected="false">결제</button>
					</li>
				</ul>
			</div>
			

			<!-- 탭 콘텐츠 -->
			<div class="tab-content" id="myTabContent">
				<!-- 검색 -->			
				<div class="search my-3">
					<form name="serachForm" action="" >
						<div class="search-border border rounded-pill d-flex justify-content-center ">
							<input type="text" class="search-input" placeholder="문장이 아닌 '단어'로 검색하세요(특수문자 불가)">
							<button type="button" style="border: none; background: none;"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</form>
				</div>

				<!-- 전체 -->
				<div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="home-tab">
				
					
					<div class="accordion" id="all-arcodian">
						<c:forEach var="i" begin="1" end="10">
							<div class="accordion-item">
								<h2 class="accordion-header" id="all-heading${i}">
								<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-${i}" aria-expanded="true" aria-controls="all-${i}">
									전체 질문
								</button>
								</h2>
								<div id="all-${i}" class="accordion-collapse collapse " aria-labelledby="all-heading${i}">
									<div class="accordion-body">
										<p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div><!-- all accordion end -->
				</div><!-- tab content all end -->
				
				<!-- 계정 질문 -->
				<div class="tab-pane fade my-3" id="account" role="tabpanel" aria-labelledby="profile-tab">
					<div class="accordion" id="account-arcodian">
						<c:forEach var="i" begin="1" end="10">
							<div class="accordion-item">
								<h2 class="accordion-header" id="account-heading${i}">
								<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#account-${i}" aria-expanded="true" aria-controls="account-${i}">
									계정 질문
								</button>
								</h2>
								<div id="account-${i}" class="accordion-collapse collapse " aria-labelledby="account-heading${i}">
									<div class="accordion-body">
										<p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div><!-- tab content account end -->
				
				<!-- 강의 질문 -->
				<div class="tab-pane fade my-3" id="lecture" role="tabpanel" aria-labelledby="profile-tab">
					<div class="accordion" id="lecture-arcodian">
						<c:forEach var="i" begin="1" end="10">
							<div class="accordion-item">
								<h2 class="accordion-header" id="lecture-heading${i}">
								<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#lecture-${i}" aria-expanded="true" aria-controls="lecture-${i}">
									강의 질문
								</button>
								</h2>
								<div id="lecture-${i}" class="accordion-collapse collapse " aria-labelledby="lecture-heading${i}">
									<div class="accordion-body">
										<p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div><!-- tab content lecture end -->
				
				<!-- 멘토 질문 -->
				<div class="tab-pane fade my-3" id="mentor" role="tabpanel" aria-labelledby="profile-tab">
					<div class="accordion" id="mentor-arcodian">
						<c:forEach var="i" begin="1" end="10">
							<div class="accordion-item">
								<h2 class="accordion-header" id="mentor-heading${i}">
								<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#mentor-${i}" aria-expanded="true" aria-controls="mentor-${i}">
									멘토 질문
								</button>
								</h2>
								<div id="mentor-${i}" class="accordion-collapse collapse " aria-labelledby="mentor-heading${i}">
									<div class="accordion-body">
										<p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div><!-- tab content mentor end -->
				
				
				
				<!-- 결제 질문 -->
				<div class="tab-pane fade my-3" id="payment" role="tabpanel" aria-labelledby="profile-tab">
					<div class="accordion" id="mentor-arcodian">
						<c:forEach var="i" begin="1" end="10">
							<div class="accordion-item">
								<h2 class="accordion-header" id="payment-heading${i}">
								<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#payment-${i}" aria-expanded="true" aria-controls="payment-${i}">
									결제 질문
								</button>
								</h2>
								<div id="payment-${i}" class="accordion-collapse collapse " aria-labelledby="payment-heading${i}">
									<div class="accordion-body">
										<p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
								        <p>답변내용</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div><!-- tab content payment end -->
			
			</div><!-- tab-content end -->
			
		</div><!-- 오른쪽 부분 end -->
	</div><!-- container end -->