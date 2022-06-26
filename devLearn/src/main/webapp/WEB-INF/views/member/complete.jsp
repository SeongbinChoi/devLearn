<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 메인 -->
<div class="container" style="width:500px;">	
	<form name="memberForm" method="post" class="border mt-5 p-5">
		<h2 class="h3 mb-4 fw-normal">${title}</h2>
		<div class="form-footer col-12 checkbox mb-3">
			${message}
		</div>
		<div class="d-grid">
			<button type="button" class="btn btn-lg btn-primary" onclick="location.href='${pageContext.request.contextPath}/member/logout';">메인화면 <i class="bi bi-check2"></i> </button>
        </div>
	</form>
</div>
			   
