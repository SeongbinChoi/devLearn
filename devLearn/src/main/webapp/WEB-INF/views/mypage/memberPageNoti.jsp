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
.noti-content {
	padding: 10px 0;
	border-bottom: 1px solid #eee;
}
.noti-content p:first-of-type {
	font-weight: 700;
}
</style>
</head>
<body>
<jsp:include page="memberPage.jsp"/>
	<div class="noti">
		<c:forEach var="i" begin="1" end="20">
			<div class="noti-content">
				<p>내 수강(카테고리)</p>
				<p>새로운 강의가 업데이트 되었습니다.(내용)</p>
			</div>
		</c:forEach>
	</div>

</body>
</html>