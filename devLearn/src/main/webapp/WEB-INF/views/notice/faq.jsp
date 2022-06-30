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
		
		<div class="sideMenu col-2">
			<div class="card">
				<div class="card-header">
				  공지사항
				</div>
				<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/notice">· 공지사항</a>
				<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/eventList">· 이벤트</a>
				<a class="list-group-item list-group-item-action active" aria-current="true"  href="${pageContext.request.contextPath}/notice/faq">· FAQ </a>
				<c:if test="${sessionScope.member.memberEmail != null}">
					<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/mTomInquiry">· 1:1문의 </a>
				</c:if>
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
						
						<!-- 전체 질문 1 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading1">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-1" aria-expanded="true" aria-controls="all-1">
								<b>[계정]</b>&nbsp;&nbsp;로그인이 되지 않아요
							</button>
							</h2>
							<div id="all-1" class="accordion-collapse collapse " aria-labelledby="all-heading1">
								<div class="accordion-body">
									
									<p>로그인이 안 되실 때는 아이디와 비밀번호를 확인 해주세요.<br><br><br>
									
									비밀번호를 5회 이상 틀린 경우에도 로그인이 되지 않습니다.<br><br>
									이 경우 admin@devLearn.com 으로 문의 해주세요.<br><br>
									
									
								</div>
							</div>
						</div>
						
						<!-- 전체 질문 2 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading2">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-2" aria-expanded="true" aria-controls="all-2">
								<b>[결제]</b>&nbsp;&nbsp;결제 내역은 어떻게 확인 하나요?
							</button>
							</h2>
							<div id="all-2" class="accordion-collapse collapse " aria-labelledby="all-heading2">
								<div class="accordion-body">
									<p>
									결제 내역은 마이페이지 > 구매내역  에서 확인하실 수 있습니다.<br><br><br><br>
									
									상세 내역은 거래명세서에서 확인하실 수 있습니다.<br><br><br>
									
										
								</div>
							</div>
						</div>
						
						<!-- 전체 질문 3 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading3">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-3" aria-expanded="true" aria-controls="all-3">
								<b>[강의]</b>&nbsp;&nbsp;강의가 재생되지 않아요
							</button>
							</h2>
							<div id="all-3" class="accordion-collapse collapse " aria-labelledby="all-heading3">
								<div class="accordion-body">
									강의는 경우에 따라 수강 기한이 정해진 경우가 있습니다.<br><br>
									정해진 수강 기간이 모두 경과했는지 확인해주세요.<br><br><br>
									
									강의 기간이 남아있지만 재생이 되지 않으신다면 네트워크를 확인 해주세요.<br><br>
									
									문제가 해결되지 않으셨다면 admin@devLearn.com 으로 문의 해주세요.<br><br>

								</div>
							</div>
						</div>
						
						
						<!-- 전체 질문 4 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading4">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-4" aria-expanded="true" aria-controls="all-4">
								<b>[결제]</b>&nbsp;&nbsp;이용(결제)금액 정보가 달라요.
							</button>
							</h2>
							<div id="all-4" class="accordion-collapse collapse " aria-labelledby="all-heading4">
								<div class="accordion-body">
									카드로 이용하신 내역의 경우, 각 카드사의 청구내역과 승인내역으로 정보가 구분됩니다.<br><br>
									청구내역은 할인/적립/포인트차감 등이 포함된 카드 청구서 발송 후 금액을 기준으로 제공하고, 승인내역은 실제 이용한 금액만을 기준으로 제공합니다.<br><br>
									마이데이터 소비 메뉴에서는 각 금융기관에서 조회된 "승인내역"을 기준으로 제공하고 있습니다.<br><br>
									따라서 승인내역의 금액과 실제 고객님께 청구되는 금액과는 다를 수 있으므로 양해해 주시기 바랍니다.<br><br><br>
									
									* 경로1 : 메뉴 홈>소비<br><br>
									* 경로2 : 메뉴 홈>소비>소비분석<br><br>
									* 경로3 : 메뉴 홈>소비>이용내역조회<br><br>
									
									화면으로 이동하여 확인하실 수 있습니다.<br><br>

								</div>
							</div>
						</div>
						
						<!-- 전체 질문 5 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading5">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-5" aria-expanded="true" aria-controls="all-5">
								<b>[계정]</b>&nbsp;&nbsp;내 정보를 변경하고싶어요
							</button>
							</h2>
							<div id="all-5" class="accordion-collapse collapse " aria-labelledby="all-heading5">
								<div class="accordion-body">
									정보를 변경하시는 경우에는 <br><br>
									헤더의 정보수정 버튼을 클릭하시고<br><br>
									비밀번호를 입력하시면 정보를 변경하실 수 있습니다.<br><br><br>
										
								</div>
							</div>
						</div>
							
						<!-- 전체 질문 6 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading6">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-6" aria-expanded="true" aria-controls="all-6">
								<b>[강의]</b>&nbsp;&nbsp;강의는 어떻게 등록하나요?
							</button>
							</h2>
							<div id="all-6" class="accordion-collapse collapse " aria-labelledby="all-heading6">
								<div class="accordion-body">
									강의를 등록하시기 위해서는 우선 지식공유자 신청을 통해 강사의 권한을 신청해주세요.<br><br>
									신청해주신 내용을 확인 후 강사권한을 열어드립니다.<br><br><br>
									
									강사 권한을 취득하신 후에 마이페이지에 들어가시면 강사 탭이 활성화됩니다.<br><br>
									왼쪽 네비게이션 바의 새 강의 등록하기 버튼을 클릭하시면 새 강의를 등록하실 수 있습니다.<br><br><br>
									
									등록해 주신 강의는 관리자가 확인 후 공개처리 됩니다.<br><br>


								</div>
							</div>
						</div>
						
							
						<!-- 전체 질문 7 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading7">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-7" aria-expanded="true" aria-controls="all-7">
								<b>[멘토]</b>&nbsp;&nbsp;멘토링은 어떻게 등록하나요?
							</button>
							</h2>
							<div id="all-7" class="accordion-collapse collapse " aria-labelledby="all-heading7">
								<div class="accordion-body">
									멘토링를 등록하시기 위해서는 우선 지식공유자 신청을 통해 멘토의 권한을 신청해주세요.<br><br>
									신청해주신 내용을 확인 후 강사권한을 열어드립니다.<br><br><br>
									
									강사 권한을 취득하신 후에 마이페이지에 들어가시면 멘토 탭이 활성화됩니다.<br><br>
									왼쪽 네비게이션 바의 멘토링 관리 버튼을 클릭하시면 멘토링을 등록하실 수 있습니다.<br><br><br>
									
									멘티들이 신청한 내용은 신청관리 탭을 클릭하시면 신청된 내용을 확인하실 수 있습니다.<br><br><br>
										
								</div>
							</div>
						</div>
						
						
							
						<!-- 전체 질문 8 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading5">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-8" aria-expanded="true" aria-controls="all-8">
								<b>[멘토]</b>&nbsp;&nbsp;결제 내역은 어디서 확인하나요?
							</button>
							</h2>
							<div id="all-8" class="accordion-collapse collapse " aria-labelledby="all-heading8">
								<div class="accordion-body">
									강의를 등록하시기 위해서는 우선 지식공유자 신청을 통해 멘토의 권한을 신청해주세요.<br><br>
									신청해주신 내용을 확인 후 강사권한을 열어드립니다.<br><br><br>
									
									강사 권한을 취득하신 후에 마이페이지에 들어가시면 멘토 탭이 활성화됩니다.<br><br>
									왼쪽 네비게이션 바의 멘토링 관리 버튼을 클릭하시면 멘토링을 등록하실 수 있습니다.<br><br><br>
									
									멘티들이 신청한 내용은 신청관리 탭을 클릭하시면 신청된 내용을 확인하실 수 있습니다.<br><br><br>
																		
									
								</div>
							</div>
						</div>
						
						
							
						<!-- 전체 질문 9 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading9">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-9" aria-expanded="true" aria-controls="all-9">
								<b>[계정]</b>&nbsp;&nbsp;내 정보를 변경하고싶어요
							</button>
							</h2>
							<div id="all-9" class="accordion-collapse collapse " aria-labelledby="all-heading9">
								<div class="accordion-body">
									강의는 경우에 따라 수강 기한이 정해진 경우가 있습니다.<br><br>
									정해진 수강 기간이 모두 경과했는지 확인해주세요.<br><br><br>
									
									강의 기간이 남아있지만 재생이 되지 않으신다면 네트워크를 확인 해주세요.<br><br>
									
									문제가 해결되지 않으셨다면 admin@devLearn.com 으로 문의 해주세요.<br><br>

								</div>
							</div>
						</div>
						
						
							
						<!-- 전체 질문 10 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="all-heading10">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#all-10" aria-expanded="true" aria-controls="all-10">
								<b>[계정]</b>&nbsp;&nbsp;로그인이 되지 않아요
							</button>
							</h2>
							<div id="all-10" class="accordion-collapse collapse " aria-labelledby="all-heading10">
								<div class="accordion-body">
									강의는 경우에 따라 수강 기한이 정해진 경우가 있습니다.<br><br>
									정해진 수강 기간이 모두 경과했는지 확인해주세요.<br><br><br>
									
									강의 기간이 남아있지만 재생이 되지 않으신다면 네트워크를 확인 해주세요.<br><br>
									
									문제가 해결되지 않으셨다면 admin@devLearn.com 으로 문의 해주세요.<br><br>

								</div>
							</div>
						</div>
						
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
						
						<!-- 계정질문 1 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="account-heading${i}">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#account-${i}" aria-expanded="true" aria-controls="account-${i}">
								로그인이 되지 않아요
							</button>
							</h2>
							<div id="account-${i}" class="accordion-collapse collapse " aria-labelledby="account-heading${i}">
								<div class="accordion-body">
								
									로그인이 안 되실 때는 아이디와 비밀번호를 확인 해주세요.
									
									비밀번호를 5회 이상 틀린 경우에도 로그인이 되지 않습니다.
									이 경우 admin@devLearn.com 으로 문의 해주세요.
									
									
								</div>
							</div>
						</div>
						
						<!-- 계정질문 2 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="account-heading${i}">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#account-${i}" aria-expanded="true" aria-controls="account-${i}">
								강의가 재생되지 않아요
							</button>
							</h2>
							<div id="account-${i}" class="accordion-collapse collapse " aria-labelledby="account-heading${i}">
								<div class="accordion-body">
									강의는 경우에 따라 수강 기한이 정해진 경우가 있습니다.
									정해진 수강 기간이 모두 경과했는지 확인해주세요.
									
									강의 기간이 남아있지만 재생이 되지 않으신다면 네트워크를 확인 해주세요.
									
									문제가 해결되지 않으셨다면 admin@devLearn.com 으로 문의 해주세요.

								</div>
							</div>
						</div>
						
						<!-- 계정질문 2 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="account-heading${i}">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#account-${i}" aria-expanded="true" aria-controls="account-${i}">

							</button>
							</h2>
							<div id="account-${i}" class="accordion-collapse collapse " aria-labelledby="account-heading${i}">
								<div class="accordion-body">

								</div>
							</div>
						</div>
						
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