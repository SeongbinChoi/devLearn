<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" type="text/css">

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
				                <span class ="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i> 5.27%</span>
				                <span class ="text-nowrap">Since last month</span>  
			                </p>
		                </div> <!-- end card-body-->
	                </div> <!-- end card-->
	        	</div> <!-- end col-->
	 		</div><!-- end row -->
	 		
	 		<!--  -->
	 		<!-- 나중에 지워야함 -->
	 		<button data-bs-toggle="modal" data-bs-target="#jisikModal">지식공유자</button>
	 		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>
	 		<!--  -->
	 		<!--  -->
	 		
	 		<div class="row pt-5">
				<div class="col">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="memberList-tab" data-bs-toggle="tab" data-bs-target="#memberList" type="button" role="tab" aria-controls="memberList" aria-selected="true">전체 회원</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="applyRole-tab" data-bs-toggle="tab" data-bs-target="#applyRole" type="button" role="tab" aria-controls="applyRole" aria-selected="false" onclick="showApplyList();">권한 신청</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="notify-tab" data-bs-toggle="tab" data-bs-target="#notify" type="button" role="tab" aria-controls="notify" aria-selected="false" onclick="showNotifyList();">회원 신고</button>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						
						<!-- 회원 관리 -->
						<div class="tab-pane fade show active" id="memberList" role="tabpanel" aria-labelledby="memberList-tab">
							<div class="tableTop my-2 ml-2 d-flex">
								<span>&nbsp;&nbsp;&nbsp;${memberCount}명의 회원 ${page}/${totalPage}페이지</span>
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/main';">새로고침</button>
								<form name="memberListForm"  class="ms-auto" style="display: block">
									<select name="condition">
										<option value="all" ${condition == 'all' ? "selected='selected'" : "" }>::검색조건::</option>
										<option value="memberEmail" ${condition == 'memberEmail' ? "selected='selected'" : "" }>아이디</option>
										<option value="memberName" ${condition == 'memberName' ? "selected='selected'" : "" }>이름</option>
										<option value="memberNickName" ${condition == 'memberNickName' ? "selected='selected'" : "" }>별명</option>
										<option value="regDate" ${condition == 'regDate' ? "selected='selected'" : "" }>등록일</option>
									</select>
									<input type="text" name="keyword" value="${keyword}">
									<select name= "mRole" id="mRole" onchange="changemRole();">
										<option value="">::회원등급::</option>
										<option value="10" ${mRole == 10 ? "selected='selected'" : "" }>멘토</option>
										<option value="20" ${mRole == 20 ? "selected='selected'" : "" }>강사</option>
										<option value="30" ${mRole == 30 ? "selected='selected'" : "" }>강사 &amp; 멘토</option>
									</select>
									<select name="enabled" id="enabled" onchange="changeEnabled();">
										<option value="" >::활성여부::</option>
										<option value="1" ${enabled == 1 ? "selected='selected'" : "" }>활성 계정</option>
										<option value="99" ${enabled == 99 ? "selected='selected'" : "" }>비활성 계정</option>
									</select>
									<input type="hidden" name="page" value="1">
									<button type="button" onclick="searchMember();">검색</button>
								</form>
							</div>
							<div class="table-responsive" >
								<table class="table table-centered table-nowrap table-hover mb-0">
									<thead>
										<tr class="mb-3">
											<td>
												<h5 class="font-14 my-1 fw-normal">#</h5>
											</td>
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
										
										<c:forEach var="vo" items="${list}" varStatus="status">
											<tr onclick="memberDetail('${vo.eMail}');" >
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">${memberCount - (page-1) * rows - status.index}</h5>
												</td>
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
							<div class="page-box">
								${paging}
							</div>
							
						</div>
						
						<!-- 권한 신청-->
						<div class="applyDetailModal" id="applyDetailModal"></div>
						<div class="tab-pane fade applyRoleDiv" id="applyRole" role="tabpanel" aria-labelledby="applyRole-tab">
							
						</div>
						<!-- 신고 당한 회원-->
						<div class="notifyDetailModal" id="notifyDetailModal"></div>
						<div class="tab-pane fade notifyDiv" id="notify" role="tabpanel" aria-labelledby="notify-tab">

						</div>
						
					</div>
				</div>
	 		</div>
	 	</div>
	</div>

<script type="text/javascript" >
function searchMember() {
	const f = document.memberListForm;
	
	f.action = "${pageContext.request.contextPath}/admin/memberManage/main";
	f.submit();
}


function memberDetail(eMail) { //리스트에서 tr 클릭해서 상세정보 보기
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/detail";
	let query = "eMail="+eMail;
	
	const fn = function(data) {
		$("#detailModalPlace").html(data);
		$("#exampleModal").modal("show");
		alert(":??");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function changemRole() {
	searchMember();
}

function changeEnabled() {  //전체/활성화/비활성화 셀렉트 박스 움직였을 때
	searchMember();
}


function stateDetail() {
	$("#stateDetail").dialog({
		  modal: true,
		  minHeight: 100,
		  maxHeight: 450,
		  width: 750,
		  title: '계정상태 상세',
		  close: function(event, ui) {
			   $(this).dialog("destroy"); 
		  }
	});
	console.log();
}

function updateRole() {
	const f = document.infoDetailForm;
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateRole";
	let query = $("#infoDetailForm").serialize();

	const fn = function(data) {
		//console.log(data);
		//console.log(data.eMail);
		memberDetail(data.eMail);
	}
		
	ajaxFun(url, "post", query, "json", fn);
}


function stateUpdate(){
	const f = document.stateForm;
	
	let enabled = f.enabled.value;
	let stateCode = f.stateCode.value;
	
	//console.log(enabled);
	//console.log(stateCode);
	//console.log(typeof(stateCode));
	
	if (! stateCode ) {
		f.stateCode.focus();
	} else if (enabled === '1' && stateCode !== '11') {
		alert("계정을 활성화 하는경우에는 <해제>를 선택해주세요.");
		f.stateCode.focus();
	} else if (enabled === '99' && stateCode === '11') {
		alert("계정을 비활성화 하는 경우에는 <해제>이외의 사유를 선택해주세요.");
		f.stateCode.focus();
	}
	
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateEnabled";
	let query = $("#stateForm").serialize();
	const fn = function(data) {
 		location.reload();
	}
	ajaxFun(url, "post", query, "json", fn);		
}

function showApplyList() { //권한신청 탭 클릭시 리스트 받아오기
	const f = document.applyRoleForm;
	let url = "${pageContext.request.contextPath}/admin/memberManage/applyList";
	let query = $("form[name=applyRoleForm]").serialize();
	
	const fn = function(data) {
		$(".applyRoleDiv").html(data);
	}
	ajaxFun(url, "post", query, "html", fn);		
}


function applyDetail(eMail) {
	let dlg = $("#applyDetailModal").dialog({
		  autoOpen: false,
		  modal: true,
		  height: 550,
		  width: 830,
		  buttons: {
			  " 변경하기 " : function() {
				  updateApply();
			  },
		       " 닫기 " : function() {
				$(this).dialog("close");
				showApplyList();
		       }
		  },
		  title: "지식공유자 신청 현황",
		  close: function(event, ui) {
		  }
	});
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/applyDetail";
	let query = "eMail="+eMail;
	const fn = function(data) {
		$("#applyDetailModal").html(data);
		const f = document.applyDetailForm;
		let mRole = f.mRole.value;
		let applyRole = f.applyRole.value;
		let currRole = "";
		let aftRole = "";

		switch (mRole) {
			case "1" : currRole = "회원"; break;
			case "10" : currRole = "멘토"; break;
			case "20" : currRole = "강사"; break;
		}
		switch(applyRole) {
			case "10" : aftRole = "멘토"; break;
			case "20" : aftRole = "강사"; break;
			case "30" : aftRole = "강사 & 멘토"; break;
		}
		
		$("#applyDetailSelect option").remove();
		$("#applyDetailSelect").append("<option value='"+mRole+"' selected = 'selected'>"+currRole+"</option>");
		$("#applyDetailSelect").append("<option value='"+applyRole+"'>"+aftRole+"</option>");
		dlg.dialog("open");		
		$(".ui-dialog-titlebar-close").css("display", "none");
		
	};
	ajaxFun(url, "post", query, "html", fn);
}

function updateApply() {
	const f = document.applyDetailForm;
	let mRole = f.mRole.value;
	let applyRole = f.applyRole.value;
	
	if (mRole === applyRole) {
		alert("등급을 바꿔주세요");
	}
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateApply";
	let query = $("#applyDetailForm").serialize();
	
	//alert(query);
	
	const fn = function(data) {
		showApplyList();
	}
		
	ajaxFun(url, "post", query, "json", fn);	
}

function applyRollChange() {
	showApplyList();
}

function applyStatusChange() {
	showApplyList();
}

function showNotifyList() {
	let url = "${pageContext.request.contextPath}/admin/memberManage/notifyList";
	let query = $("form[name=notifyForm]").serialize();
	
	const fn = function(data) {
		console.log(query);
		$(".notifyDiv").html(data);
	}
	
	ajaxFun(url, "post", query, "html", fn);
}

function notifyStateChange() {
	showNotifyList();
}

function notifyDetail(notifyNum) {
	let dlg = $("#notifyDetailModal").dialog({
		  autoOpen: false,
		  modal: true,
		  height: 600,
		  width: 830,
		  buttons: {
			" 글 보기 " : function() {
				let qnaUrl ="${pageContext.request.contextPath}/community/qnaList_article";
				let qnaNum = document.notifyDetailForm.qnaNum.value;
				let qnaQuery = "rows=1&page=1&qnaNum="+qnaNum;
				let fQuery = qnaUrl+"?"+qnaQuery;
				window.open(fQuery);
			},
		       " 닫기 " : function() {
				$(this).dialog("close");
				showNotifyList();
			}
		  },
		  title: "신고된 내용 상세보기",
		  close: function(event, ui) {
		  }
	});
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/notifyDetail";
	let query = "notifyNum="+notifyNum;
	const fn = function(data) {
		console.log(data);
		$("#notifyDetailModal").html(data);
		dlg.dialog("open");		
		$(".ui-dialog-titlebar-close").css("display", "none");
		
	};
	ajaxFun(url, "post", query, "html", fn);
}


</script>



<!-- 지식공유자 신청 모달 -->
	<div class="modal fade" id="jisikModal" tabindex="-1" aria-labelledby="jisikModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
				<h5 class="modal-title" id="jisikModalLabel">감사합니다, ${sessionScope.member.memberEmail}님 지식공유자가 되려면 아래정보를 입력해주세요</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">인프런 계정</label>
						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="인프런 계정을 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">비지니스 이메일</label>
						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="메일 주소를 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">이름 (실명)</label>
						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="실명을 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">연락처</label>
						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="***-****-**** 형식으로 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">희망 역할</label>
						<label for="exampleFormControlInput1" class="form-label" style="font-size: 12px;">강의를 하시고자 하시면 강사를, 조언을 하시고자 하시면 멘토를 신청해주세요</label>
						<br>
						<div class="radio">
							<div class="form-check mr-2">
								<input class="form-check-input" type="radio" name="chooseRole" id="chooseRoleBoth" value="35">
								<label class="form-check-label" for="chooseRoleInstructor">
									강사 &amp; 멘토
								</label>
							</div>
							<div class="form-check mr-2">
								<input class="form-check-input" type="radio" name="chooseRole" id="chooseRoleInstructor" value="25">
								<label class="form-check-label" for="chooseRoleInstructor">
									강사
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="chooseRole" id="chooseRoleMentor" value="15">
								<label class="form-check-label" for="chooseRoleMentor">
									멘토
								</label>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">희망분야</label>
						<label for="exampleFormControlInput1" class="form-label" style="font-size: 12px;">아직 계획중인 강의가 없으시다면 직무와 연관된 분야를 골라주세요</label>
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
						<input class="btn btn-primary" type="button" value="제출">
					</div>
				</div>
			</div>
		</div>
	</div>

 