<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;
	
	let str = f.memberEmail.value;
	if(!str) {
		alert("이메일을 입력하세요.");
		f.memberEmail.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/member/pwdFind";
	f.submit();
}

</script>


<!-- 메인 -->
<div class="container" style="width:500px;">	
	<form name="pwdForm" method="post" class="border mt-5 p-5">
		<h2 class="h3 mb-4 fw-normal">패스워드 찾기</h2>
		<div class="form-footer col-12 checkbox mb-3">
			<p>이메일을 입력 하세요.</p>
		</div>
		
        <div class="d-grid" style="margin-botton: 10px;">
            <input type="text" name="memberEmail" class="form-control form-control-lg" placeholder="이메일" style="margin-bottom: 20px;">
        </div>
        
        <div class="d-grid">
            <button type="button" class="btn btn-lg btn-primary" onclick="sendOk();">확인 <i class="bi bi-check2"></i> </button>
        </div>
        
        <div class="d-grid">
			<p class="form-control-plaintext text-center py-3">${message}</p>
		</div>
	</form>
</div>
			   
