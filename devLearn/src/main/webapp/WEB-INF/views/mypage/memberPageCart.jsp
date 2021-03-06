<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style type="text/css">
.container {
	gap: 15px;
}

.list-section {
}

.deletebtn{
	position: absolute;
	right: 0;
}

.cart-head {
	width: 100%;
	height: 50px;
	margin-right: 15px;
	position: relative;
	border-bottom: 1px solid #ddd;
}

.cart-content {
	overflow-y:scroll; height:600px;
}

.cart-card {
	padding: 16px 0;
}

.cart-img img {
	width: 120px;
	height: 80px;
}

.cart-course-title {
	margin-left: 15px;
	padding: 4px 16px 16px;
}

.cart-course-title p {
	font-weight: 800;
	font-size: 16px;
	margin: 0;
}

.cart-course-title span:first-of-type {
	font-size: 14px;
	color: #555;
}

.cart-course-title span:last-of-type {
	font-size: 14px;
	font-weight: 600;	
	color: #0d6efd;
}

.closeBtnSection {
	padding: 4px 16px 16px;
	border-right: 1px solid #ddd;
	
}

.priceSection {
	width: 150px;
}

.priceSection {
	text-align: right;
}

.dcPercent {
	color: #F00;
	font-weight: 700;
	font-size: 14px;
}

.originalPrice {
	color: #ddd;
	text-decoration: line-through;
	font-size: 14px;
}

.finalPrice {
	font-weight: 900;
	font-size: 16px;
}

.pay-section:not(.term) {
	width: 300px;
	font-size: 14px;
	font-weight: 700;
}

.buyer{
	width: 100%;
	padding: 16px 16px;
	border-bottom: 1px solid #ddd;
	border-radius: 5px;
}

.buyer-info-title {
	position: relative;
	border-bottom: 1px solid #ddd;
	padding-bottom: 8px;
	margin-bottom: 12px;
}

.info-edit-btn {
	position: absolute;
	right: 0;
	border: none;
	text-decoration: underline;
	background: none;
}

.info-table td:first-child {
	color: #bbb;
	padding-right: 5px;
}

.info-table td:lsat-child {
	color: #777;
	padding-right: 5px;
	background: red;
}

.payment {
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 16px 16px;
	margin-top: 5px;
} 

.coupon , .point {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;

}

.right span:nth-of-type(2) {
	color: #0d6efd;
}	

.iptBtn {
	width:100%;
	margin: 5px 0;
	display: flex;
	justify-content: space-between;
	gap: 5px;
	
}
	
.iptBtn input {
	height: 40px;
	padding: 0 12px;
	
}

.iptBtn button {
	height: 40px;
	border: 1px solid #ddd;
	padding: 0 12px;
	background: #fff;
	font-weight: 700;
	border-radius: 5px;
	width: 82px;
}

.confirmbtn {
	width: 100%;
	margin-top: 15px;
}

.amount-table {
	width: 100%;
	margin-top: 15px;
}
.amount-table td:last-child {
	text-align: right;
	padding: 2px 0;

}


.blue {
	color: #0d6efd;
	font-weight: bold;
}

</style>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		},
	});
}

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('cartCheck');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  });
}


$(function(){
	$("input:checkbox").on('click', function() {
		let chk_val = [];
		$('.cart-content input:checkbox[name=cartCheck]:checked').each(function(i, iVal){
			chk_val.push(iVal.value);
		});
		
		if(chk_val.length == 0){
			chk_val.push(0);
		}
		
		let url = "${pageContext.request.contextPath}/mypage/cart/result";
		let query = {
				lectureNum : chk_val
		};
		
		var fn = function(data){
			console.log(data);
			$(".totalPrice").html(data.dto.totalPrice);
			$(".totalDc").html("-"+data.dto.totalDiscount);
			$(".totalResult").html(data.dto.totalPrice - data.dto.totalDiscount -3000);
		};

		ajaxFun(url, "get", query, "json", fn);
	});
});




$(function() {
	$('.deletebtn').click(function() {
		let chk_val = [];
		$('.cart-content input:checkbox[name=cartCheck]:checked').each(function(i, iVal){
			chk_val.push(iVal.value);
		});
		
		if(chk_val.length == 0){
			alert('????????? ????????? ???????????????');
			return false;
		}
		
		if(!confirm('????????? ????????? ?????????????????????????')){
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/mypage/cart/delete";
		let query = {
				lectureNum : chk_val
		};
		
		var fn = function(data){
			location.href = "${pageContext.request.contextPath}/mypage/cart";
		};

		ajaxFun(url, "get", query, "json", fn);
	});
});



// ??????
$(function() {
	$("#iamportPayment").click(function() {
		let chk_val = [];
		$('.cart-content input:checkbox[name=cartCheck]:checked').each(function(i, iVal){
			chk_val.push(iVal.value);
		});
		
		if(chk_val.length == 0){
			chk_val.push(0);
		}
		
		
		let url = "${pageContext.request.contextPath}/mypage/cart/result";
		let query = {
				lectureNum : chk_val
		};
		
		for(let i=0; i<$('.priceSection').length; i++){
			for(let j=0; j<chk_val.length; j++){
				if( $('#sectionId'+i).attr("data-num") == chk_val[j] ){
					let lectureNum = $('#sectionId'+i).attr("data-num");
					$('#sectionId'+i).append('<input type="hidden" class="h-email" name="memberEmails" value="${sessionScope.member.memberEmail}">');
					$('#sectionId'+i).append('<input type="hidden" class="h-totalPay" name="totalPays" value="">');
					$('#sectionId'+i).append('<input type="hidden" class="h-totalDiscount" name="totalDiscounts" value="">');
					$('#sectionId'+i).append('<input type="hidden" class="h-paymentCode" name="paymentCodes" value="">');
					$('#sectionId'+i).append('<input type="hidden" class="h-payState" name="payStates" value="">');
					$('#sectionId'+i).append('<input type="hidden" class="h-approveNum" name="approveNums" value="">');
					$('#sectionId'+i).append('<input type="hidden" class="h-lectureNum" name="lectureNums" value="'+lectureNum+'">');
					$('#sectionId'+i).append('<input type="hidden" class="h-lecturePay" name="lecturePays" value="">');
					$('#sectionId'+i).append('<input type="hidden" class="h-discount" name="discounts" value="">');
					$('#sectionId'+i).append('<input type="hidden" class="h-lectureEdate" name="lectureEdates" value="">');
					
					let chkPrice = $("#cart-price"+chk_val[i]).text().replace("???", "");
					let chkDc = $("#cart-dc"+chk_val[i]).text().replace("%", "");
					let chkEdate = $("#cart-duration"+chk_val[i]).text();
					chkEdate = chkEdate.replace("???", "");
					if(chkEdate == '?????????'){
						chkEdate = "9999-12-31";
					} else {
						const eDate = getFormatDate(new Date());
						chkEdate = eDate;
					}
					
					$('#sectionId'+i +' .h-lecturePay').val(chkPrice);
					$('#sectionId'+i +' .h-discount').val(chkDc);
					$('#sectionId'+i +' .h-lectureEdate').val(chkEdate);
					
				}
			}
		}
		
		var fn = function(data){
			requestPay(data);
		};

		ajaxFun(url, "get", query, "json", fn);
	});
});

function getFormatDate(date){
	var year = date.getFullYear();
	var month = (1 + date.getMonth());
	month = month >= 10 ? month : '0' + month;
	var day = date.getDate();
	day = day >= 10 ? day : '0' + day;
	
	return year + '-' + month + '-' + day;
}

function removeData(data){
	$(data).remove();
}
	
//?????? ???????????? ????????????
var IMP = window.IMP;
IMP.init("imp82635895");

function requestPay(data) {
	console.log(data);
	let chk_val = [];
	$('.cart-content input:checkbox[name=cartCheck]:checked').each(function(i, iVal){
		chk_val.push(iVal.value);
		
	});
	

	
	let chkNum = chk_val.length;  // ???????????? ??????
	let chkSubject = $("#cart-subject"+chk_val[0]).text().trim();  // ???????????? ????????? ??????

	IMP.request_pay (
		{ // param
			pg: "kakaopay.TC0ONETIME", //pg??????.CID
			pay_method: "card",
			merchant_uid: "lecture-" + new Date().getTime(), // ???????????? ??????
			name: chkSubject + "??? " + (chkNum-1) + "???",
			amount: data.dto.totalPrice - data.dto.totalDiscount,
			buyer_email: "${sessionScope.member.memberEmail}",
			buyer_name: "${sessionScope.member.memberName}",
		},
		function (rsp) { // callback
			console.log(rsp);
			if (rsp.success) {
				let url = "${pageContext.request.contextPath}/mypage/sugang";
				let memberEmail = rsp.buyer_email;
				let totalPay = rsp.paid_amount;
				let totalDiscount = data.dto.totalDiscount;
				let paymentCode = rsp.merchant_uid;
				
				/*
				for(let i=0; i<chkNum; i++){
					let chkPrice = $("#cart-price"+chk_val[i]).text().replace("???", "");
					let chkDc = $("#cart-dc"+chk_val[i]).text().replace("%", "");
					let chkEdate = $("#cart-duration"+chk_val[i]).text();
					chkEdate = chkEdate.replace("???", "");
					if(chkEdate == '?????????'){
						chkEdate = "9999-12-31";
					} else {
						const eDate = getFormatDate(new Date());
						chkEdate = eDate;
					}
				}
				*/
				
				
				$('.h-totalPay').val(totalPay);
				$('.h-totalDiscount').val(totalDiscount);
				$('.h-paymentCode').val(paymentCode);
				$('.h-payState').val(rsp.pay_method);
				$('.h-approveNum').val(rsp.pg_tid);
				/*
				$('.h-lecturePay').val(chkPrice);
				$('.h-discount').val(chkDc);
				$('.h-lectureEdate').val(chkEdate);
				*/
				
				let query = $('#purchaseForm').serialize();
				
				console.log(query);
				
				/*
				let param = [];
				for(let i=0; i<chkNum; i++){
					let chkPrice = $("#cart-price"+chk_val[i]).text().replace("???", "");
					let chkDc = $("#cart-dc"+chk_val[i]).text().replace("%", "");
					let chkEdate = $("#cart-duration"+chk_val[i]).text().trim();
					if(chkEdate == '?????????'){
						chkEdate = "9999-12-31";
					}
					
					var??data??=??{??????????????????????
						memberEmail??:??memberEmail,
						totalPay??:??totalPay,
						totalDiscount??:??totalDiscount,
						paymentCode??:??paymentCode,
						payState??:??rsp.pay_method,
						approveNum??:??rsp.pg_tid,
						lectureNum??:??chk_val[i],
						lecturePay??:??chkPrice,??
						discount??:??chkDc,
						lectureEdate??:??chkEdate????????????
					};??????????????
					param.push(data);
				}
				console.log(param);
				
				var??jsonData??=??JSON.stringify(param);????????
				jQuery.ajaxSettings.traditional??=??true;
				
				let query = {
						jsonData : jsonData
				};	
				console.log(jsonData);
				*/
				
				/*
				let query = "memberEmail=" + memberEmail + "&totalPay=" + totalPay;
					query += "&totalDiscount=" + totalDiscount + "&paymentCode=" + paymentCode;
					query += "&payState=" + rsp.pay_method + "&approveNum=" + rsp.pg_tid;	
					query += "&lectureNum=" + chk_val[0] + "&lecturePay=" + chkPrice;
					query += "&discount=" + chkDc + "&lectureEdate=" + chkEdate;
					console.log(query);
				*/
					
				const fn = function(data) {
					window.location.href="${pageContext.request.contextPath}/mypage/cart";
				};			
				ajaxFun(url, "post", query, "json", fn);
			} else {
				alert("?????? : ??????(" + rsp.error_code + ") / ?????????(" + rsp.error_msg + " :: ?????? ??????..)");
			}
		}
	);
};



</script>


<div class="container d-flex mt-5">
	<div class="list-section flex-fill mx-3">
		<h3 style="font-weight: 800;">???????????????</h3>
		<div class="cart-head d-flex align-items-center justify-content-baseline">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="cartCheck" value="selectall" id="flexCheckDefault" onclick='selectAll(this)'>
				<span>????????????</span>
			</div>
			<button type="button" class="btn btn-primary deletebtn">?????? ?????? <i class="fa-solid fa-xmark"></i></button>
		</div>
		<div class="cart-content" >
			<form name="purchaseForm" id="purchaseForm">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="cart-card d-flex px-3">
						<div class="form-check">
							<input class="form-check-input" name="cartCheck" type="checkbox" value="${dto.lectureNum}" id="flexCheckDefault">
						</div>
						<div class="cart-img">
							<img src="${pageContext.request.contextPath}/uploads/thumbNail/${dto.thumbnail}" >
						</div>
						<div class="cart-course-title flex-fill">
							<p id="cart-subject${dto.lectureNum}">${dto.lectureSubject}</p>
							<span>${dto.memberNickname}&nbsp;&nbsp;|&nbsp;&nbsp;</span><span class="blue">?????? ?????? : ?????? ??? </span><span id="cart-duration${dto.lectureNum}">${dto.lectureDuration == 0 || dto.lectureDuration == null ? "?????????" : dto.lectureDuration}<c:if test="${dto.lectureDuration != 0 && dto.lectureDuration != null}">???</c:if></span>				
						</div>
						<div class="closeBtnSection">
							<i class="fa-solid fa-xmark"></i>
						</div>
						<div class="priceSection">
							<span class="dcPercent" id="cart-dc${dto.lectureNum}">${dto.dcPercent}%</span> <span class="originalPrice">${dto.lecturePrice}???</span>
							<p class="finalPrice" id="cart-price${dto.lectureNum}">${dto.dcAfterPrice}???</p>
						</div>
						
						<div class="hiddenSection" id="sectionId${status.index}" data-num="${dto.lectureNum}">
							<!--
							<input type="hidden" class="h-email" name="memberEmails" value="${sessionScope.member.memberEmail}">
							<input type="hidden" class="h-totalPay" name="totalPays" value="">
							<input type="hidden" class="h-totalDiscount" name="totalDiscounts" value="">
							<input type="hidden" class="h-paymentCode" name="paymentCodes" value="">
							<input type="hidden" class="h-payState" name="payStates" value="">
							<input type="hidden" class="h-approveNum" name="approveNums" value="">
							<input type="hidden" class="h-lectureNum" name="lectureNums" value="${dto.lectureNum}">
							<input type="hidden" class="h-lecturePay" name="lecturePays" value="">
							<input type="hidden" class="h-discount" name="discounts" value="">
							<input type="hidden" class="h-lectureEdate" name="lectureEdates" value="">
							-->
						</div>
					</div>
				</c:forEach>
			</form>
			<!-- 
			<c:forEach var="dto" items="${list}">
				<div class="cart-card d-flex px-3">
					<div class="form-check">
						<input class="form-check-input" name="cartCheck" type="checkbox" value="${dto.lectureNum}" id="flexCheckDefault">
					</div>
					<div class="cart-img">
						<img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" >
					</div>
					<div class="cart-course-title flex-fill">
						<p id="cart-subject${dto.lectureNum}">${dto.lectureSubject}</p>
						<span>${dto.memberNickname}&nbsp;&nbsp;|&nbsp;&nbsp;</span><span class="blue">?????? ?????? : ?????? ??? </span><span id="cart-duration${dto.lectureNum}">${dto.lectureDuration == 0 || dto.lectureDuration == null ? "?????????" : dto.lectureDuration}<c:if test="${dto.lectureDuration != 0 && dto.lectureDuration != null}">???</c:if></span>				
					</div>
					<div class="closeBtnSection">
						<i class="fa-solid fa-xmark"></i>
					</div>
					<div class="priceSection">
						<span class="dcPercent" id="cart-dc${dto.lectureNum}">${dto.dcPercent}%</span> <span class="originalPrice">${dto.lecturePrice}???</span>
						<p class="finalPrice" id="cart-price${dto.lectureNum}">${dto.dcAfterPrice}???</p>
					</div>
				</div>
			</c:forEach>
			-->

		</div>
	</div>
	
	<div class="pay-section ">
		<div class="buyer border">
			<div class="buyer-info-title">
				<span>????????? ??????</span>
				<button class="info-edit-btn">??????</button>
			</div>
			<div class="buyer-info">
				<table class="info-table">
					<tr>
						<td>??????</td>
						<td>${sessionScope.member.memberName}</td>
					</tr>
					<tr>
						<td>?????????</td>
						<td>${sessionScope.member.memberEmail}</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="payment">
			<div class="coupon">
				<span>?????? <i class="fa-solid fa-circle-question"></i></span>
				<div class="right">
					<span>???????????? </span><span>3</span>
				</div>
				<div class="iptBtn">
					<input type="text" placeholder="2000" class="">
					<button type="button" class="px-1" style="width:85px;">????????????</button>
				</div>
			</div>
			<div class="point">
				<span>????????? <a><i class="fa-solid fa-circle-question"></i></a></span>
				<div class="right">
					<span>?????? </span><span>5500</span>
				</div>
				<div class="iptBtn">
					<div>
						<input type="text" placeholder="1000" class="">
					</div>
					<div>
						<button type="button">????????????</button>
					</div>
				</div>
			</div>
			<div class="show-amount">
				<table class="amount-table">
					<tr>
						<td style="font-weight: 500;">???????????? ??????</td>
						<td class="totalPrice"></td>
					</tr>
					<tr class="totalDiscount" style="color:red;">
						<td> - ????????????</td>
						<td class="totalDc">- 0</td>
					</tr>
					<tr class="discounted" style="color: #999;">
						<td>&nbsp;- ????????????</td>
						<td> -2,000</td>
					</tr>
					<tr class="discounted2" style="color: #999;">
						<td>&nbsp;- ???????????????</td>
						<td> -1,000</td>
					</tr>
					<tr>
						<td>??? ?????? ??????</td>
						<td class="totalResult">0</td>
					</tr>
				</table>
			</div>
			<button type="button" id="iamportPayment" class="btn btn-primary confirmbtn">????????????</button>
			<p class="term" style="font-size: 12px; color: #ddd;">?????? ????????? ??????????????? ???????????????, ???????????? ??? ??????????????????????????? ????????? ???????????????.</p>
		</div>
	</div>
</div>
