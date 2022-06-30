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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>
<style type="text/css">
.lec_img {
	width: 150px;
	height: 75px;
}

img {
	max-width: 100%;
 	max-height: 100%;
}

th, td {
  vertical-align : middle;
}
</style>
</head>
<body>
<main>
<jsp:include page="/WEB-INF/views/instructorPage/instructorPage.jsp"/>
<div class="mt-3">
		 		<table class="table table-centered table-nowrap table-hover mb-0">
		 			<thead>
			 			<tr>
			 				<td>번호</td>
			 				<td>강의번호</td>
			 				<td>질문자</td>
			 				<td>질문</td>
			 				<td>등록일</td>
			 			</tr>
		 			</thead>
					<tbody>
			 			<c:forEach var="dto" items="${list}" varStatus="status">
			 				<tr>
				 				<td>${dataCount - (page-1) * rows - status.index}</td>
				 				<td>${dto.lectureNum}</td>
				 				<td>${dto.qMember}</td>
				 				<td>${dto.question}</td>
				 				<td>${dto.q_regDate}</td>
			 				</tr>
			 			</c:forEach>
					</tbody>
		 		</table>
		 		<div class="paginate mt-5">
		 			${paging}
		 		</div>
	 		</div>
</main>

</body>
</html>