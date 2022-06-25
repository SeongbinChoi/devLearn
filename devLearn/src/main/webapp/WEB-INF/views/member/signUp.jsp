<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript">
// 로그인 정보확인
function memberOk() {
	const f = document.memberForm;
	let str;
	
	// 이메일 입력확인
	str = f.memberEmail.value;
	if(!str) {
		str = "이메일을 입력해주세요.";
        $(".emailOC").css("color","red"); 
		$(".emailOC").html(str);
		f.memberEmail.focus();
		return;
	}
	
	// 이메일 인증확인
	let mode = "${mode}";
	str = f.mCertification.value;
	if(mode === "signUp" && !str) {
		str = "이메일 인증을 해주세요.";
        $(".codeCheck").css("color","red"); 
		$(".codeCheck").html(str);
		f.mCertification.focus();
		return;
	}
	
	// 이름확인
	str = f.memberName.value;
    if( !/^[가-힣]{2,5}$/.test(str) ) {
    	str = "이름은 2~5자의 한글입니다.";
        $(".nameCheck").css("color","red"); 
		$(".nameCheck").html(str);
        f.memberName.focus();
        return;
    } else {
    	$(".nameCheck").html("");
    }
	
    // 비밀번호 형식 확인
	str = f.memberPwd.value;
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		$(".pwdCheck").css("color","red"); 
		f.memberPwd.focus();
		return;
	} else {
		$(".pwdCheck").css("color","black");
	}

	// 비밀번호 확인
	str = f.memberRePwd.value;
	if( str !== f.memberPwd.value ) {
		str = "패스워드를 다시 확인해주세요.";
        $(".pwdReCheck").css("color","red"); 
		$(".pwdReCheck").html(str);
        f.memberRePwd.focus();
        return;
	}
	
	
	// 이메일 수신여부
	str = f.emailCheck.checked;
	if( !str) {
		f.emailCheck.value = 0;
	} else {
		f.emailCheck.value = 1;
	}
	
	
	f.action = "${pageContext.request.contextPath}/member/signUp";
	f.submit();
}


// 이메일 중복 검사 ajax
function emailOverlapCheck() {
	let email = $("#mEmail").val();
	
	if(!/^[a-z0-9_]{1,}@[a-z0-9]{1,}[\.][a-z0-9]{1,}$/i.test(email)) {
		var str = "이메일은 aaa@example.com 형식입니다."
		$("#mEmail").focus();
		$(".emailOC").html(str);
		return;
	}
	
	let url = "${pageContext.request.contextPath}/member/emailOverlapCheck";
	let query = "email=" + email;
	
	$.ajax({
		type:"POST",
		url:url,
		data:query,
		dataType:"json",
		success:function(data) {
			let passed = data.passed;
			
			// 중복되지 않은경우 -> 사용가능
			if(passed === "true") {
				let str = email + " 는 사용가능 합니다.";
				$(".emailOC").css("color","blue"); 
				$(".emailOC").html(str);
				
				$("#mEmail").prop('readonly', true);
				$("#buttonOne").removeAttr("onclick");
				$("#buttonOne").attr("onclick", "emailCertification();");
				$("#buttonOne").html("인증")
				
			} else {	// 중복된 경우 -> 사용불가능
				let str = email + " 는 사용할 수 없습니다.";
				$("#mEmail").focus();
				$(".emailOC").css("color","red"); 
				$(".emailOC").html(str);
				return false;
			}
		}
	});
}


// 인증코드 메일로 보내는 ajax
function emailCertification() {
	let email = $("#mEmail").val();
	
	let url = "${pageContext.request.contextPath}/member/emailCertification";
	let query = "email=" + email;
	
	$.ajax({
		type:"POST",
		url:url,
		data:query,
		dataType:"json",
		success:function(data) {
			let passed = data.passed;
			
			// 정상적으로 인증코드 보낸경우
			if(passed === "true") {
				alert("인증코드 전송에 성공하였습니다.");
				$("#Certification").attr("value", data.Certification);
				$('#buttonOne').prop('disabled', true);
			} else {	// 인증코드 보내는것 실패한 경우
				alert("인증코드 전송에 실패했습니다.");
				return false;
			}
		}
	});
}


// 인증번호 확인
function certificationCheck() {
	
	let input = $("#mCertification").val();
	let Certification = $("#Certification").val();
	
	if(input.length != 0 && input === Certification) {
		str = "인증코드 인증이 완료됬습니다.";
		$(".codeCheck").css("color","blue"); 
		$(".codeCheck").html(str);

		$("#mCertification").prop('readonly', true);
		$('#buttonOne1').prop('disabled', true);
	} else {
		str = "인증코드를 다시 확인해주세요.";
		$(".codeCheck").css("color","red"); 
		$(".codeCheck").html(str);
		return false;
	}
	
}

</script>


<!-- 메인 -->
<div class="container" style="width:400px;">	
	<form name="memberForm" method="post" class="mt-5 pt-5">
		<h2 class="h3 mb-4 fw-normal">회원 가입</h2>
		<div class="row gy-4">
			<div class="col-8">
				<input type="email" class="form-control form-control-lg" name="memberEmail" id="mEmail" placeholder="name@example.com">
			</div>
			<div class="col-4">
				<button id="buttonOne" type="button" class="btn btn-primary form-control-lg" style="width:100%; height:100%;" onclick="emailOverlapCheck();">중복확인</button>
			</div>
			<p class="emailOC" style="margin-bottom: 0px; margin-top: 8px; margin-left: 5px; color:red;"></p>
			<div class="col-8 certification_chk">
				<input type="text" class="form-control form-control-lg" name = "mCertification" id="mCertification" placeholder="인증번호">
				<input id="Certification" type="hidden">
			</div>
			<div class="col-4 certification_chk">
				<button id="buttonOne1" type="button" class="btn btn-primary form-control-lg" style="width:100%; height:100%;" onclick="certificationCheck();">확인</button>
			</div>
			<p class="codeCheck" style="margin-bottom: 0px; margin-top: 8px; margin-left: 5px; color:red;"></p>
			<div class="col-12">
				<input type="text" class="form-control form-control-lg" name = "memberName" id="memberName" placeholder="이름">
			</div>
			<p class="nameCheck" style="margin-bottom: 0px; margin-top: 8px; margin-left: 5px;"></p>
			<div class="col-12">
				<input type="password" class="form-control form-control-lg" name="memberPwd" id="floatingPassword" placeholder="패스워드">
			</div>
			<p class="pwdCheck" style="margin-bottom: 0px; margin-top: 8px; margin-left: 5px;">패스워드는 5~10자이며 하나 이상의 <br>숫자나 특수문자가 포함되어야 합니다.</p>
			<div class="col-12">
				<input type="password" class="form-control form-control-lg" name="memberRePwd" id="floatingRePassword" placeholder="패스워드 확인">
			</div>
			<p class="pwdReCheck" style="margin-bottom: 0px; margin-top: 8px; margin-left: 5px;"></p>
			<div class="form-footer col-12 checkbox mb-3">
				<span><small>가입 시, 데브런의 <a href="#" style="color:red">이용약관</a>, <a href="#" style="color:red">개인정보취급방침</a> 에 동의합니다.</small></span>
				<label><small class="me-2">통합회원 할인 혜택 및 유용한 채용 소식을 받아볼래요</small><input type="checkbox" name="emailCheck" id="emailCheck"></label>
			</div>    
		</div>
		<button type="button" class="w-100 btn btn-lg btn-primary" onclick="memberOk();">Sign Up</button>
		<div>
			<p class="form-control-plaintext text-center">${message}</p>
		</div>
	</form>
</div>
			   
