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
		<h2>내 쿠폰함</h2>
		<button type="button" class="ms-auto guidebtn" data-bs-toggle="modal" data-bs-target="#guide">쿠폰 및 할인 이용 안내</button>
	</div>
	
	<div class="coupon-dashboard">
		<div class="d-flex border-bottom">
			<div class="quantity">
				<div class="quantity-title"><i class="fa-solid fa-circle-check"></i> 사용 가능한 쿠폰</div>
				<div class="quantity-num"><span>4</span>개</div>
			</div>
			<div class="align-self-center" style="width: 1px; height:100px; background: #ddd;"></div>
			<div class="quantity">
				<div class="quantity-title"><i class="fa-solid fa-hourglass"></i> 만료 임박 쿠폰</div>
				<div class="quantity-num"><span>1</span>개</div>
			</div>
		</div>
		<div class="couponInput d-flex align-items-center">
			<div class="couponTxt">할인 쿠폰 코드 입력란</div>
			<div class="coupon-input flex-fill d-flex">
				<input type="text" placeholder="보유하신 쿠폰 코드를 입력해주세요" class="flex-fill">
				<button type="button" class="btn btn-primary">등록</button>
			</div>
		</div>
	</div>
	
	<div class="status-section d-flex align-items-center">
		<ul>
			<li><a href="#" class="is-active">사용가능 (4)</a></li>
			<li><a href="#">만료임박 (1)</a></li>
			<li><a href="#">기간 만료 (4)</a></li>
			<li><a href="#">전체 쿠폰 (8)</a></li>
		</ul>
	</div>

	<div class="coupon-list">
		<div class="coupon-card">
			<p>2022-06-31 23:59 까지</p>
			<p>가입 환영 10% 할인 쿠폰</p>
			<div class="coupon-discount">
				<p>30일 남음</p>
				<p class="flex-fill">총 금액에서 <span>10%</span></p>
			</div>
		</div>
		<div class="coupon-card expired">
			<p>2022-06-31 23:59 까지</p>
			<p>가입 환영 10% 할인 쿠폰</p>
			<div class="coupon-discount ">
				<p>기간 만료</p>
				<p>총 금액에서 <span>10%</span></p>
			</div>
		</div>
		<div class="coupon-card">
			<p>2022-06-31 23:59 까지</p>
			<p>가입 환영 5,000원 할인 쿠폰</p>
			<div class="coupon-discount ">
				<p>30일 남음</p>
				<p><span>5,000원</span></p>
			</div>
		</div>
		<div class="coupon-card">
			<p>2022-06-31 23:59 까지</p>
			<p>가입 환영 5,000원 할인 쿠폰</p>
			<div class="coupon-discount ">
				<p>30일 남음</p>
				<p><span>5,000원</span></p>
			</div>
		</div>
		<div class="coupon-card">
			<p>2022-06-31 23:59 까지</p>
			<p>가입 환영 5,000원 할인 쿠폰</p>
			<div class="coupon-discount ">
				<p>30일 남음</p>
				<p><span>5,000원</span></p>
			</div>
		</div>
		<div class="coupon-card expired">
			<p>2022-06-31 23:59 까지</p>
			<p>가입 환영 5,000원 할인 쿠폰</p>
			<div class="coupon-discount ">
				<p>30일 남음</p>
				<p><span>5,000원</span></p>
			</div>
		</div>
	</div>	
<!-- 할인 안내 모달 -->
<div class="modal fade" id="guide" tabindex="-1" aria-labelledby="guidePointLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="guidePointLabel" style="font-weight: 800;">포인트 적립 안내</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="margin:0 auto; ">
				<h5 style="font-weight: 600;">1. 쿠폰 사용은 어떻게 하나요? </h5>
				<p>[수강바구니 → 쿠폰선택 → 사용가능쿠폰]에서 원하는 쿠폰을 클릭하여 사용할 수 있습니다.</p>

				<h5 style="font-weight: 600;">2. 쿠폰 등록은 어떻게 하나요?</h5>
				<p>[수강바구니 → 쿠폰선택], [대시보드 → 쿠폰함]에서 보유한 쿠폰코드를 입력하면 쿠폰이 발급됩니다.</p>

				<h5 style="font-weight: 600;">3. 쿠폰과 할인을 같이 사용할 수 있나요?</h5>
				<p>모든 강의 할인과 쿠폰은 중복으로 사용할 수 없습니다.</p>

				<h5 style="font-weight: 600;">4. 쿠폰은 한 번에 몇 개까지 사용할 수 있나요?</h5>
				<p>쿠폰은 수강바구니에서 1개만 적용이 가능합니다.</p>
				
				<h5 style="font-weight: 600;">5. 쿠폰 적용 가능한 강의는 어디에서 확인하나요?</h5>
				<p>쿠폰함에서 각 쿠폰별로 적용 가능한 강의 리스트를 확인할 수 있어요.<br>단, 할인 및 쿠폰 프로모션에 동의한 강의만 해당됩니다.</p>
			</div>
		</div>
	</div>
</div>
</main>
</body>
</html>