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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>
<style type="text/css">
.lecture_edit_container {
    margin-top: 16px;
    border: 1px solid #efefef;
    padding: 2rem;
}

.heading_cover {
    max-width: 1056px;
}

.lecture_edit_container h4.heading {
    margin-top: 0.5rem;
    font-size: 12px;
    font-weight: 800;
    line-height: 1;
    color: #747474;
    text-align: left;
}

.lecture_edit_container h3.heading {
    margin-top: 0.5rem;
    font-size: 18px;
    font-weight: 800;
    line-height: 1;
    color: #313131;
    text-align: left;
}
.lecture_edit_container .lecture_def {
	margin-top: 16px;
    border: 1px solid #efefef;
    padding: 2rem;
}


.lecture_def .label span {
    color: #595959;
    font-size: 1rem;
    font-weight: 800;
}

.lecture_def  .label small {
    color: #ff645c;
}

.container .wrapper2 {
	max-width: 1314px;
	margin: 0 auto;
}

.title {
    color: #000a12;
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 1.43rem;
}

.subtitle {
    font-size: 16px;
    color: #747474;
    margin-bottom: 1.75rem;
    margin-top: auto;
    font-weight: 600;
}

.button_container {
    display: flex;
    justify-content: center;
    margin-top: 32px;
}

.button_container .btn.btn-outline-secondary {
    font-weight: bold;
    color : black;
}

.wrapper {
	margin-top: 50px;
}

.buttons>button {
	font-weight: bold; 
	margin-top: 10px;
	margin-right: 8px; 
	margin-bottom: 8px; 
	height: 45px;
	width : 90px;
}

.card_cover {
	display: flex;
	margin-top: 20px;
}

.card_cover .lec_img {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 300px;
	height: 200px;
	background-image: url("${pageContext.request.contextPath}/resources/images/no_image.gif");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}

img {
	max-width: 100%;
 	max-height: 100%;
}

.card_cover .lec_value {
	padding : 10px;
}

.btn-group {

}


.ck-editor__editable {
	height: 250px;
}

.wrapper .duration_cover {
	display: flex;
}

.duration {
	display: flex;
}

.box > p{
	display: flex;
}

.lec_video {
	background: #eaeaea; 
	text-align: center; 
	padding: 60px 0 67px; 
	margin-top: 20px; 
	margin-bottom: 50px;
}

.lectureVideo {
	position: static;
    width: 100%;
    height: 100%;
    object-fit: contain;
    transition: filter 0.2s linear 0s;
    min-height: auto;
    max-height: none;
    min-width: auto;
}
</style>
<script>
function sendOk() {
    var f = document.videoForm;
	   

    f.action = "${pageContext.request.contextPath}/instructorPage/instructorPageLectureList";
    f.submit();
}

const add_textbox = () => {
	const box = document.getElementById("box");
	const newP = document.createElement('p');
	newP.innerHTML = "<input type='text' readonly='readonly' class='form-control' placeholder='영상 추가하기 (강의명[영상 이름]이 들어갈 예정)' style='margin-top: 10px; margin-right: 30px; margin-left: 30px;'>"+
	" <input type='button' class='btn btn-secondary' value='영상삭제' onclick='remove(this)' style='margin-top: 10px; margin-right: 20px;'>"+
	" <input type='button' class='btn btn-secondary' value='영상추가' data-bs-toggle='modal' data-bs-target='#videoModal' style='margin-top: 10px;'>";
	box.appendChild(newP);
}
const remove = (obj) => {
	document.getElementById('box').removeChild(obj.parentNode);
}
      
$(function() {
	var video = "${dto.videoTitle}";
	if( video ) { 
		video = "${pageContext.request.contextPath}/uploads/Lecturevideo/" + video;
		$(".lectureVideo").empty();
		$("#lvideo").attr("src", "video");
	}
	
	$(".lectureVideo").click(function(){
		$("form[name=videoForm] input[name=videoSelectFile]").trigger("click"); 
	});
	
	$("form[name=videoForm] input[name=videoSelectFile]").change(function(){
		var file=this.files[0];
		if(! file) {
			$("lectureVideo").empty();
			if( video ) {
				video = "${pageContext.request.contextPath}/uploads/Lecturevideo/" + video;
				$("#lvideo").attr("src", "video");
			} else {
				video = "";
				$("#lvideo").attr("src", "video");
			}
			return false;
		}
		
		if(! file.type.match("video.*")) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".lectureVideo").empty();
			$("#lvideo").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
	});
});

$(function(){
	$('#videoupload').click(function(){
		alert("비디오 업로드");
	});
})



window.addEventListener("load", function(){
	const inputFileEl = document.querySelector("form input[name=videoSelectFile]");
	const inputTimeEl = document.querySelector("form input[name=fileTotalTime]");
	const videoEl = document.getElementById("lvideo");
	
	inputFileEl.addEventListener("change", function(){
		const file = inputFileEl.files[0];
		if(! file) {
			return;
		}
		const videoUrl = URL.createObjectURL(file);
		videoEl.setAttribute("src", videoUrl);
		  
		videoEl.onloadedmetadata = function() {
			const secondsNumber = parseInt(videoEl.duration);
			let hours = Math.floor(secondsNumber / 3600);
			let minutes = Math.floor((secondsNumber - hours * 3600) / 60);
			let seconds = secondsNumber - hours * 3600 - minutes * 60;
			  
			inputTimeEl.value = secondsNumber;
		};
	});
});
</script>
</head>
<body>
<main>
<jsp:include page="/WEB-INF/views/instructorPage/instructorPage.jsp"/>
<div class="lecture_edit_container">
	<div class="heading_cover">
		<h4 class="heading">강의제작</h4>
	    <h3 class="heading">커리큘럼</h3>
	</div>

	<div class="lecture_def">
	<form name="lectureForm" method="post" enctype="multipart/form-data">
		<label for="lecture_sum" class="label input_label">
        	<span>챕터- 영상 추가하기</span>
        </label>
        
        <div id="box" class="box">
        	<div id="box2" style="display: flex;">
            	<input type="text" class="form-control" placeholder="ex) 챕터의 이름을 입력하세요." style="margin-top: 10px; margin-right: 30px; margin-bottom: 25px;"> 
            	<input type="button" class="btn btn-secondary" value="추가" onclick="add_textbox()" style="margin-top: 10px; margin-bottom: 25px;">
        	</div>
        </div>
		
      </form>
     </div>
        
     
     <div class="button_container">   
    	<button type="button" class="btn btn-outline-secondary" onclick="sendOk();">강의 등록완료</button>
	 </div>
	 
	 <!-- Modal -->
	 <form name="videoForm" method="post">
	<div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">강의영상</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="mb-3">
		      <label for="lecture_sum" class="label input_label">
		        	<span>챕터</span>
		      </label>
		    
		      <input type="text" class="form-control" name="chapter" id="chapter" placeholder="챕터를 입력하시오" value="${dto.chapter}" style="margin-top: 10px; margin-bottom: 20px;  width: 30%;">
	     	</div>
	      	<div class="mb-3">
				<label for="lecture_sum" class="label input_label">
        			<span>강의 명</span>
        	  	</label>
        
        		<input type="text" value="${dto.videoTitle}" name="videoTitle" class="form-control" id="videoTitle" placeholder="ex) 강의명을 입력해주세요."  style="margin-top: 10px;">
			</div>
			<div class="mb-3 tab-content" id="community_tabContent">
				<label for="lecture_sum" class="label input_label" style="margin-top: 40px;">
	        		<span>강의영상 미리보기</span>
	        	</label>
				<div class="lec_video">
					<video class="lectureVideo" src="" id="lvideo" controls="controls"></video>
				</div>
			</div>
			<div class="mb-3">
				<label for="thumb_nail" class="label input_label">	
					<span style="font-size: 15px;">강의영상 올리기</span>
					<br>
					<small style="color: #A6A6A6;">확장자: mkv, avi, mp4</small>
				</label>
					
				<input type="file" name="videoSelectFile" class="form-control" accept="video/*" style="width: 500px; margin-top: 15px; margin-bottom: 30px;">
			</div>
			<div class="mb-3">
				<label for="lecture_sum" class="label input_label">
	        		<span>영상 재생시간</span>
	        	</label>
	        	<input type="text" class="form-control" id="fileTotalTime" name="fileTotalTime" value="${dto.fileTotalTime}" readonly="readonly" placeholder=" 재생시간이 들어갈 예정"  style="margin-top: 10px;">
			</div>
			<input type="hidden" name="lectureNum" id="lectureNum" value="${dto.lectureNum}">
			<div class="mt-5 mb-3">
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button class="btn btn-outline-secondary" type="button" data-bs-dismiss="modal">취소</button>
					<button class="btn btn-outline-secondary" type="button" onclick="sendOk();">저장</button>
				</div>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
​</form>
	
	

</div>
</main>
</body>
</html>	