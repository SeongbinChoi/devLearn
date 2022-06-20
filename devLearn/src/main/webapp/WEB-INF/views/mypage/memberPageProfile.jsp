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
}

.profile-img .is-rounded {
	border-radius: 50%;
	width: 300px;
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
				<button class="btn btn-primary" id="edit-modal" data-bs-toggle="modal" data-bs-target="#editModal">개인정보수정</button>
			</div>
			<div class="introdus-content my-4 mx-3">
				<form name="my-info" class="my-info px-5">
					<div class="user-pictuer-edit-div">
						<button class="user-pictuer-edit" data-bs-toggle="modal" data-bs-target="#editProfilePic"><i class="fa-solid fa-pen"></i></button>
					</div>
					<div class="profile-img my-4">
						<img alt="profile" src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded">
					</div>
					
					<div class="nick my-4">
						<label class="form-label">닉네임</label>
						<input type="text" class="form-control">
					</div>
					<div class="my-introduce">
						<label class="form-label">자기소개</label>
						<div class="editor"></div>
					</div>
					
					<div class="mail my-4">
						<label class="form-label">비지니스 메일</label>
						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
					</div>
					
					<div class="phone my-4">
						<label class="form-label">휴대폰</label>
						<input type="text" class="form-control" placeholder="010-0000-0000">
					</div>
					
					<p class="save1 my-5">
						<button type="button" class="btn btn-primary px-5">저장하기</button>
					</p>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 프로필사진 Modal -->
	<div class="modal fade" id="editProfilePic" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">프로필사진 편집</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        ckeditor..
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary">저장</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 자기소개 Modal -->
	<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">내 소개 편집</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        ckeditor..
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary">저장</button>
	      </div>
	    </div>
	  </div>
	</div>


<script type="text/javascript">
	let edit-modal = document.getElementById('edit-modal');
	let edit-input = document.getElementById('edit-input');
	
	edit-modal.addEventListener('shown.bs.modal', function(){
		edit-input.focus();
		
	});
	
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
