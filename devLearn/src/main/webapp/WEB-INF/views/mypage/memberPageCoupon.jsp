<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
.guidebtn {
	padding: 10px 16px;
	border-radius: 5px;
	border: 1px solid #ddd;
	background: #fff;
}

.coupon-dashboard {
	border: 1px solid #ddd;
	border-radius: 5px;
	margin: 20px 0;
}

.quantity {
	width: 50%;
	height: 140px;	
	padding: 16px 24px;
}

.quantity-num {
	text-align: right;
}

.quantity-num span {
	font-size: 48px;
	font-weight: 800;
	margin-right: 8px;
}

.couponInput{
	min-height: 50px;
}

.couponTxt {
	font-weight: 700;
	border-right: 1px solid #ddd;
	padding: 16px 24px;
}

.coupon-input {
	padding: 0 15px;
	gap: 10px;
}

.coupon-input button {
	height: 40px;
	display: block;
	padding: 8px 20px;
}

.coupon-input input {
	height: 40px;
	display: block;
	gap: 5px;
	width: 80%; 
	border: none;
	background: #f0f0f0;
	border-radius: 5px;
	padding-left: 10px;
}

.coupon-input input:focus {
	outline: none;
}

.status-section {
	height: 50px;
	padding: 12px 8px;
	border: 1px solid #ddd;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}
	
.status-section ul {
	padding: 0;
	margin: 0 0 0 40px;
	list-style: none;

}

.status-section li {
	float: left;
	margin-right: 25px;
}

.status-section li a:not(.is-active) {
	text-decoration: none;
	color: #aaa;
}

.status-section li a:hover {
	color: #0d6efd;
	font-weight: 700;
}

.is-active {
	color: #0d6efd;
	font-weight: 700;
	text-decoration: none;
}

.coupon-list {
	width:100%;
	padding: 13px 15px;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	
}

.coupon-card {
	width: 28%;	
	border: 1px solid #ddd;
	padding: 16px;
}
.coupon-card p {
	margin: 0;
}

.expired {
	opacity: 0.5;
}

.expired p:nth-of-type(2):not(.coupon-discount p) {
	text-decoration: line-through;
}

.coupon-card p {
	font-size: 12px;
}
	
.coupon-card p:nth-of-type(2):not(.coupon-discount p) {
	font-size: 14px;
	font-weight: 600;
}

.coupon-discount {
	display: flex;
	align-items: baseline;
	margin-top: 10px;
	justify-content: space-between;
}

.coupon-discount p:nth-child(2) {
	color: #0d6edf;
	text-align: right;
}

.coupon-discount span {
	font-size: 20px;
	font-weight: 700;	 
}

.coupon-card:nth-of-type(n+4) {
	margin-top: 13px;
}
</style>
</head>
<body>
<jsp:include page="memberPage.jsp"/>
	<div class="coupon-top d-flex">
		<h2>??? ?????????</h2>
		<button type="button" class="ms-auto guidebtn" data-bs-toggle="modal" data-bs-target="#guide">?????? ??? ?????? ?????? ??????</button>
	</div>
	
	<div class="coupon-dashboard">
		<div class="d-flex border-bottom">
			<div class="quantity">
				<div class="quantity-title"><i class="fa-solid fa-circle-check"></i> ?????? ????????? ??????</div>
				<div class="quantity-num"><span>4</span>???</div>
			</div>
			<div class="align-self-center" style="width: 1px; height:100px; background: #ddd;"></div>
			<div class="quantity">
				<div class="quantity-title"><i class="fa-solid fa-hourglass"></i> ?????? ?????? ??????</div>
				<div class="quantity-num"><span>1</span>???</div>
			</div>
		</div>
		<div class="couponInput d-flex align-items-center">
			<div class="couponTxt">?????? ?????? ?????? ?????????</div>
			<div class="coupon-input flex-fill d-flex">
				<input type="text" placeholder="???????????? ?????? ????????? ??????????????????" class="flex-fill">
				<button type="button" class="btn btn-primary">??????</button>
			</div>
		</div>
	</div>
	
	<div class="status-section d-flex align-items-center">
		<ul>
			<li><a href="#" class="is-active">???????????? (4)</a></li>
			<li><a href="#">???????????? (1)</a></li>
			<li><a href="#">?????? ?????? (4)</a></li>
			<li><a href="#">?????? ?????? (8)</a></li>
		</ul>
	</div>

	<div class="coupon-list">
		<div class="coupon-card">
			<p>2022-06-31 23:59 ??????</p>
			<p>?????? ?????? 10% ?????? ??????</p>
			<div class="coupon-discount">
				<p>30??? ??????</p>
				<p class="flex-fill">??? ???????????? <span>10%</span></p>
			</div>
		</div>
		<div class="coupon-card expired">
			<p>2022-06-31 23:59 ??????</p>
			<p>?????? ?????? 10% ?????? ??????</p>
			<div class="coupon-discount ">
				<p>?????? ??????</p>
				<p>??? ???????????? <span>10%</span></p>
			</div>
		</div>
		<div class="coupon-card">
			<p>2022-06-31 23:59 ??????</p>
			<p>?????? ?????? 5,000??? ?????? ??????</p>
			<div class="coupon-discount ">
				<p>30??? ??????</p>
				<p><span>5,000???</span></p>
			</div>
		</div>
		<div class="coupon-card">
			<p>2022-06-31 23:59 ??????</p>
			<p>?????? ?????? 5,000??? ?????? ??????</p>
			<div class="coupon-discount ">
				<p>30??? ??????</p>
				<p><span>5,000???</span></p>
			</div>
		</div>
		<div class="coupon-card">
			<p>2022-06-31 23:59 ??????</p>
			<p>?????? ?????? 5,000??? ?????? ??????</p>
			<div class="coupon-discount ">
				<p>30??? ??????</p>
				<p><span>5,000???</span></p>
			</div>
		</div>
		<div class="coupon-card expired">
			<p>2022-06-31 23:59 ??????</p>
			<p>?????? ?????? 5,000??? ?????? ??????</p>
			<div class="coupon-discount ">
				<p>30??? ??????</p>
				<p><span>5,000???</span></p>
			</div>
		</div>
	</div>	
<!-- ?????? ?????? ?????? -->
<div class="modal fade" id="guide" tabindex="-1" aria-labelledby="guidePointLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="guidePointLabel" style="font-weight: 800;">?????? ?????? ??????</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="margin:0 auto; ">
				<h5 style="font-weight: 600;">1. ?????? ????????? ????????? ?????????? </h5>
				<p>[??????????????? ??? ???????????? ????????????????????????]?????? ????????? ????????? ???????????? ????????? ??? ????????????.</p>

				<h5 style="font-weight: 600;">2. ?????? ????????? ????????? ??????????</h5>
				<p>[??????????????? ??? ????????????], [???????????? ??? ?????????]?????? ????????? ??????????????? ???????????? ????????? ???????????????.</p>

				<h5 style="font-weight: 600;">3. ????????? ????????? ?????? ????????? ??? ??????????</h5>
				<p>?????? ?????? ????????? ????????? ???????????? ????????? ??? ????????????.</p>

				<h5 style="font-weight: 600;">4. ????????? ??? ?????? ??? ????????? ????????? ??? ??????????</h5>
				<p>????????? ????????????????????? 1?????? ????????? ???????????????.</p>
				
				<h5 style="font-weight: 600;">5. ?????? ?????? ????????? ????????? ???????????? ????????????????</h5>
				<p>??????????????? ??? ???????????? ?????? ????????? ?????? ???????????? ????????? ??? ?????????.<br>???, ?????? ??? ?????? ??????????????? ????????? ????????? ???????????????.</p>
			</div>
		</div>
	</div>
</div>
</main>
</body>
</html>