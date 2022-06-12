<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<div class="container">
		<div class="contents pt-5">
	 		<div class="row">
		 		<div class="col-sm-4">
	                <div class="card widget-flat">
		                <div class="card-body">
			                <div class="float-end">
			                	<i class="mdi mdi-account-multiple widget-icon"></i>
			                </div>
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">작성된 새 글</h5>
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
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">당일 문의 수</h5>
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
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">당일 신고 건수</h5>
			                <h3 class="mt-3 mb-3">36,254</h3>
			                <p class="mb-0 text-muted">
				                <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i> 5.27%</span>
				                <span class="text-nowrap">Since last month</span>  
			                </p>
		                </div> <!-- end card-body-->
	                </div> <!-- end card-->
	        	</div> <!-- end col-->
	 		</div><!-- end row -->
	 		
	 		
	 		<div class="row pt-5">
				<div class="col">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">신고 관리</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">1:1 답변</button>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<!-- 신고관리 -->
						<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							<div class="table-responsive" style="overflow-y: scroll; height: 700px;">
								<table class="table table-centered table-nowrap table-hover mb-0">
									<thead>
										<tr class="mb-3">
											<td>
												<h5 class="font-14 my-1 fw-normal">No</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">E-mail</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">Name</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">Tel</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">Role</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">Status</h5>
											</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="1" end="30" step="1" var="i">
											<tr>
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
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">USER</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">활성화</h5>
												</td>
												<td>
													<button class="btn-sm btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Details</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div> <!-- end table-responsive-->
						</div>
						<!-- 1:1문의 -->
						<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
							<div class="table-responsive" style="overflow-y: scroll; height: 700px;">
								<table class="table table-centered table-nowrap table-hover mb-0">
									<thead>
										<tr>
											<td>
												<h5 class="font-14 my-1 fw-normal">No</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">Q_No</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">Category</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">title</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">E-mail</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">reg_date</h5>
											</td>
											<td>
												<h5 class="font-14 my-1 fw-normal">Link</h5>
											</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="1" end="100" step="1" var="i">
											<tr>
												<td>
													<span class="font-14 my-1 fw-normal" style="font-size:14px;"><b>${i}</b></span>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">${i}</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">카테고리</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">문의 제목(일정 길이 이상일 경우 ...)</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">javaKim@java.com</h5>
												</td>
												<td>
													<h5 class="font-14 my-1 fw-normal" style="font-size:14px;">2022-05-05 22:05:32</h5>
												</td>
												<td>
													<button type="button" class="btn-sm btn-primary">답변하기</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div> <!-- end table-responsive-->
						</div>						
					</div>
				</div>
	 		</div>
	 	</div>
</div>

</body>
</html>			   
