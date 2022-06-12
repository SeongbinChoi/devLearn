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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
.title {
	padding-left: 20px;
	font-size: 20px;
	font-weight: 800;
}

.lectuer-noti, .dev-noti {
	background: #ddd;
	padding: 12px 8px;
	margin-bottom: 30px;
	width: 70%;
	border-radius: 5px;
}

.noti-content p:first-of-type {
	font-weight: 700;	
}

.noti-content p:last-of-type {
	color: #999;
}

</style>
</head>
<body>
<jsp:include page="memberPage.jsp"/>
<div class="setNoti">
	<div class="title">
		<p>메일 설정</p>
	</div>
	<div class="lectuer-noti d-flex justify-content-between align-items-center">
		<div class="noti-content">
			<p>강의 공지사항</p>
			<p>강의의 지식공유자가 보내는 공지사항에 대한 메일을 받습니다.</p>
		</div>
		<div class="form-check form-switch">
			<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
		</div>
	</div>
	<div class="dev-noti">
		<div class="noti-content d-flex justify-content-between align-items-center">
			<div class="noti-content">
				<p>데브런 소식 및 홍보</p>
				<p>할인, 이벤트 강의 추천, 유용한 정보를 알려주는 메일을 받습니다.</p>
			</div>
			<div class="form-check form-switch">
				<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
			</div>
		</div>
	</div>
</div>
</body>
</html>