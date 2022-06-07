<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css" type="text/css">	

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>인프런의 새로운 소식들!</span><br>신규 콘텐츠, 이벤트, 기능 추가 등의 새로운 인프런의 이야기를 들어주세요.</p>
			</div>
		</div>
	</div>
	
	<div class="contentBody container col-11 my-5">
	
		<div class="sideMenu col-2">
			<div class="card">
				<div class="card-header">
				  공지사항
				</div>
				<a class="list-group-item list-group-item-action active" aria-current="true" href="#">· 공지사항</a>
				<a class="list-group-item list-group-item-action" href="#">· 이벤트</a>
				<a class="list-group-item list-group-item-action" href="#">· FAQ & 1:1문의</a>
			</div>
		</div>
			
		<div class="mainContent col-9" style="margin: 0 auto;">
			<!-- 질문 -->
			<c:forEach begin="1" end="3">
				<div class="notice px-3">
					<a href="${pageContext.request.contextPath}/notice_article.jsp">
						<div class="notice_info">
							<div class="notice_title">
								<p><span class="title_start">N.</span>[업데이트 소식] 5월 3주차 - 수강바구니🛒</p>
							</div>
							
							<div class="notice_body col-12"> 
								<div class="body_content col-10">
									<span class="notice_content mr">12일 전</span> <span class="notice_content mr">글쓴이: 인프런 우디 <i class="fas fa-check-circle"></i></span> <span class="notice_content mr">대상 : 전체</span>
								</div>
							</div>
						</div>
					</a>
				</div>
			<hr>
			
			<div class="notice px-3">
				<a href="${pageContext.request.contextPath}/notice_article.jsp">
					<div class="notice_info">
						<div class="notice_title">
							<p><span class="title_start">N.</span>[사전공지] 통합계정 서비스 안내</p>
						</div>
						
						<div class="notice_body col-12"> 
							<div class="body_content col-10">
								<span class="notice_content mr">17일 전</span> <span class="notice_content mr">글쓴이: 인프런 우디 <i class="fas fa-check-circle"></i></span> <span class="notice_content mr">대상 : 전체</span>
							</div>	
						</div>
					</div>
				</a>
			</div>
			<hr>
	
			<div class="notice px-3">
				<a href="${pageContext.request.contextPath}/notice_article.jsp">
					<div class="notice_info">
						<div class="notice_title">
							<p><span class="title_start">N.</span>[새소식] 인프런에서 만든 채용 플랫폼!! + 감사 인사 🙏</p>
						</div>
						
						<div class="notice_body col-12"> 
							<div class="body_content col-10">
								<span class="notice_content mr">17일 전</span> <span class="notice_content mr">글쓴이: 인프런 우디 <i class="fas fa-check-circle"></i> </span> <span class="notice_content mr">대상 : 전체</span>
							</div>
						</div>
					</div>
				</a>
			</div>
			<hr>
			</c:forEach>
	
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