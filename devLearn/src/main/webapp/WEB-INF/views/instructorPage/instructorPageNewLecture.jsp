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
</style>
<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/dev";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("?????? ????????? ?????? ????????????.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}
function categoryChange(e) {
	var sel = ["--??????--"];
	var dev = ["??? ??????", "???????????????", "?????????", "?????????"];
	var seq = ["??????", "?????????", "????????????", "????????????"];
	var data = ["???????????????", "????????????", "????????? ?????????", "????????? ??????"];
	var etc = ["??????????????????", "??????", "?????????", "??????"];
	var target = document.getElementById("subCategory");
	
	if(e.value == "1")
		var sub = sel;
	else if(e.value == "2")
		var sub = dev;
	else if(e.value == "3")
		var sub = seq;
	else if(e.value == "4")
		var sub = data;
	else if(e.value == "5")
		var sub = etc;
	
	target.options.length = 0;
	
	for(x in sub) {
		var opt = document.createElement("option");
		opt.value = sub[x];
		opt.innerHTML = sub[x];
		target.appendChild(opt);
	}
}

$(function() {
	var img = "${dto.thumbNail}";
	if( img ) { 
		img = "${pageContext.request.contextPath}/uploads/thumbNail/" + img;
		$(".lec_img").empty();
		$(".lec_img").css("background-image", "url("+img+")");
	}
	
	$(".lec_img").click(function(){
		$("form[name=lectureForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=lectureForm] input[name=selectFile]").change(function(){
		var file=this.files[0];
		if(! file) {
			$(".lec_img").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/thumbNail/" + img;
				$(".lec_img").css("background-image", "url("+img+")");
			} else {
				img = "${pageContext.request.contextPath}/resources/no_image.gif";
				$(".lec_img").css("background-image", "url("+img+")");
			}
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".lec_img").empty();
			$(".lec_img").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});

function sendOk() {
    var f = document.lectureForm;
	var str;
    str = f.lectureTitle.value.trim();
    if(!str) {
        alert("????????? ???????????????. ");
        f.lectureTitle.focus();
        return;
    }
    
    str = f.lectureSummary.value.trim();
    if(!str) {
        alert("????????? ???????????????. ");
        f.lectureSummary.focus();
        return;
    }

    str = f.mainCategory.value;
    if(str == "1") {
        alert("??????????????? ???????????????. ");
        f.mainCategory.focus();
        return;
    }
    
   
    
    str = f.lecturePrice.value.trim();
    if(!str) {
        alert("????????? ???????????????. ");
        f.lecturePrice.focus();
        return;
    }
 
    if(!f.selectFile.value ) {
        alert("????????? ????????? ?????? ?????????. ");
        f.selectFile.focus();
        return;
	}    

    f.action = "${pageContext.request.contextPath}/instructorPage/instructorPageNewLecture2";
    f.submit();
}

function onDisplay() {
	$('#lectureDuration').show();
	$('#lectureDuration2').show();
}

function offDisplay() {
	$('#lectureDuration').hide();
	$('#lectureDuration2').hide();
	document.getElementById('lectureDuration2').value??= null;
}

$(function(){
	$('#thumbupload').click(function(){
		alert("????????? ?????????");
	});
})

$(function(){
	$("form select[name=mainCategory]").change(function(){
		$("form select[name=categoryCode]").empty();
		$("form select[name=categoryCode]").append("<option value=''>--??????--</option>");
		
		var mainCategory = $(this).val();
		if(! mainCategory) {
			return false;
		}
		
		var url = "${pageContext.request.contextPath}/instructorPage/subCategory";
		var query = "mainCategory="+mainCategory;
		const fn = function(data){
			$(data.listSubCategory).each(function(index, item){
				var categoryCode = item.categoryCode;
				var categoryName = item.categoryName;
				
				var s = "<option value='"+categoryCode+"'>"+categoryName+"</option>";
				$("form select[name=categoryCode]").append(s);		
			});
		};
		
		ajaxFun(url, "get", query, "json", fn);
	});
});
</script>
</head>
<body>
<main>
<jsp:include page="/WEB-INF/views/instructorPage/instructorPage.jsp"/>
<div class="lecture_edit_container">
	<div class="heading_cover">
		<h4 class="heading">????????????</h4>
	    <h3 class="heading">????????????</h3>
	</div>

	<div class="lecture_def">
	<form name="lectureForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/instructorPage/instructorPageNewLecture3">
		<label for="lecture_sum" class="label input_label">
        	<span>?????? ??????</span>
        </label>
        
        <input type="text" name="lectureSubject" value="${dto.lectureSubject}" class="form-control" id="lectureTitle" placeholder="ex) ????????? ?????????"  style="margin-top: 10px;">
        
        
		<div class="wrapper">
			<label for="lecture_sum" class="label input_label">
	        	<span>?????? ?????? ??????</span>
	        	<small>(??????????????? ?????????????????? ???????????????.)</small>
	        </label>
	        
	        <textarea class="form-control" name="lectureSummary" id="lectureSummary" rows="3" 
	        placeholder="ex) ??? ????????? ?????? ???????????? ????????? ????????? ????????? ?????? ??? ?????? ????????? ???????????????." style="height: 150px; margin-top: 10px;">${dto.lectureSummary}</textarea>
    	</div>
    	
    	<div class="wrapper">
			<label for="lecture_sum" class="label input_label">
	        	<span>??????</span>
	        </label>
	        
	        <input type="email" class="form-control" id="memberEmail" name="memberEmail" readonly="readonly" style="margin-top: 10px;" value="${sessionScope.member.memberEmail}">
    	</div>
    	
    	<div class="wrapper">
	    	<label for="lecture_sum" class="label input_label">
	        	<span>????????????</span>
	        </label>
			
			<select class="form-select" name="mainCategory" style="margin-top: 10px;">
				  <option value="">:: ?????? ::</option>
				  <c:forEach items="${listCategory}" var="vo">
				  	<option value="${vo.categoryCode}" <c:if test="${vo.categoryCode eq dto.categoryCode}"> selected="selected</c:if>>${vo.categoryName}</option>
				  </c:forEach>
			</select>
    	</div>
    
    	<label for="lecture_sum" class="label input_label" style="margin-top: 20px;">
        	<span>???????????? ??????</span>
        </label>
		
		<select class="form-select" name="categoryCode" style="margin-top: 10px;">
			  <option value="">:: ?????? ::</option>
			  <c:forEach var="vo" items="${listSubCategory}">
			  		<option value="${vo.categoryCode}" ${vo.categoryCode==dto.categoryCode ? "selected='selected'":""}>${vo.categoryName}</option>
			  </c:forEach>
		</select>
			
    	<section style="background: #eaeaea; text-align: center; padding: 60px 0 67px; margin-top: 50px; margin-bottom: 50px;">
			<div class="container px-4">
				<div class="wrapper2">
					<h2 class="title">??????????????? ????????? ????????? ???????????????.???</h2>
					<p class="subtitle">
						???????????? ?????????????????? ???????????? ????????? ?????? ????????? ???????????????
						???????????? ?????? ????????? ?????? ???????????? ????????? ????????? ??? ????????? ????????? ????????? ?????????.
						?????????, ??????, ????????? ??????????????? ????????? ?????? ?????????!
						<br>
						?????? ?????? ??????????????? ?????????????????? ?????????!
					</p>
				</div>
			</div>
		</section>    

        <label for="lecture_sum" class="label input_label">
        	<span>?????? ?????? ??????</span>
        	<small>(??????????????? ?????????????????? ???????????????.)</small>
        </label>
        
        <textarea class="form-control" name="lectureContent" id="lectureContent" rows="3" 
        placeholder=" - ??????????????? ?????? 10??? ?????? ????????? ?????????!" style="height: 150px; margin-top: 10px;">${dto.lectureContent}</textarea>
    	
		
    	<div class="wrapper">
	    	<label for="lecture_sum" class="label input_label">
	        	<span>?????? ??????</span>
	        </label>
	        
	        <input type="text" class="form-control" name="lecturePrice" id="lecturePrice" placeholder="" value="${dto.lecturePrice}" style="margin-top: 10px; width: 30%;">
     	</div>
     	
     	<div class="wrapper">
	    	<label for="lecture_sum" class="label input_label">
	        	<span>?????? ?????????</span>
	        </label>
	        
	        <input type="text" class="form-control" name="dcPercent" id="dcPercent" placeholder="" value="${dto.dcPercent}" style="margin-top: 10px; width: 30%;">
     	</div>
     	
     	<div class="wrapper">
	     	<label for="lecture_sum" class="label input_label">
	        	<span>?????? ??????</span>
	        </label>
	        <div class="duration_cover">
			    <div class="d-grid gap-2 d-md-block">
			  		<div class="buttons">
			  			<button class="btn btn-secondary" type="button" onclick="offDisplay();">?????????</button>
			 			<button class="btn btn-outline-secondary" type="button" onclick="onDisplay();">??????</button>
					</div>
				</div>
				<div class="duration">
					<input type="text" class="form-control" name="lectureDuration" id="lectureDuration2" placeholder="??????(??? ??????)??? ??????????????????" value="${dto.lectureDuration}" style="margin-top: 10px; margin-left: 30px; text-align: center; display: none; width: 250px; height: 50px;">
				</div>
			</div>
		</div>
		
		<div class="wrapper">
	     	<label for="lecture_sum" class="label input_label">
	        	<span>?????????</span>
	        </label>
	         <div class="card_cover">
	         	<div class="lec_img">       		
	         	</div>
	         	<div class="lec_value">
	         		<label for="thumb_nail" class="label input_label">	
						<span style="font-size: 15px;">????????? ???????????? ?????????</span>
						<br>
						<small style="color: #A6A6A6;">?????????: jpg, jpeg, png, ???????????? ????????? ????????? ??? ????????????</small>
					</label>
					
					<input type="file" name="selectFile" class="form-control" accept="image/*" style="width: 500px; margin-top: 15px;">
	         		
	         		<div class="justify-content-md-end btn-group" style="float : right; margin-top: 50px; margin-right: 10px;">
					</div>
	         	</div>
	         </div>
						
		</div>
      </form>
     </div>
        
     
     <div class="button_container">   
    	<button type="button" class="btn btn-outline-secondary" onclick="sendOk();">?????? ??? ????????????</button>
	 </div>
	
	<!-- ck????????? -->
	<script type="text/javascript">
		ClassicEditor
		   .create( document.querySelector( '#lectureContent' ), {
		      fontFamily: {
		            options: [
		                'default',
		                '?????? ??????, Malgun Gothic, ??????, sans-serif',
		                '????????????, NanumGothic, Arial'
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
		           uploadUrl: '${pageContext.request.contextPath}/image/upload' // ????????? url (post??? ?????? ???)
		       }
		   })
		   .then( editor => {
		      window.editor = editor;
		   })
		   .catch( err => {
		      console.error( err.stack );
		   });
	
	</script>

</div>
</main>

</body>
</html>