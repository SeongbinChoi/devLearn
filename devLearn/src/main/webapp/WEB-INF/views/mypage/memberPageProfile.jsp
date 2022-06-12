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
<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <style type="text/css">

.sidebar {
	padding: 40px 40px 0 0;
	width: 20%;
	height: 800px;
	border-right: 1px solid #eee;
}

.myProfile {
	width: 80%;
	min-height: 800px;
	padding: 20px 0 0 40px;
	position: relative;
}

.user-info {
	border-bottom: 1px solid #eee;	
}
.user-pictuer {
	width: 70px;
}
.user-pictuer-edit {
	position: absolute;
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 25px;
	text-align: center;
}

.introduce {
	padding: 20px 0;
	border-bottom: 1px solid #eee; 
}

.introduce-title {
	height: 50px;
	border-bottom: 1px solid #eee;
	font-size: 18px;
}

.introduce-title span {
	font-size: 20px;
	font-weight: 800;
}

.introdus-content {
	padding: 24px 0;
	min-height: 700px;
	text-align: center;
}


</style>
</head>
<body>


<div class="container d-flex">
	<div class="sidebar">
		<div class="user-info d-flex align-items-center">
			<h3 class="flex-grow-1">userID</h3>
			<div class="user-pictuer d-flex align-items-btween">
				<div class="user-pictuer-edit-div">
					<button class="user-pictuer-edit" data-bs-toggle="modal" data-bs-target="#editProfilePic"><i class="fa-solid fa-pen"></i></button>
				</div>
				<figure class="figure">
					<img src="https://cdn.inflearn.com/public/main/profile/default_profile.png" class="is-rounded rounded-circle" alt="" style="width: 60px;">
				</figure>
			</div>
		</div>
	</div>
	
	<div class="myProfile">
		<div class="introduce">
			<div class="introduce-title d-flex justify-content-between align-items-center">
				<span>내 소개</span>
				<button class="btn btn-primary" id="edit-modal" data-bs-toggle="modal" data-bs-target="#editModal">편집</button>
			</div>
			<div class="introdus-content">
				소개가 존재하지 않습니다.
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
</div>

</body>
<script type="text/javascript">
	let edit-modal = document.getElementById('edit-modal');
	let edit-input = document.getElementById('edit-input');
	
	edit-modal.addEventListener('shown.bs.modal', function(){
		edit-input.focus();
		
	});
	
	
</script>
</html>