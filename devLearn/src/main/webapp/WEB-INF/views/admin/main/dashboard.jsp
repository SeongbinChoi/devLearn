<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
	total();
});

function total(){
	let url = "${pageContext.request.contextPath}/admin/rev/totalSales";
	let query = "";
	const fn = function(data){
		drawTotalChart(data);
	}

	ajaxFun(url, "post", query, "json", fn);

}
function drawTotalChart(data) {
	const chartDom = document.getElementById('totalChart');
	let myChart = echarts.init(chartDom);
	let option;

	option = {
					
		xAxis: {
			type: 'category',
			data: data.monthList
		},
		yAxis: {
			type: 'value'
		},
		series: [
		    {
		      data: data.totalSales,
		      type: 'line'
		    }
		  ]
	};

	option && myChart.setOption(option);		
}


</script>


	<div class="container">
		<div class="contents pt-5">
	 		<div class="row">
		 		<div class="col-sm-4">
	                <div class="card widget-flat">
		                <div class="card-body" >
			                <div class="float-end">
			                	<i class="mdi mdi-account-multiple widget-icon"></i>
			                </div>
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">당일 총 접속자</h5>
			                <h2 class="mt-3 mb-3" style="text-align: center;" >${totalCount}</h2>
			                <p class="mb-0 text-muted">
			                &nbsp;
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
			                <h2 class="mt-3 mb-3" style="text-align: center;" >${dto.waitingLecture}</h2>
			                <p class="mb-0 text-muted">
			                	&nbsp;
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
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">당월 신규 회원</h5>
			                <h2 class="mt-3 mb-3" style="text-align: center;">${dto.monthNewMember}</h2>
			                <p class="mb-0 text-muted">
			                &nbsp;
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
			                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">동시 접속자</h5>
			                <h2 class="mt-3 mb-3"  style="text-align: center;">${currentCount}</h2>
			                <p class="mb-0 text-muted">
								&nbsp;
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
			                <h2 class="mt-3 mb-3" style="text-align: center;" >${dto.waitingQnA}</h2>
			                <p class="mb-0 text-muted">
			               		 <span class="text-nowrap">&nbsp;</span>
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
		                <h5 class="text-muted fw-normal mt-0" title="Number of Customers">당월 신규 개설 강의</h5>
		                <h2 class="mt-3 mb-3" style="text-align: center;" >${dto.monthnewLecture}</h2>
		                <p class="mb-0 text-muted">
		                &nbsp;
		                </p>
	                </div> <!-- end card-body-->
                </div> <!-- end card-->
               </div> <!-- end col-->
	 		</div><!-- end row -->
	 		
	 		<div class="row pt-3 mb-5">
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
									</div>
								</div>
							</div>
							<h5 class="card-title mb-0">매출 현황</h5>
						</div>
						<div class="card-body d-flex w-100">
							<div class="align-self-center chart chart-lg">
								<div class="chart" id="totalChart" style="width:1300px; height: 500px; margin: 0 auto;"></div>
							</div>
						</div>
					</div>
				</div>
	 		</div>
	 	</div>
	</div>
