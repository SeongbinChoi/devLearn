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
.pointHeader p {
	font-size: 20px;
	font-weight: 800;
}

.pointHeader p span {
	color: #0d6efd;
}

.pointHeader a:hover {
	cursor: pointer;
}

.acc {
	color: #0d6edf;
	font-weight: 800;
	text-align: right;
}

.use , .expire {
	color: #f00;	
	font-weight: 800;
	text-align: right;
}

figure img {
	width: 40px;
}

.pointTable {
	vertical-align: center;
}

.pointTable td:nth-child(4n+2) {
	font-weight: 600;
}

.pointTable td {
	vertical-align: center;
} 

</style>
</head>
<body>
<jsp:include page="memberPage.jsp"/>
	<div class="pointHeader d-flex align-items-baseline">
		<p>현재 사용 가능 포인트 <span>1,000</span> P</p><small>(<a data-bs-toggle="modal" data-bs-target="#getPoint" ><i class="fa-solid fa-circle-question"></i> 포인트 받는 법)</a></small>
	</div>
	<div class="pointContent">
		<table class="pointTable"> 
			<tr>
				<td rowspan="2">
					<figure class="figure">
						<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded rounded-circle" alt="" >
					</figure>
				</td>
				<td >[수강평작성]</td>
				<td class="acc"> 300 P</td>
				<td>적립</td>
			</tr>
			<tr>
				<td colspan="3">2020-02-02 20:20</td>
			</tr>
			<tr>
				<td rowspan="2">
					<figure class="figure">
						<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded rounded-circle" alt="" >
					</figure>
				</td>
				<td >[질문에 좋아요]</td>
				<td class="acc"> 300 P</td>
				<td>적립</td>
			</tr>
			<tr>
				<td colspan="2">2020-02-02 20:20</td>
			</tr>
			<tr>
				<td rowspan="2">
					<figure class="figure">
						<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded rounded-circle" alt="" >
					</figure>
				</td>
				<td >[강의 결제]</td>
				<td class="use"> 1,000 P</td>
				<td>사용</td>
			</tr>
			<tr>
				<td colspan="3">2020-02-02 20:20</td>
			</tr>
			<tr>
				<td rowspan="2">
					<figure class="figure">
						<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded rounded-circle" alt="" >
					</figure>
				</td>
				<td >[유효기간 만료]</td>
				<td class="expire"> 10 P</td>
				<td>사용</td>
			</tr>
			<tr>
				<td colspan="3">2020-02-02 20:20</td>
			</tr>
		</table>
	</div>
	
	
	
<!-- 포인트 적립 모달 -->
<div class="modal fade" id="getPoint" tabindex="-1" aria-labelledby="getPointLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="getPointLabel" style="font-weight: 800;">포인트 적립 안내</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="margin:0 auto; ">
				<h3 style="font-weight: 600;">수강평을 남겨주세요 <span style="color: #0d6efd;">+300 P</span></h3>
				<p>솔직하고 자세한 수강평은 강의를 만드는 지식공유자, 그리고 강의를 듣게 될 예비 수강생 모두에게 도움이 됩니다. 멋진 수강평을 남기고 잎을 받아 가세요! (단, 포인트는 하루에 3번까지만 지급됩니다.)</p>

				<h3 style="font-weight: 600;">내 질문이 좋아요를 받는다면 <span style="color: #0d6efd;">+10 P</span></h3>
				<p>내가 궁금했던 부분을 다른 누군가도 궁금해할 수 있겠죠? 내가 올린 질문은 다른 수강생들에게 유용한 정보가 될 수 있어요. 내 질문이 '좋아요'를 받을 때마다 10P를 받게 됩니다.</p>

				<h3 style="font-weight: 600;">내 답변이 좋아요를 받는다면 <span style="color: #0d6efd;">+10 P</span></h3>
				<p>커뮤니티에 질문이 올라오면 답변을 작성해 보세요. 학습 중 어려움을 겪는 또 다른 수강생에게 큰 도움이 된답니다! 내 답변이 '좋아요'를 받을 때마다 10P를 받게 됩니다.</p>

				<h3 style="font-weight: 600;">내 블로그가 좋아요를 받는다면 <span style="color: #0d6efd;">+10 P</span></h3>
				<p>다양한 블로그를 둘러보고 직접 게시글을 작성해 보세요. 내가 올린 블로그가 '좋아요'를 받을 때마다 10P를 받게 됩니다.</p>
			</div>
		</div>
	</div>
</div>
</main>
</body>
</html>