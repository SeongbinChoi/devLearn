<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/studyList_article.css" type="text/css">

<style>
a#top_btn {
	position: fixed;
	left: 3%;
	bottom: 15%;
	display: none;
	z-index: 99;
}
</style>


	<div class="contentBody container col-11 my-5">
	
		<div class="sideMenu col-2">
			<div class="cmmu-menu list-group px-1">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/community/studyList'"><i class="fa-solid fa-arrow-left-long"></i></button>
			</div>
		</div>
			
			
		<div class="mainContent col-8" style="float: none; margin:0 auto;">
			<!-- TOP버튼 -->
			<a id="top_btn" href="#"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></a>
			
			<div class="article_top" id="nav-tabContent">
				<div class="title d-flex" id="study_artice_subject">
					<div class="mark_ing">모집중</div> <div class="p-2 w-100">코테 자바 스터디모집합니다.</div>
				</div>
				<hr>
			</div>
			
			
			<div class="content">
				<div class="content_main">
					<p>
					스터디 주제 : 코딩테스트(자바) 스터디 <br>
					스터디 목표 : 코딩테스트 합격이 목표 <br>
					스터디 인원 : 4명 <br>
					각종 내용들(CLOB)
					</p>
					<hr>
				</div>
				
				
				<div class="answer_info" style="background-color: #E7E7E7;">
					<div class="answer_info_header">
						<div class="answer_info_title" style="color: #616568; font-weight: 500; font-size: 18px;">
							<span class="title-icon" style="font-size: 30px; margin-left: 10px;">A</span>
							총 1개의 답글이 달렸습니다
						</div>
					</div>
					
					<div class="answer_info_main" style="width : 100%; height: 600px; border: 1px solid #f1f3f5; background-color: white;">
						<div class="answer_info_profile flex-row" style="padding: 24px 36px; border-bottom: none; display: flex; flex-direction: row;">
							<img alt="" src="https://cdn.inflearn.com/public/main/profile/default_profile.png" style="width:48px; height: 48px; border-radius: 100px; margin-right: 10px;">
							<div class="profile_option" style="display: flex; flex-direction: column;">
								<h5 class="answer_userName">아무개님,답글을 남겨보세요!</h5>
							</div>
						</div>
						
						<div class="ckedit">
							<textarea>
								df
							</textarea>
						</div>
						
						<div class="answer_submit">
							<button type="button" class="btn btn-primary" style="float: right;">답변 등록</button>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="mainContent col-2" style="float: none; margin:0 auto;">
			
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
	