<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

</style>

	<div class="container" style="width:400px;">	
		<form class="mt-5 pt-5">
			<h2 class="h3 mb-4 fw-normal">회원 가입</h2>
			<div class="row gy-4">
				<div class="col-8">
					<input type="email" class="form-control form-control-lg" name="memberEmail" id="floatingInput" placeholder="name@example.com">
				</div>
				<div class="col-4">
					<button type="button" class="btn btn-primary form-control-lg" style="width:100%; height:100%;">인증</button>
				</div>
				<div class="col-8 certification_chk">
					<input type="text" class="form-control form-control-lg" id="floatingInput" placeholder="인증번호">
				</div>
				<div class="col-4 certification_chk">
					<button type="button" class="btn btn-primary form-control-lg" style="width:100%; height:100%;">확인</button>
				</div>		
				<div class="col-12">
					<input type="password" class="form-control form-control-lg" name="memberPwd" id="floatingPassword" placeholder="패스워드">
				</div>
				<div class="col-12">
					<input type="password" class="form-control form-control-lg" id="floatingPassword" placeholder="패스워드 확인">
				</div>
				<div class="form-footer col-12 checkbox mb-3">
					<span><small>가입 시, 데브런의 <a href="#" style="color:red">이용약관</a>, <a href="#" style="color:red">개인정보취급방침</a> 에 동의합니다.</small></span>
					<label><small class="me-2">통합회원 할인 혜택 및 유용한 채용 소식을 받아볼래요</small><input type="checkbox" name="emailCheck" value="1"></label>
				</div>    
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>
		</form>
	</div>
			   
