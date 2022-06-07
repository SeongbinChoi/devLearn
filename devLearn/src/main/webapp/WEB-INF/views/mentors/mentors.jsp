<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentors.css" type="text/css">
<script type="text/javascript">

$(function(){
	$("#datetimepicker").datetimepicker({

	});
});

$(function(){
	$(".applyBtn").click(function(){
		let applyDate = $("#datetimepicker").val();
		document.getElementById('applyDate').innerHTML = "";
		document.getElementById('applyDate').innerHTML = applyDate;
	});

});

</script>

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="title row align-items-center" style="height: 200px;">
				<p><span>멘토링</span><br>업계 선배들 혹은 동료들에게서 인사이트를 얻어보세요.<br>더 빨리, 더 멀리 갈 수 있어요.</p>
			</div>
		</div>
	</div>
	<div class="container mb-5">
		<div class="contents">
			<div class="side col-2.5 px-4">
				<select class="form-select mb-3" aria-label="Default select example">
				  <option selected>:: 검색조건 ::</option>
				  <option value="1">제목</option>
				  <option value="2">닉네임</option>
				</select>
				<div class="">
					<div class="input-group mb-3 col">
					  <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
					  분야별
					</div>
					<div class="form-check ms-3 mb-2 mt-3">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					  <label class="form-check-label" for="flexCheckDefault">
					    개발
					  </label>
					</div>
					<div class="form-check ms-3 mb-2">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
					  <label class="form-check-label" for="flexCheckChecked">
					    보안
					  </label>
					</div>
					<div class="form-check ms-3 mb-2">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
					  <label class="form-check-label" for="flexCheckChecked">
					    데이터 사이언스
					  </label>
					</div>
					<div class="form-check ms-3 mb-3">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
					  <label class="form-check-label" for="flexCheckChecked">
					    기타
					  </label>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="row row-cols-1 row-cols-md-4 g-3 mb-5">
					<c:forEach var="i" begin="1" end="20">
					  <div class="col">
				    	<div class="card h-100">
							<div class="card-body my-3 mx-2">
								<div class="mentor_header">
									<div class="mentor_img mb-4">
										<figure class="figure">
											<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded img-fluid" alt="">
										</figure>
									</div>
									<button class="mentor_review px-1 py-1" data-bs-toggle="modal" data-bs-target="#mentorModal">
										<span><i class="fas fa-star"></i></span>
										<span>5.0<span>/5 〉</span></span>
									</button>
								</div>
								<p class="card-title">기업 패키지, 브랜드 디자이너 취업 관련 멘토링 (코스메틱, 장업계)</p>
								<p class="card-text">by.멘토닉네임</p>
							</div>
							<div class="card-body">
								<div class="btn-group" role="group" aria-label="Basic outlined example">
								  <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/mentor_profile.jsp'">프로필</button>
								  <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#mentorInfoModal">내용보기</button>
								</div>
							</div>
					    </div>
					  </div>
					</c:forEach>
				</div>
				
				<nav aria-label="...">
				  <ul class="pagination justify-content-center">
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
		
		
	</div>
	
		
	<!-- Review Modal -->
	<div class="modal fade" id="mentorModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">멘토링 후기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-4">
	      	<c:forEach var="i" begin="1" end="5">
				<div class="review_content mb-5">
					<p>
						<c:forEach var="s" begin="1" end="5">
							<i class="fas fa-star"></i>
						</c:forEach>
					</p>
					<p>혼자 개발하는 경우가 많아 코드를 어떻게 개선할 수 있을까 고민하다가 신청하게 되었는데 준비도 많이 해주시고 여러가지 방안을 제시해주셔서 도움이 많이 되었습니다. 실제 코드도 봐주시고 평소에 개발하면서 궁금한 부분들도 속시원하게 답변해 주셔서 좋았습니다. 앞으로도 개발하다가 고민거리가 생기면 찾아뵐것 같습니다. 이런 채널이 있다는게 감사한것 같아요. 감사합니다 !!</p>
				</div>
			</c:forEach>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- contents Modal - info -->
	<div class="modal" id="mentorInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">멘토링 소개</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-4">
			<div class="mentor_info mb-5">
				<div class="info_title bg-light text-dark fw-bold rounded shadow-sm mb-3 px-1 py-1">
	       	      기업 패키지, 브랜드 디자이너 취업 관련 멘토링 (코스메틱, 장업계)
	     	    </div>
				<p>네카라쿠배당토(중에 한 곳) 3년차 서버개발자입니다.<br><br>

					저도 처음 코딩을 시작하고 공부를 하고 취업 준비를 할 때 주변에 개발을 하는 지인이 아무도 없어 막막하고 힘들었던 시절이 있었는데요.
					<br><br><br>
					내가 지금 잘하고 있는지 잘 모르겠을 때 <br>
					개발을 하다가 질문하고 싶은 것이 있을 때<br>
					공부나 취업 준비를 하면서 고민 상담을 하고 싶을 때<br>
					포트폴리오/면접준비에 어려움이 있을 때<br>
					<br><br>
					혼자 공부하며 어려웠던 때에 꼭 언젠가 어려움을 겪으시는 분들께 도움을 드리고 싶다는 마음에 멘토링을 열게 되었습니다. 편하게 물어보시면 정해진 시간 이외에도 최선을 다해 답변 드리겠습니다.
					<br>
					주요 스킬셋은 Java, Kotlin, Spring입니다. 
				</p>
			</div>
	      </div>
	      
	      <div class="modal-footer">
	      	 <p>1회 멘토링 : 30분 / 6,600원 / 1명</p>
      	 	 <button type="button" class="btn btn-primary" data-bs-target="#applyModalToggle" data-bs-toggle="modal">신청하기</button>
          </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- contents Modal - apply -->
	<div class="modal" id="applyModalToggle" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">신청하기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-4">
			<div class="mentor_info mb-5">
				<div class="schedule">
					<label for="exampleFormControlInput1" class="form-label">날짜 및 시간 선택</label>
					<p><input type="text" class="form-control" id="datetimepicker" ></p>
				</div>
				<div class="memberEmail mt-3 mb-3">
					<label for="exampleFormControlInput1" class="form-label">연락 가능한 이메일</label>
					<input type="email" class="form-control" id="exampleFormControlInput1"  disabled="disabled" value="abcdefg@gmail.com">
				</div>

			</div>
	      </div>
	      
	      <div class="modal-footer">
	      	 <a class="btn btn-outline-primary" data-bs-toggle="modal" href="#mentorInfoModal" role="button">이전으로</a>
      	 	 <button type="button" class="btn btn-primary applyBtn" data-bs-target="#completeModalToggle" data-bs-toggle="modal">신청하기</button>
          </div>
	    </div>
	  </div>
	</div>
	
	
		<!-- contents Modal - apply -->
	<div class="modal fade" id="completeModalToggle" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">신청완료</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body check px-4">
			<div class="mentor_info">
				<table>
					<tr>
						<td>신청 날짜 및 시간 : </td>
						<td id="applyDate"> 2022-06-06 / 09:00 - 10:00</td>
					</tr>
					<tr>
						<td>연락 가능한 이메일 : </td>
						<td> &nbsp;abcdefg@gmail.com</td>
					</tr>
				</table>

			</div>
	      </div>
	      
	      <div class="modal-footer check-footer">
      	 	 <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
          </div>
	    </div>
	  </div>
	</div>

<link rel="stylesheet" type="text/css" href="jquery.datetimepicker.css" />
<script src="jquery.datetimepicker.full.min.js"></script>
