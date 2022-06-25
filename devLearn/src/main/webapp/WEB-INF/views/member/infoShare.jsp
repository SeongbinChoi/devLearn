<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/infoShare.css" type="text/css">
<style type="text/css">

#jisikModal ::-webkit-scrollbar {
  display: none;
}

.ck.ck-editor {
	max-width: 97%;
	overflow-y: scroll;
}

.ck-editor__editable {
    min-height: 250px;
    max-height: 250px;
}

</style>
<section>

<!-- 지식공유자 신청 모달 -->
<div class="modal fade" id="jisikModal" tabindex="-1" aria-labelledby="jisikModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
		<div class="modal-content" style="overflow-y: scroll; scrollbar-width : none;">
			<form name ="enrollForm" method="post" >
				<div class="modal-header">
				<h5 class="modal-title" id="jisikModalLabel">감사합니다, ${sessionScope.member.memberNickname}님 지식공유자가 되려면 아래정보를 입력해주세요</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">인프런 계정</label>
						<input type="text" class="form-control" name="eMail" placeholder="인프런 계정을 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">비지니스 이메일</label>
						<input type="text" class="form-control" name="bMail" placeholder="메일 주소를 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">이름</label>
						<input type="text" class="form-control" name="name" placeholder="이름을 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">연락처</label>
						<input type="text" class="form-control" name="phone" placeholder="***-****-**** 형식으로 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">희망 역할</label>
						<label for="exampleFormControlInput1" class="form-label" style="font-size: 12px;">강의를 하시고자 하시면 강사를, 조언을 하시고자 하시면 멘토를 신청해주세요</label>
						<br> 
						<div class="radio mb-3">
							<div class="form-check mr-2">
								<label class="form-check-label" for="chooseRoleInstructor">
								<input class="form-check-input" type="radio" name="applyRole" id="chooseRoleBoth" value="30">
									강사 &amp; 멘토
								</label>
							</div>
							<div class="form-check mr-2">
								<label class="form-check-label" for="chooseRoleInstructor">
								<input class="form-check-input" type="radio" name="applyRole" id="chooseRoleInstructor" value="20">
									강사
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label" for="chooseRoleMentor">
								<input class="form-check-input" type="radio" name="applyRole" id="chooseRoleMentor" value="10">
									멘토
								</label>
							</div>
						</div>
					</div>
					<div class="radio mb-3">
							<label for="exampleFormControlInput1" class="form-label">희망분야</label>
							<label for="exampleFormControlInput1" class="form-label" style="font-size: 12px;">희망 분야를 선택해주세요. 분야를 선택하기 어려우시다면 현재 직종을 선택해주세요.</label>
							<div class="form-check mr-2">
								<label class="form-check-label" for="chooseRoleInstructor">
								<input class="form-check-input" type="radio" name="category" id="category01" value="01">
									개발 · 프로그래밍
								</label>
							</div>
							<div class="form-check mr-2">
								<label class="form-check-label" for="chooseRoleInstructor">
								<input class="form-check-input" type="radio" name="category" id="category02" value="02">
									보안 · 네트워크
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label" for="chooseRoleMentor">
								<input class="form-check-input" type="radio" name="category" id="category03" value="03">
									데이터 사이언스
								</label>
							</div>
							<div class="form-check mr-2">
								<label class="form-check-label" for="chooseRoleInstructor">
								<input class="form-check-input" type="radio" name="category" id="category04" value="04">
									크리에이티브
								</label>
							</div>
						</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">나를 소개하는 글</label>
						<label for="exampleFormControlInput1" class="form-label" style="font-size: 12px;">지식공유자님에 대한 소개와, 제작할 강의에 관련된 내용을 적어주세요.</label>     
						<textarea name="intro" id ="editorIntro" rows="3" ></textarea>
						<input type="hidden" value="${message}" id="ExistInModal" name="exist"> 
					</div>
					<div class="mb-3">
						<button class="btn btn-primary" type="button" onclick="sendEnroll();">제출</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

	<div class="banner mb-5">
		<div class="container px-4">
			<div class="banner_title row align-items-center" style="height: 200px;">
				<h1 class="title">나의 지식에 가치를 부여하세요</h1>
				<p class="subtitle">전체 지식공유자 평균 수익 3025만원!!
				<br>나의 지식을 나눠 사람들에게 배움의 기회를 주고, 의미있는 대가를 가져가세요
				<br>인프런은 지식으로 의미있는 수익과 공유가 가능한 한국 유일한 플랫폼입니다.
				<br></p>
			</div>
			<div class="buttons">
				<button class="btn btn_primary e-show-form" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#jisikModal">지식공유참여</button>
				<a class="btn btn_light" target="" href="#">지식공유자 안내서</a>
			</div>
		</div>
	</div>
</section>
<section>
	<div class="container px-4">
		<div class="card_cover">
			<div class="count_card">
				<div class="icon_cover">
					<i class="fas fa-coins"></i>
				</div>
				<div class="value_cover">
					<span class="label">1인 평균 누적수익</span>
					<span class="value">3025만원</span>
				</div>
			</div>
			<div class="count_card">
				<div class="icon_cover">
					<i class="fas fa-user-graduate"></i>
				</div>
				<div class="value_cover">
					<span class="label">총 누적 회원</span>
					<span class="value">12,239명</span>
				</div>
			</div>
			<div class="count_card">
				<div class="icon_cover">
					<i class="fas fa-users-class"></i>
				</div>
				<div class="value_cover">
					<span class="label">총 누적 수강생</span>
					<span class="value">102,300 명</span>
				</div>
			</div>
		</div>
	</div>
</section>	

<section style="padding: 76px 16px;">
	<div class="container px-4">
		<div class="wrapper">
			<div class="text_content">
				<div class="title">
					지식공유자를 위한
					<br>
					높은정산비율
				</div>
				<div class="text text-1">
					보통은 교육컨텐츠 수입의
					<br>
					50% 이상을 플랫폼이나 학원이 가져갑니다
					<br>
					그런데 데브런은
					<br> 
					더 드려요
				</div>
				<div class="text text-2 bold">
					데브런은
					<br>
					<span class="highlighted">강의와 멘토링 수익을 100%</span>
					<br>
					강사/멘토에게 돌려드립니다.
				</div>
				<div class="text text-3">
					이렇답니다
					<br>
					이렇대요
				</div>	
			</div>
			<div class="img_content">
				<img src="https://cdn.inflearn.com/assets/images/become_instructor/graph%403x.png" alt="정산 비율 그래프">
			</div>
			</div>
	</div>
</section>

<section>
	<div class="container px-4">
		<div class="wrapper2">
			<h1 class="section_title">
				<svg width="24" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"></svg>
				"왜 데브런일까요?"
			</h1>
			<div class="row row-cols-2 row-cols-lg-3">
				<div class="col">
					<div class="why_item">
						<div class="image_container">
							<i class="fas fa-badge-percent"></i>
						</div>
						<div class="content_container">
							<h6>지식 콘텐츠를 함부로 다루지 않습니다</h6>
							<p>너무 크고 잦은 할인은 결과적으로 콘텐츠의 질을 떨어뜨리고, 지식의 가치를 존중하지 않는 일이라 생각합니다. 데브런은 합리적인 가격정책으로 모두에게 도움도움</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="why_item">
						<div class="image_container">
							<i class="fas fa-badge-percent"></i>
						</div>
						<div class="content_container">
							<h6>지식 콘텐츠를 함부로 다루지 않습니다</h6>
							<p>너무 크고 잦은 할인은 결과적으로 콘텐츠의 질을 떨어뜨리고, 지식의 가치를 존중하지 않는 일이라 생각합니다. 데브런은 합리적인 가격정책으로 모두에게 도움도움</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="why_item">
						<div class="image_container">
							<i class="fas fa-badge-percent"></i>
						</div>
						<div class="content_container">
							<h6>지식 콘텐츠를 함부로 다루지 않습니다</h6>
							<p>너무 크고 잦은 할인은 결과적으로 콘텐츠의 질을 떨어뜨리고, 지식의 가치를 존중하지 않는 일이라 생각합니다. 데브런은 합리적인 가격정책으로 모두에게 도움도움</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="why_item">
						<div class="image_container">
							<i class="fas fa-badge-percent"></i>
						</div>
						<div class="content_container">
							<h6>지식 콘텐츠를 함부로 다루지 않습니다</h6>
							<p>너무 크고 잦은 할인은 결과적으로 콘텐츠의 질을 떨어뜨리고, 지식의 가치를 존중하지 않는 일이라 생각합니다. 데브런은 합리적인 가격정책으로 모두에게 도움도움</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="why_item">
						<div class="image_container">
							<i class="fas fa-badge-percent"></i>
						</div>
						<div class="content_container">
							<h6>지식 콘텐츠를 함부로 다루지 않습니다</h6>
							<p>너무 크고 잦은 할인은 결과적으로 콘텐츠의 질을 떨어뜨리고, 지식의 가치를 존중하지 않는 일이라 생각합니다. 데브런은 합리적인 가격정책으로 모두에게 도움도움</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="why_item">
						<div class="image_container">
							<i class="fas fa-badge-percent"></i>
						</div>
						<div class="content_container">
							<h6>지식 콘텐츠를 함부로 다루지 않습니다</h6>
							<p>너무 크고 잦은 할인은 결과적으로 콘텐츠의 질을 떨어뜨리고, 지식의 가치를 존중하지 않는 일이라 생각합니다. 데브런은 합리적인 가격정책으로 모두에게 도움도움</p>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>

<section>
	<div class="container px-4">
		<div class="wrapper2">
			<h1 class="section_title">
				<svg width="24" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"></svg>
				"지식공유자가 되어주세요!"
			</h1>
			<div class="tabs is-centered">
				<div class="step e_tab is-active">절차</div>
				<div class="faq e_tab">FAQ</div>
			</div>
			<div class="step_content">
				<div class="step_card">
					<div class="step_title">
						<span class="green">01.</span>
						"신청하고, 강의를 만드세요."
					</div>
					<div class="step_desc">커뮤니케이션 매니저가 강의 제작과 노하우를 공유해드려요!</div>
				</div>
				<div class="step_card">
					<div class="step_title">
						<span class="green">02.</span>
						"동영상을 업로드하고 소개글을 작성해주세요."
					</div>
					<div class="step_desc">커뮤니케이션 매니저가 강의 제작과 노하우를 공유해드려요!</div>
				</div>
				<div class="step_card">
					<div class="step_title">
						<span class="green">03.</span>
						"자기만의 커뮤니티를 만들어보세요."
					</div>
					<div class="step_desc">커뮤니케이션 매니저가 강의 제작과 노하우를 공유해드려요!</div>
				</div>
				<div class="step_card">
					<div class="step_title">
						<span class="green">04.</span>
						"이제 합당한 보상을 받으세요."
					</div>
					<div class="step_desc">커뮤니케이션 매니저가 강의 제작과 노하우를 공유해드려요!</div>
				</div>
			</div>
		</div>	
	</div>
</section>

<section style="background: #fbfbfb; text-align: center; padding: 60px 0 67px;">
	<div class="container px-4">
		<div class="wrapper2">
			<h2 class="title">지금 시작하세요.</h2>
			<p class="subtitle">
				데브런과 함께라면 단계별로 쉽고 간편하게 지식을 나누고 운영할 수 있습니다
				<br>
				지식으로 경제적 보상과 명예를 모두 가져보세요
			</p>
			<div class="buttons">
				<button class="btn btn_primary e-show-form" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#jisikModal">지식공유참여</button>
				<button class="btn btn_light e-show-form">지식공유자 안내서</button>
				<input type="hidden" value="${already}" id="alreadyExist"> 
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
$(function(){
	const f = document.enrollForm;

	let msg = f.exist.value;
	if(msg.length >= 1){
		alert(msg);
	}
	
	let mRole = "${sessionScope.member.memberRole}";
	let numRole = Number(mRole);
	
});
function sendEnroll() {
	const f = document.enrollForm;
	
	let str = f.eMail.value;
	if(! str) {
		f.eMail.focus();
		return;
	} else if (str !== "${sessionScope.member.memberEmail}") {
		alert("아이디와 동일한 메일을 적어주세요");
		f.eMail.focus();
		return;
	}

	str = f.bMail.value;
	if(! str) {
		f.eMail.focus();
		return;
	}
	
	str = f.name.value;
	if(! str) {
		f.name.focus();
		return;
	} else if (str !== "${sessionScope.member.memberName}") {
		alert("회원정보에 등록된 이름과 동일한 이름이 아닙니다.");
		f.name.focus();
		return;
	}
	
	str = f.phone.value;
	let pNumCheck = /^010-\d{4}-\d{4}$/;
	
	if(! pNumCheck.test(str)) {
		alert("전화번호 형식을 지켜주세요");

		f.phone.focus();
		return;
	}
	
	str = f.applyRole.value;
	let mRole = "${sessionScope.member.memberRole}";
	let numRole = Number(mRole);
	if(! str) {
		alert("지원하시는 역할을 선택해주세요");
		return;
	} else if( str === "${sessionScope.member.memberRole}") {
		alert("현재와 동일한 등급으로는 신청할 수 없습니다.");
		return;
	} else if(Number(str) === 10 && numRole === 20 ){
		alert("현재 등급에 추가로 다른 지식공유자를 등록하는 경우에는 '멘토 & 강사' 를 선택해주세요");
		return;
	} else if(Number(str) === 20 && numRole === 10 ){
		alert("현재 등급에 추가로 다른 지식공유자를 등록하는 경우에는 '멘토 & 강사' 를 선택해주세요");
		return;
	}
		
	str = f.category.value;
	if(! str) {
		alert("지원하시는 분야를 선택해주세요");
		return;
	}
	
	str = f.category.value;
	if(! str) {
		alert("지원하시는 분야를 선택해주세요");
		return;
	}

	

	str = window.editor.getData().trim();
    if(! str) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
    f.intro.value = str;
	
	
	//let query= $("form[name=enrollForm]").serialize();
	//alert(query);
	f.action="${pageContext.request.contextPath}/member/infoShare/enroll";
	f.submit();
}
</script>

<script type="text/javascript">
ClassicEditor
.create(document.querySelector('#editorIntro'), {
	fontFamily: {
        options: [
            'default',
            '맑은 고딕, Malgun Gothic, 돋움, sans-serif',
            '나눔고딕, NanumGothic, Arial'
        ]
    },
    fontSize: {
        options: [
            9, 11, 13, 'default', 17, 19, 21
        ]
    },
	toolbar: {
		items: [
			'heading','|',
			'fontFamily','fontSize','bold','italic','fontColor','|',
			'alignment','bulletedList','numberedList','|',
			'imageUpload','insertTable','sourceEditing','blockQuote','mediaEmbed','|',
			'undo','redo','|',
			'link','outdent','indent','|',
		]
	},
	image: {
        toolbar: [
            'imageStyle:full',
            'imageStyle:side',
            '|',
            'imageTextAlternative'
        ],

        // The default value.
        styles: [
            'full',
            'side'
        ]
    },
	language: 'ko',
	ckfinder: {
        uploadUrl: '${pageContext.request.contextPath}/image/upload' // 업로드 url (post로 요청 감)
    }
})
.then( editor => {
	window.editor = editor;
})
.catch( err => {
	console.error( err.stack );
});

</script>