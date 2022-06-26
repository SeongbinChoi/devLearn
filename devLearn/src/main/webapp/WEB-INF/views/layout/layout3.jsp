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
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/icofont/icofont.min.css" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.0/css/all.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" type="text/css">
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.css" type="text/css">
	</head>

<body>

<header>
    <tiles:insertAttribute name="header"/>
</header>
	
<main>
    <tiles:insertAttribute name="body"/>
</main>

<footer>
    <tiles:insertAttribute name="footer"/>
</footer>

<div id="loadingLayout" style="display:none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
	<div class="loader"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
// 모달 정보 넘기기
function sendModalLogin() {
    let f = document.modalLoginForm;
	let str;
	
	str = f.memberEmail.value;
    if(!str) {
        f.memberEmail.focus();
        return;
    }

    str = f.memberPwd.value;
    if(!str) {
        f.memberPwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}


// 비밀번호 찾기
function findPwd() {
	location.href = "${pageContext.request.contextPath}/member/pwdFind";
}


// 회원가입 창으로 이동
function signUp() {
	location.href = "${pageContext.request.contextPath}/member/signUp";
}
</script>



<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content rounded-5 shadow">
			<div class="modal-header  p-5 pb-4 border-bottom-0">
				<h2 class="fw-bold mb-0 login-brand">DEV Learn</h2>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body p-5 pt-0">
				<form name="modalLoginForm" action="" method="post">
				<div class="form-floating mb-3">
					<input type="email" class="form-control rounded-4" id="floatingInput" name="memberEmail" placeholder="name@example.com">
					<label for="floatingInput">Email address</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control rounded-4" id="floatingPassword" name="memberPwd" placeholder="Password">
					<label for="floatingPassword">Password</label>
				</div>
				<button class="w-100 mb-2 btn btn-lg rounded-4" type="button" style="background-color:#87CE00; color:#fff; font-weight:600;" onclick="sendModalLogin();">Log In</button>
				<small class="text-muted text-center"><span onclick="findPwd();" style="cursor: pointer;">비밀번호 찾기</span> | <span onclick="signUp();" style="cursor: pointer;">회원가입</span></small>
				<hr class="mt-3">
				<small class="fw-bold mb-3 text-secondary text-center">간편 로그인</small>
				<div>&nbsp;</div>
				<button class="w-100 py-2 mb-2 btn btn-outline-warning rounded-4" type="button">
					Sign up with Kakao
				</button>
				<button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4" type="button">
					Sign up with Facebook
				</button>
				<button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-4" type="button">
					Sign up with GitHub
				</button>
				</form>
			</div>
		</div>
	</div>
</div>		   

</body>
</html>