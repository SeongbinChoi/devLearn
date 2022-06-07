<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/11questionList.css" type="text/css">

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>자주 묻는 질문</span><br>문의유형을 선택하면 문의유형에 따라 [자주 묻는 질문]을 확인할 수 있습니다.<br>찾는 질문과 답변이 보이지 않으면 [질문 검색]을 이용해 원하는 질문과 답변을 찾아 주세요</p>
			</div>
		</div>
	</div>
	
	<div class="content container col-10 my-3 ">
		<div class="side-nav col-2  offset-md-1 mx-5">
			<div class="sideMenu ">
				<div class="card">
					<a class="nav-link" href="#">자주 묻는 질문</a>
					<div class="card-header sideMenu">
					  	<a class="faq" href="#">내 문의 내역</a>
					</div>
				</div>
			</div>
		</div>
		<div class="right-side col-8 ">
			<div class="titleSection d-flex justify-content-between">
				<div class="titleSection-title-txt" >
					<p class="titleSection-title">내 문의내역</p>
					<p class="">최근 6개월 동안 접수하신 1:1문의내역 및 답변 내용을 확인하실 수 있습니다.	</p>
					<small>※ 문의 내용 중 개인정보가 포함되었거나 중복된 문의인 경우 삭제될 수 있습니다.</small>
				</div>
				<div class="titleSection-title-btn">
					<div class="title-btn-bottom">		
						<button type="button" onclick="href-location='#'" class="writeButton btn btn-primary" >문의 작성</button>
					</div>
				</div>	
			</div>
			<table class="listTable table table-hover">
			<thead>
				<tr>
					<th >번호</th>
					<th >카테고리</th>
					<th>제목</th>
					<th >처리상태</th>
				</tr>
			</thead>				
			<tbody>
				<c:choose>
					<c:when test="">
						<tr>
							<td colspan="4">최근 문의하신 내용이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="1" end="10" step="1"> 
							<tr onclick="href.location='#'">
								<td>${11-i}</td>
								<td>카테고리</td>
								<td>${i}번째 제목</td>
								<td>처리중</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			</table>
			<nav aria-label="paing" >
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
