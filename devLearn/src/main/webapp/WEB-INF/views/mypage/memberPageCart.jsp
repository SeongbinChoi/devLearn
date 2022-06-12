<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
</style>
</head>
<body>

<div class="container d-flex mt-5">
	<div class="list-section flex-fill">
		<h3 style="font-weight: 800;">수강바구니</h3>
		<div class="cart-head d-flex align-items-center justify-content-baseline">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				<span>전체선택</span><span>3</span>/<span>3</span>
			</div>
			<button type="button" class="btn btn-primary deletebtn">선택 삭제 <i class="fa-solid fa-xmark"></i></button>
		</div>
		<div class="cart-content " >
			<c:forEach var="i" begin="1" end="3">
				<div class="cart-card d-flex ">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
					<div class="cart-img">
						<img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" >
					</div>
					<div class="cart-course-title flex-fill">
						<p>스프링 CSS 웹개발 어쩌구</p>
						<span>강사이름&nbsp;&nbsp;|&nbsp;&nbsp;</span><span>수강 기간</span>				
					</div>
					<div class="closeBtnSection">
						<i class="fa-solid fa-xmark"></i>
					</div>
					<div class="priceSection">
						<span class="dcPercent">30%</span> <span class="originalPrice">99,000원</span>
						<p class="finalPrice">69,300원</p>
					</div>
				</div>
			</c:forEach>
			<!-- 할인 안하는 카드 가격 확인용(지우고 작업해주세요) -->
			<div class="cart-card d-flex ">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
					<div class="cart-img">
						<img src="http://res.heraldm.com/content/image/2022/05/25/20220525000713_0.jpg" >
					</div>
					<div class="cart-course-title flex-fill">
						<p>스프링 CSS 웹개발 어쩌구</p>
						<span>강사이름&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span><span> 수강 기간</span>				
					</div>
					<div class="closeBtnSection">
						<i class="fa-solid fa-xmark"></i>
					</div>
					<div class="priceSection">
						<p class="finalPrice">69,300원</p>
					</div>
				</div>
		</div>
	</div>
	
	<div class="pay-section ">
		<div class="buyer border">
			<div class="buyer-info-title">
				<span>구매자 정보</span>
				<button class="info-edit-btn">수정</button>
			</div>
			<div class="buyer-info">
				<table class="info-table">
					<tr>
						<td>이름</td>
						<td>김자바</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>devLearn@devLearn.com</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="payment">
			<div class="coupon">
				<span>쿠폰 <i class="fa-solid fa-circle-question"></i></span>
				<div class="right">
					<span>사용가능 </span><span>0</span>
				</div>
				<div class="iptBtn">
					<input type="text" placeholder="0" class="">
					<button type="button" style="width:82px;">쿠폰선택</button>
				</div>
			</div>
			<div class="point">
				<span>포인트 <a><i class="fa-solid fa-circle-question"></i></a></span>
				<div class="right">
					<span>보유 </span><span>0</span>
				</div>
				<div class="iptBtn">
					<div>
						<input type="text" placeholder="0" class="">
					</div>
					<div>
						<button type="button">전액사용</button>
					</div>
				</div>
			</div>
			<div class="show-amount">
				<table class="amount-table">
					<tr>
						<td style="font-weight: 500;">선택상품 금액</td>
						<td>229,900</td>
					</tr>
					<tr class="" style="color:red;">
						<td> - 할인금액</td>
						<td>- 50,000</td>
					</tr>
					<tr class="discounted" style="color: #999;">
						<td>&nbsp;- 즉시할인</td>
						<td> -10,000</td>
					</tr>
					<tr class="discounted" style="color: #999;">
						<td>&nbsp;- 쿠폰할인</td>
						<td> -20,000</td>
					</tr>
					<tr class="discounted" style="color: #999;">
						<td>&nbsp;- 포인트사용</td>
						<td> -20,000</td>
					</tr>
					<tr>
						<td>총 결제 금액</td>
						<td>179,900</td>
					</tr>
				</table>
			</div>
			<button type="button" class="btn btn-primary confirmbtn">결제하기</button>
			<p class="term" style="font-size: 12px; color: #ddd;">회원 본인은 주문내용을 확인했으며, 구매조건 및 개인정보취급방침과 결제에 동의합니다.</p>
		</div>
	</div>
</div>

</body>
</html>