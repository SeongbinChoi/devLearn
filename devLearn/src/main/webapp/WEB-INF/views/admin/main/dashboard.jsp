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
	 		
	 		<div class="row pt-3">
		 		<div class="col-sm-4">
	                <div class="card widget-flat">
		                <div class="card-body">
			                <div class="float-end">
			                	<i class="mdi mdi-account-multiple widget-icon"></i>
			                </div>
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">신규 개설 강의</h5>
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
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">승인 대기 강의</h5>
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
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">답변 대기 문의</h5>
			                <h3 class="mt-3 mb-3">36,254</h3>
			                <p class="mb-0 text-muted">
				                <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i> 5.27%</span>
				                <span class="text-nowrap">Since last month</span>  
			                </p>
		                </div> <!-- end card-body-->
	                </div> <!-- end card-->
	        	</div> <!-- end col-->
	 		</div><!-- end row -->
	 		<div class="row pt-3">
				<div class="col">
						<div class="card flex-fill w-100">
							<div class="card-header">
								<div class="card-actions float-end">
									<div class="dropdown position-relative">
										<a href="#" data-bs-toggle="dropdown" data-bs-display="static">
				        					<i class="fas fa-align-justify" style="color:#000;"></i>
				       					</a>
										<div class="dropdown-menu dropdown-menu-end">
											<a class="dropdown-item" href="#">년간</a>
											<a class="dropdown-item" href="#">월간</a>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<h5 class="card-title mb-0">매출 현황</h5>
							</div>
							<div class="card-body d-flex w-100">
								<div class="align-self-center chart chart-lg">
									<canvas id="chartjs-dashboard-bar"></canvas>
							</div>
						</div>
					</div>
				</div>
	 		</div>
	 	</div>
</div>
