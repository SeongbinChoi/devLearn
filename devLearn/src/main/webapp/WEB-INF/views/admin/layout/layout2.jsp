<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	<!-- 구글 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/icofont/icofont.min.css" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.0/css/all.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.theme.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.structure.min.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>
</head>

<body>

<div class="wrapper">
	<tiles:insertAttribute name="left"/>
	<tiles:insertAttribute name="body"/>
</div>





<script type="text/javascript">
	let angle = document.querySelectorAll(".fa-angle-down");
	for(let i = 0; i < angle.length; i++) {
		angle[i].addEventListener("click", (e) => {
			let angleParent = e.target.parentElement.parentElement;
			angleParent.classList.toggle("showMenu");
		});
	}
</script>


<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}



</script>

</body>
</html>