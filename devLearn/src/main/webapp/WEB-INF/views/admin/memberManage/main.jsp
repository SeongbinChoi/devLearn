<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" type="text/css">

<div id="detailModal" style="display: none;"></div>
	<div class="container">
		<div class="contents pt-5">
	 		<div class="row">
		 		<div class="col-sm-4">
	                <div class="card widget-flat">
		                <div class="card-body">
			                <div class="float-end">
			                	<i class="mdi mdi-account-multiple widget-icon"></i>
			                </div>
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">당일 총 접속자</h5>
			                <h3 class="mt-3 mb-3">36,254</h3>
			                <p class="mb-0 text-muted">
				                <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i> 5.27%</span>
				                <span class="text-nowrap">Since last month</span>  
			                </p>
		                </div> <!-- end card-body-->
	                </div> <!-- end card-->
	               </div> <!-- end col-->
	               
	               <div class="col-sm-4">
	                <div class="card widget-flat">
		                <div class="card-body">
			                <div class="float-end">
			                	<i class="mdi mdi-account-multiple widget-icon"></i>
			                </div>
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">동시 접속자</h5>
			                <h3 class="mt-3 mb-3">36,254</h3>
			                <p class="mb-0 text-muted">
				                <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i> 5.27%</span>
				                <span class="text-nowrap">Since last month</span>  
			                </p>
		                </div> <!-- end card-body-->
	                </div> <!-- end card-->
	               </div> <!-- end col-->
	               
	               <div class="col-sm-4">
	                <div class="card widget-flat">
		                <div class="card-body">
			                <div class="float-end">
			                	<i class="mdi mdi-account-multiple widget-icon"></i>
			                </div>
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">신규 유입 회원(month)</h5>
			                <h3 class="mt-3 mb-3">36,254</h3>
			                <p class="mb-0 text-muted">
				                <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i> 5.27%</span>
				                <span class="text-nowrap">Since last month</span>  
			                </p>
		                </div> <!-- end card-body-->
	                </div> <!-- end card-->
	        	</div> <!-- end col-->
	 		</div><!-- end row -->
	 		
	 		<!--  -->
	 		<!-- 나중에 지워야함 -->
	 		<button data-bs-toggle="modal" data-bs-target="#jisikModal">지식공유자</button>
	 		<!--  -->
	 		<!--  -->
	 		
	 		<div class="row pt-5">
				<div class="col">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="memberList-tab" data-bs-toggle="tab" data-bs-target="#memberList" type="button" role="tab" aria-controls="memberList" aria-selected="true" onclick="aaaa();">전체 회원</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="applyRole-tab" data-bs-toggle="tab" data-bs-target="#applyRole" type="button" role="tab" aria-controls="applyRole" aria-selected="false">권한 신청</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="notify-tab" data-bs-toggle="tab" data-bs-target="#notify" type="button" role="tab" aria-controls="notify" aria-selected="false">회원 신고</button>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						
						<!-- 회원 관리 -->
						<div class="tab-pane fade show active" id="memberList" role="tabpanel" aria-labelledby="memberList-tab">
							<div class="tableTop my-2 ml-2 d-flex">
								<span>${memberCount}개 (1/1)</span>
								<form name="memberListForm"  class="ms-auto" style="display: block">
									<select name="enabled" id="enabled" onchange="changeEnabled();">
										<option value="" >전체</option>
										<option value="1" ${enabled == 1 ? "selected='selected'" : "" }>활성 계정</option>
										<option value="99" ${enabled == 99 ? "selected='selected'" : "" }>비활성 계정</option>
									</select>
								</form>
							</div>
							<div class="table-responsive" style="overflow-y: scroll; height: 700px;">
								<table class="table table-centered table-nowrap table-hover mb-0">
									<thead>
										<tr class="mb-3">
											<td>
												<h5 class="font-14 my-1 fw-normal">메일</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">이름</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">전화번호</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">회원 등급</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">활성여부</h5>
											</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="vo" items="${list}">
											<tr onclick="memberDetail('${vo.eMail}');" >
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">${vo.eMail}</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">${vo.name}</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">${vo.phoneNum}</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">
														<c:choose>
															<c:when test="${vo.mRole == 1}">
																회원
															</c:when>
															<c:when test="${vo.mRole == 10}">
																멘토
															</c:when>
															<c:when test="${vo.mRole == 20}">
																강사
															</c:when>
															<c:when test="${vo.mRole == 30}">
																 멘토 &amp; 강사
															</c:when>
															<c:otherwise>
																관리자
															</c:otherwise>
														</c:choose>
													</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">
														<c:choose>
															<c:when test="${vo.enabled == 1 }">
																활성계정
															</c:when>
															<c:otherwise>
																비활성 계정
															</c:otherwise>
														</c:choose>						
													</h5>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div> <!-- end table-responsive-->
						</div>
						<!-- 권한 신청-->
						<div class="tab-pane fade" id="applyRole" role="tabpanel" aria-labelledby="applyRole-tab">
							<div class="tableTop my-2 ml-2 d-flex">
								<span>4개 (1/4)</span>
								<form name="applyRoleForm"  class="ms-auto" style="display: block">
									<select >
										<option value="">전체</option>
										<option value="">처리중</option>
										<option value="">처리완료</option>
									</select>
								</form>
							</div>							
							<div class="table-responsive">
								<table class="table table-centered table-nowrap table-hover mb-0">
									<thead>
										<tr>
											<td>
												<h5 class="font-14 my-1 fw-normal">#</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">회원 메일</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">이름</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">전화번호</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">신청한 등급</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">상태</h5>
											</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="1" end="10" step="1" var="i">
											<tr  onclick="href.location=''" data-bs-toggle="modal" data-bs-target="#applyRoleModal"> 
												<td>
													<span class="font-14 my-1 fw-normal" style="font-size:14px;"><b>${i}</b></span>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">ASOS@gmail.com</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">김자바</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">010-1234-1234</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">멘토</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">처리중</h5>
												</td>
												<td>
													<button type="button" class="btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#applyInfoModal">자세히</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div> <!-- end table 권한-->
						</div>
						<!-- 신고 당한 회원-->
						<div class="tab-pane fade" id="notify" role="tabpanel" aria-labelledby="contact-tab">
							<div class="tableTop my-2 ml-2 d-flex">
								<span>4개 (1/4)</span>
								<form name="notifyForm"  class="ms-auto" style="display: block">
									<select >
										<option value="">전체</option>
										<option value="">처리중</option>
										<option value="">처리완료</option>
									</select>
								</form>
							</div>		
							<div class="table-responsive">
								<table class="table table-centered table-nowrap table-hover mb-0">
									<thead>
										<tr class="mb-3">
											<td>
												<h5 class="font-14 my-1 fw-normal">#</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">신고한 회원</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">신고 사유</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">신고글 제목</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">작성자</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">처리상태</h5>
											</td>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="1" end="30" step="1" var="i">
											<tr onclick="href.location=''" data-bs-toggle="modal" data-bs-target="#notifyModal">
												<td>
													<span class="font-14 my-1 fw-normal" style="font-size:14px;"><b>${i}</b></span>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">김자바</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">욕설 사용</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">쉬바~~~~~어쩌구~~~</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">김욕설</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">처리중</h5>
												</td>
												<td>
													<button type="button" class="btn-sm btn-primary" onclick="href.location='#'">자세히</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div> <!-- end table 신고-->
						</div>
						
					</div>
				</div>
	 		</div>
	 	</div>
	</div>

<!-- 회원 상세 Modal -->
<div class="modal fade" id="memberInfo" tabindex="-1" aria-labelledby="memberInfoLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
	<form name="memberDetailForm" method="post" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="memberInfoLabel">회원 상세 정보</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<table class="table td-border my-10" style="border: 1px border-collpase;">
	      		<tr>
	      			<td style="width:15%;">E-mail</td>
	      			<td style="width:35%;">javaKim@naver.com</td>
	      			<td style="width:15%;">이름</td>
	      			<td style="width:35%;">김자바</td>
	      		</tr>
	      		<tr>
	      			<td style="width:15%;">비지니스 메일</td>
	      			<td style="width:35%;">javaKim@kakao.com</td>
	      			<td style="width:15%;">전화번호</td>
	      			<td style="width:35%;">010-1234-5544</td>
	      		</tr>
				<tr>
	      			<td style="width:15%;">가입일</td>
	      			<td style="width:35%;">2022-05-05 12:10:06</td>
	      			<td style="width:15%;">마지막 로그인</td>
	      			<td style="width:35%;">2022-05-25 22:30:06</td>
				</tr>
				<tr>
	      			<td style="width:15%;">마지막 로그인</td>
	      			<td style="width:35%;">2022-05-25 22:30:06</td>
	      			<td style="width:15%;">광고 수신 여부</td>
	      			<td style="width:35%;">동의 / 미동의</td>
				</tr>
	      		<tr>
	      			<td style="width:15%;">회원 등급</td>
	      			<td >
	      				<select style="width: 100%;">
	      					<option>회원</option>
	      					<option>멘토</option>
	      					<option>강사</option>
	      					<option>관리자</option>
	      				</select>
	      			</td>
	      			<td>로그인 가능 여부</td>
	      			<td>
	      				<select>
	      					<option value="0">가능</option>
	      					<option value="1">불가능</option>
	      				</select>
	      			</td>
      			</tr>
      		</table>
   			<table class="table td-border my-10" style="border: 1px border-collpase;">
      			<tr>
	      			<td style="width: 15%;">상태</td>
	      			<td >
	      				<select name="stateCode" style="width: 100%;" >
	      					<option value=""> :: 상태 :: </option>
	      					<option value="1">불법적인 방법으로 로그인</option>
	      					<option value="2">불건전 게시물 등록</option>
	      					<option value="3">다른 유저 비방</option>
	      					<option value="4">타 계정 도용</option>
	      					<option value="5">기타 약관 위반</option>
	      					<option value="6">1년 이상 로그인 하지 않음</option>
	      					<option value="9">패스워드 6회 이상 실패</option>
	      					<option value="0">해제</option>
	      					<option value="10">퇴사</option>      					
	      				</select>
	      			</td>
	      			<td style="width: 20%">
		      			<button type="button" class="btn btn-primary" style="width: 100%;">자세히</button>
	      			</td>
	      		</tr>
				<tr>
					<td>메모</td>
					<td colspan="2">
						<input type="text" name="stateMemo" style="width: 100%;">						
					</td>
				</tr>	      			
	      	</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="href.location='changeMemberState();'">저장하기</button>
	      </div>
	    </div>
    </form>
  </div>
</div>

<!-- 등급신청 Modal -->
<div class="modal fade" id="applyInfoModal" tabindex="-1" aria-labelledby="applyInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="applyInfoModalLabel">회원 상세 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<table class="table td-border my-10" style="border: 1px border-collpase;">
      		<tr>
      			<td style="width:15%;">이름</td>
      			<td style="width:35%;">김자바</td>
      			<td style="width:15%;">비지니스 메일</td>
      			<td style="width:35%;">javaKim@gmail.com</td>
      		</tr>
      		<tr>
      			<td>신청 등급</td>
      			<td>멘토</td>
      			<td>카테고리</td>
      			<td>백엔드 프론트엔드 풀스택</td>
      		</tr>
      		<tr>
      			<td style="width:15%;">가입일</td>
      			<td style="width:35%;">2022-05-05 12:10:06</td>
      			<td style="width:15%;">마지막 로그인</td>
      			<td style="width:35%;">2022-05-25 22:30:06</td>
      		</tr>
      		<tr>
      			<td style="width:15%;">상태</td>
      			<td style="width:35%;">비활성화</td>
      			<td style="width:15%;">광고 수신 여부</td>
      			<td style="width:35%;">2022-05-25 22:30:06 동의 / 미동의</td>
      		</tr>
      		<tr>
      			<td style="width:15%;">상태 메모</td>
      			<td style="width:35%;" colspan="2">패스워드 5회 오류로 인한 정지</td>
      			<td><button type="button" class="btn btn-sm btn-primary" onclick="showDetail();">상세보기</button></td>
      		</tr>
      	</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div><!-- 멘토신청 modal end -->

<!-- 멘토신청 Modal -->
<div class="modal fade" id="nofifyModal" tabindex="-1" aria-labelledby="nofifyModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<form>+-+-
			<div class="modal-content">
				<div class="modal-header">
				<h5 class="modal-title" id="nofifyModalLabel">회원 상세 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table td-border my-10" style="border: 1px border-collpase;">
						<tr>
							<td style="width:15%;">회원번호</td>
							<td style="width:35%;">123123</td>
							<td style="width:15%;">Email</td>
							<td style="width:35%;">javaKim@naver.com</td>
						</tr>
						<tr>
							<td style="width:15%;">이름</td>
							<td style="width:35%;">김자바</td>
							<td style="width:15%;">회원 등급</td>
							<td style="width:35%;">회원/멘토/강사</td>
						</tr>
						<tr>
							<td style="width:15%;">가입일</td>
							<td style="width:35%;">2022-05-05 12:10:06</td>
							<td style="width:15%;">마지막 로그인</td>
							<td style="width:35%;">2022-05-25 22:30:06</td>
						</tr>
						<tr>
							<td style="width:15%;">상태</td>
							<td style="width:35%;">비활성화</td>
							<td style="width:15%;">메일 수신 여부</td>
							<td style="width:35%;">동의 / 미동의</td>
						</tr>
						<tr>
							<td style="width:15%;">상태</td>
						<td>
							<select>
								<option>:: 상태 ::</option>
								<option value="1">욕설 사용</option>
								<option value="2">스팸 계정</option>
								<option value="2">불법적인 방법으로 로그인</option>
								<option value="5">타 계정 도용</option>
								<option value="6">기타 규정 위반</option>
								<option value="0">정지 해제</option>
							</select>
						</td>
							<td style="width:35%;" colspan="2">패스워드 5회 오류로 인한 정지</td>
							<td><button type="button" class="btn btn-sm btn-primary" onclick="showDetail();">상세보기</button></td>
						</tr>
					</table>
				</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
			</div>
			</div>
		</form>
	</div>
</div><!-- 신고 modal -->




<!-- 지식공유자 신청 모달 -->
	<div class="modal fade" id="jisikModal" tabindex="-1" aria-labelledby="jisikModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
				<h5 class="modal-title" id="jisikModalLabel">감사합니다, abc1234님 지식공유자가 되려면 아래정보를 입력해주세요</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">인프런 계정</label>
						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="인프런 계정을 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">연락받을 이메일</label>
						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="자주 사용하는 이메일을 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">이름 (실명)</label>
						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="실명을 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">연락처</label>
						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="000-0000-0000">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">희망 역할</label>
						<label for="exampleFormControlInput1" class="form-label" style="font-size: 12px;">강의를 하시고자 하시면 강사를, 조언을 하시고자 하시면 멘토를 신청해주세요</label>
						<br>
						<div class="radio">
							<div class="form-check mr-2">
								<input class="form-check-input" type="radio" name="chooseRole" id="chooseRoleBoth">
								<label class="form-check-label" for="chooseRoleInstructor">
									강사 &amp; 멘토
								</label>
							</div>
							<div class="form-check mr-2">
								<input class="form-check-input" type="radio" name="chooseRole" id="chooseRoleInstructor">
								<label class="form-check-label" for="chooseRoleInstructor">
									강사
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="chooseRole" id="chooseRoleMentor">
								<label class="form-check-label" for="chooseRoleMentor">
									멘토
								</label>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">희망분야</label>
						<label for="exampleFormControlInput1" class="form-label" style="font-size: 12px;">아직 계획중인 강의가 없으시다면 지식공유자의 직무와 연관된 분야를 골라주세요</label>
						<br>
						<input class="btn btn-primary" type="button" value="개발 · 프로그래밍">
						<input class="btn btn-primary" type="button" value="보안 · 네트워크">
						<input class="btn btn-primary" type="button" value="데이터 사이언스">
						<input class="btn btn-primary" type="button" value="크리에이티브">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">나를 소개하는 글</label>
						<label for="exampleFormControlInput1" class="form-label" style="font-size: 12px;">지식공유자님에 대한 소개와, 제작할 강의에 관련된 내용을 적어주세요.</label>     
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="" style="height: 250px;"></textarea>
					</div>
					<div class="mb-3">
						<input class="btn btn-primary" type="submit" value="제출">
					</div>
				</div>
			</div>
		</div>
	</div>

 