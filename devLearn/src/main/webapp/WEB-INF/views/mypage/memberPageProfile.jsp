<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

 <style type="text/css">


.myProfile {
	width: 100%;
	min-height: 800px;
	padding: 20px 0 0 40px;
	position: relative;
}

.user-info {
	border-bottom: 1px solid #eee;	
}

.user-pictuer-edit {
	width: 60px;
	height: 60px;
	position: absolute;
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 30px;
	text-align: center;
	font-size: 25px;
}

.user-pictuer-edit-div {
	text-align: center;
}

.introduce {
	padding: 20px 0;
	border-bottom: 1px solid #eee; 
}

.introduce-title {
	height: 50px;
	border-bottom: 2px solid #BDBDBD;
	font-size: 18px;
}

.introduce-title span {
	font-size: 25px;
	font-weight: 800;
}

.introduce-title button {
	font-size: 18px;
	font-weight: 800;
}

.introdus-content {
	padding: 24px 0;
	min-height: 750px;
	border: 1px solid lightgray;
	border-radius: 4px;
}

.profile-img {
	text-align: center;
	border-radius: 50%;
	width: 300px;
	height: 300px;
	background-image: url("https://cdn.inflearn.com/public/main/profile/default_profile.png");
	cursor: pointer;
	z-index: 9999;
	margin: 24px auto;
}


label {
	font-size: 21px;
	font-weight: bold;
	color: gray;
	text-align: left;
}

label {
	font-size: 21px;
	font-weight: bold;
	color: gray;
	text-align: left;
}


.ck.ck-editor {
   max-width: 97%;
   overflow-y: scroll;
}

.ck-editor__editable {
    min-height: 250px;
    max-height: 250px;
}


.save1 {
	text-align: center;
}

.save1 button {
	font-size: 23px;
	font-weight: bold;
}

</style>

<jsp:include page="memberPage.jsp"/>

	
	<div class="myProfile">
		<div class="introduce">
			<div class="introduce-title d-flex justify-content-between align-items-center py-5 px-3">
				<span>프로필 설정</span>
				<!-- 
				<button class="btn btn-primary" id="edit-modal" data-bs-toggle="modal" data-bs-target="#editModal">개인정보수정</button>
				 -->
			</div>
			<div class="introdus-content my-4 mx-3">
				<form name="myInfo" class="myInfo px-5" method="post" enctype="multipart/form-data">
					<!-- 
					<div class="user-pictuer-edit-div">
						<button class="user-pictuer-edit"><i class="fa-solid fa-pen"></i></button>
					</div>
					 -->
					<div class="profile-img my-4">
					</div>
					<input type="file" class="img" name="selectFile" accept="image/*" style="display: none;">
					
					<div class="nick my-4">
						<label class="form-label">닉네임</label>
						<input type="text" class="form-control" name="memberNickname" value="${sessionScope.member.memberNickname}">
					</div>
					<div class="my-introduce">
						<label class="form-label">자기소개</label>
						<div class="editor">${dto.intro}</div>
						<input type="hidden" name="intro">
					</div>
					
					<div class="mail my-4">
						<label class="form-label">비지니스 메일</label>
						<input type="email" name="businessEmail" class="form-control" id="exampleFormControlInput1" value="${dto.businessEmail}" placeholder="name@example.com">
					</div>
					
					<div class="phone my-4">
						<label class="form-label">휴대폰</label>
						<input type="text" class="form-control" name="phoneNum" value="${dto.phoneNum}" placeholder="010-0000-0000">
					</div>
					
					<p class="save1 my-5">
						<input type="hidden" name="saveFileName" value="${dto.saveFileName}">
						<button type="button" class="btn btn-primary px-5" onclick="profileSave();">저장하기</button>
					</p>
				</form>
			</div>
		</div>
	</div>
	
	

<script type="text/javascript">
$(function() {
	var img = "${dto.saveFileName}";
	if( img ) { // 수정인 경우
		img = "${pageContext.request.contextPath}/uploads/profile/" + img;
		$(".profile-img").empty();
		$(".profile-img").css("background-image", "url("+img+")");
	}
	
	$(".profile-img").click(function(){
		$("form[name=myInfo] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=myInfo] input[name=selectFile]").change(function(){
		var file=this.files[0];
		if(! file) {
			$(".profile-img").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/profile/" + img;
				$(".profile-img").css("background-image", "url("+img+")");
			} else {
				img = "https://cdn.inflearn.com/public/main/profile/default_profile.png";
				$(".profile-img").css("background-image", "url("+img+")");
			}
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".profile-img").empty();
			$(".profile-img").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});



function profileSave() {
	const f = document.myInfo;
	
	let url = "${pageContext.request.contextPath}/mypage/profile/submit";
	let str;
	
	str = window.editor.getData().trim();
    if(! str) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
    f.intro.value = str;
	
	f.action = url;
	f.submit();
	
}
	
</script>
<script type="text/javascript">
    ClassicEditor
    .create( document.querySelector( '.editor' ), {
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
