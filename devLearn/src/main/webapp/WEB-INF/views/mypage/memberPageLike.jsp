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
.topSection {
	display: flex;
	justify-content: space-between;
	align-items: baseline;
}

p span {
	color: #0d6efd;
	font-weight: 800;
}
.free , .order {
	height: 40px;
	padding: 5px;
	border-radius: 5px;
	margin-right: 15px;
	border: 1px solid #ddd; 
}

.free:hover , .order:hover {
	outline: 5px solid rgba(13,110,253, .2);
	border-radius: 5px;
}

.lecture-section {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
		
}

.cards {
	width: 300px;
	overflow: hidden;
	margin-bottom: 30px;
}

.title {
	width: 97%;
	margin: 0 auto;
}

.title p {
	margin-bottom: 0;
	font-weight: 600;
}

.title a {
	margin-left: 10px;
	font-size: 45px;
}


.card-body {
	text-decoration: none;
}

.content:hover {
	background: rgba(255,0,0,0.6);
}

.tags {
	display: flex;
	text-align: center;
}

.tag {
	font-size: 12px;
	border-radius: 4px;
	padding: 0 3px;
	display: inline-flex;
	text-align: center;
	}
	
.tag:nth-child(n+1) {
	border: 1px solid tomato;
}

.card-title {
	font-weight: bold;
	height: 48px;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 원하는 줄 수 표시 */
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.card-text {
	font-size: 15px;
	font-weight: bold;
	color: #BDBDBD;
}

.instructor {
	font-size: 12px;
}

.fa-star {
	color: tomato;
}

.Price {
	color: #175cbe;
	font-weight: 700;
}

.inner-star::before {
	color: #FF9600;
}

.outer-star {
	position: relative;
	display: inline-block;
	color: #CCCCCC;
}

.inner-star {
	position: absolute;
	left: 0;
	top: 0;
	width: 0%;
	overflow: hidden;
	white-space: nowrap;
}

.outer-star::before, .inner-star::before {
	content: '\f005 \f005 \f005 \f005 \f005';
	font-family: 'Font Awesome 5 free';
	font-weight: 900;
}


</style>
</head>
<body>
<jsp:include page="memberPage.jsp"/>
	<div class="topSection">
		<p>전체 <span>11</span></p>
		<div class="topSelect">
			<select class="free">
				<option>유료/무료</option>
				<option>유료</option>
				<option>무료</option>
			</select>
			<select class="order">
				<option>최신순</option>
				<option>제목순</option>
				<option>평점순</option>
				<option>학생 수 순</option>
			</select>
		</div>
	</div>
	
	<div class="lecture-section my-3">
		<c:forEach begin="1" end="21">
				<div class="card border-light" style="cursor:pointer;">
					<img src="https://cdn.inflearn.com/public/courses/328742/cover/e1dfb69f-15e7-4ee9-8118-65b400f622f4/328742-eng-resize.png" class="card-img-top" alt="...">
					<div class="card-body">
						<div class="card-title">네트워크, 그림으로 이해하자</div>
						<div class="instructor">예술하는 개발자</div>
						<div class='RatingStar'>
							<div class='RatingScore'>
								<div class='outer-star'>
									<div class='inner-star'>
									</div>
								</div>
							</div>
						</div>
						<div class="Price">₩74,800</div>
						<div class="tags row row-cols-4 d-flex justify-content-start gap-1 py-2">
							<span class="tag col">+100명</span>
							<span class="tag col">업데이트</span>
							<span class="tag col">할인중</span>
						</div>
					</div>
				</div>
			</c:forEach>
	</div>
</main>
</body>
</html>