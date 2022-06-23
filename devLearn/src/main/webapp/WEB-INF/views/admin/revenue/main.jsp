<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>

<script type="text/javascript">
$(function(){
	total();
	totalDonut();
	lecture();
	lectureDonut();
	mentor();
	mentorDonut();
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


function totalDonut(){
	
	let url = "${pageContext.request.contextPath}/admin/rev/totalCategories";
	let query = "";
	
	const fn = function(data){
		totalCategoryDonut(data);
	}
	
	ajaxFun(url, "post", query, "json", fn);
	
}
function totalCategoryDonut(data){
	const chartDom = document.getElementById('totalDonut');
	let myChart = echarts.init(chartDom);
	let option;
	var arr = [];
	for(var i=0; i<data.categories.length; i++){
		var obj = {name:data.categories[i], value:data.resultList[i]};
		arr.push(obj);
		
	}
	option = {
	  title: {
	    text: '강의 카테고리별 매출 비율',
	    subtext: data.stdMonth,
	    left: 'center'
	  },
	  tooltip: {
	    trigger: 'item'
	  },
	  legend: {
	    orient: 'vertical',
	    left: 'left'
	  },
	  series: [
	    {
	      name: 'Access From',
	      type: 'pie',
	      radius: '50%',
	      data: arr,
	      emphasis: {
	        itemStyle: {
	          shadowBlur: 10,
	          shadowOffsetX: 0,
	          shadowColor: 'rgba(0, 0, 0, 0.5)'
	        }
	      }
	    }
	  ]
	};

	option && myChart.setOption(option);

}


function lecture(){
		let url = "${pageContext.request.contextPath}/admin/rev/lectureSales";
		let query = "";
		const fn = function(data){
			drawLecutureChart(data);
		}
	
		ajaxFun(url, "post", query, "json", fn);
	
}

function drawLecutureChart(data){
	const chartDom = document.getElementById('lecutreChart');
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
		      data: data.yearlyLectureSalesList,
		      type: 'line'
		    }
		  ]
	};

	option && myChart.setOption(option);		

}


function lectureDonut(){
	
	let url = "${pageContext.request.contextPath}/admin/rev/lectureCategories";
	let query = "";
	
	const fn = function(data){
		lectureCategoryDonut(data);
	
	}
	
	ajaxFun(url, "post", query, "json", fn);
	
}
function lectureCategoryDonut(data){
	const chartDom = document.getElementById('lectureDonut');
	let myChart = echarts.init(chartDom);
	let option;
	var arr = [];
	for(var i=0; i<data.categories.length; i++){
		var obj = {name:data.categories[i], value:data.list[i]};
		arr.push(obj);
		
	}
	option = {
	  title: {
	    text: '강의 카테고리별 매출 비율',
	    subtext: data.stdMonth,
	    left: 'center'
	  },
	  tooltip: {
	    trigger: 'item'
	  },
	  legend: {
	    orient: 'vertical',
	    left: 'left'
	  },
	  series: [
	    {
	      name: 'Access From',
	      type: 'pie',
	      radius: '50%',
	      data: arr,
	      emphasis: {
	        itemStyle: {
	          shadowBlur: 10,
	          shadowOffsetX: 0,
	          shadowColor: 'rgba(0, 0, 0, 0.5)'
	        }
	      }
	    }
	  ]
	};

	option && myChart.setOption(option);

}


function mentor(){
	let url = "${pageContext.request.contextPath}/admin/rev/mentorSales";
	let query = "";
	
	const fn = function(data){
		drawMentorChart(data);
	}
	
	ajaxFun(url, "post", query, "json", fn);
	
}
function drawMentorChart(data){
	const chartDom = document.getElementById('mentorChart');
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
		      data: data.yearlyMentorSalesList,
		      type: 'line'
		    }
		  ]
	};

	option && myChart.setOption(option);		

}

function mentorDonut(){
	let url = "${pageContext.request.contextPath}/admin/rev/mentorCategories";
	let query = "";
	
	const fn = function(data){
		mentorCategoryDonut(data);
		//console.log(data.resultData);
	}
	
	ajaxFun(url, "post", query, "json", fn);
	
}

function mentorCategoryDonut(data){
	const chartDom = document.getElementById('mentorDonut');
	let myChart = echarts.init(chartDom);
	let option;
	
	var arr = [];
	for(var i=0; i<data.categories.length; i++){
		var obj = {name:data.categories[i], value:data.list[i]};
		arr.push(obj);
		
	}
	
	console.log("--------------");
	console.log(arr);
	

	option = {
	  title: {
	    text: '멘토 카테고리별 매출 비율',
	    subtext: data.stdMonth,
	    left: 'center'
	  },
	  tooltip: {
	    trigger: 'item'
	  },
	  legend: {
	    orient: 'vertical',
	    left: 'left'
	  },
	  series: [
	    {
	      name: 'Access From',
	      type: 'pie',
	      radius: '50%',
	      data: arr,
	      emphasis: {
	        itemStyle: {
	          shadowBlur: 10,
	          shadowOffsetX: 0,
	          shadowColor: 'rgba(0, 0, 0, 0.5)'
	        }
	      }
	    }
	  ]
	};

	option && myChart.setOption(option);
}

</script>
<div class="container">
	<div class="contents pt-5">
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
								</div>
							</div>
						</div>
						<h5 class="card-title mb-0">전체 현황</h5>
					</div>
					<div class="card-body d-flex w-100">
						<div class="align-self-center chart chart-lg d-flex">
							<div class="chart-line-tot" id="totalChart" style="width:700px; height: 500px;">매출 - 선그래프</div>
							
							<div class="chart-donut" id="totalDonut" style="width:500px; height: 500px;">매출- 카테고리별 비율</div>
						</div>
					</div>
				</div>
			</div>
 		</div>
 		
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
								</div>
							</div>
						</div>
						<h5 class="card-title mb-0">강의 매출 현황</h5>
					</div>
					<div class="card-body d-flex w-100">
						<div class="align-self-center chart chart-lg d-flex">
							<div class="chart" id="lecutreChart" style="width:700px; height: 500px; ">매출 - 선그래프</div>
							
							<div class="chart-donut" id="lectureDonut" style="width:500px; height: 500px;">매출- 카테고리별 비율</div>
						</div>
					</div>
				</div>
			</div>
 		</div>
 		
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
								</div>
							</div>
						</div>
						<h5 class="card-title mb-0">멘토 매출 현황</h5>
					</div>
					<div class="card-body d-flex w-100">
						<div class="align-self-center chart chart-lg d-flex">
							<div class="chart" id="mentorChart" style="width:700px; height: 500px;">매출 - 선그래프</div>
							
							<div class="chart-donut" id="mentorDonut" style="width:500px; height: 500px;">매출- 카테고리별 비율</div>
						</div>
					</div>
				</div>
			</div>
 		</div>
	</div>
</div>