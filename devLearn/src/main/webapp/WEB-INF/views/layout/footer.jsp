<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="apply-section my-5">
	<div class="container">
	<c:if test="${visuable ne 'hidden'}">
		<div class="applys">	
			<div class="card apply-card" >
				<div class="card-body">
					<h5 class="card-title">강사가 되어 지식 공유</h5>
					<p class="card-text">나의 지식을 나눠 사람들에게 배움의 기회를 주고, 의미있는 대가를 가져가세요.</p>
					<a href="${pageContext.request.contextPath}/member/infoShare" class="btn btn-primary rounded-pill">강사 신청하기&nbsp;<i class="fa-solid fa-arrow-right"></i></a>
				</div>
			</div>
			<div class="card apply-card">
					<div class="card-body">
					<h5 class="card-title">멘토가 되어 지식 공유</h5>
					<p class="card-text">실무로 쌓은 경험을 새로이 공부하고 있는 여러 학생들에게 전수해주세요. </p>
					<a href="${pageContext.request.contextPath}/member/infoShare" class="btn btn-primary rounded-pill">멘토 신청하기&nbsp;<i class="fa-solid fa-arrow-right"></i></a>
				</div>
			</div>
			<div class="card apply-card" >
					<div class="card-body">
					<h5 class="card-title">함께 공부할 사람 찾기</h5>
					<p class="card-text">혼자서 할 때 보다 시너지를 내기 위해 스터디를 모집해보세요.	</p>
					<a href="${pageContext.request.contextPath}/community/studyList" class="btn btn-primary rounded-pill">스터디 구하기&nbsp;<i class="fa-solid fa-arrow-right"></i></a>
				</div>
			</div>
		</div>	
	</c:if>
	</div>
</div>
<c:if test="${visuable eq 'hidden'}">
	<div style="height:200px;"></div>
</c:if>
<div class="footer p-3">
	<div class = "container ">
		<div class ="d-flex justify-content-center">
			<a class="footer-brand" href="#"><span class="footer-logo">DEV Learn</span></a>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<a href="#">정책 및 약관</a>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<a href="#">소개</a>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<a href="#">개인정보취급방침</a>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<a href="#">이용약관</a>
		</div>
	</div>	
</div>