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
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}
function categoryChange(e) {
	var sel = ["--선택--"];
	var dev = ["웹 개발", "프론트엔드", "백엔드", "풀스택"];
	var seq = ["보안", "시스템", "클라우드", "블록체인"];
	var data = ["데이터분석", "인공지능", "데이터 시각화", "데이터 수집"];
	var etc = ["크리에이티브", "직무", "마케팅", "교양"];
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
        alert("제목을 입력하세요. ");
        f.lectureTitle.focus();
        return;
    }
    
    str = f.lectureSummary.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.lectureSummary.focus();
        return;
    }

    str = f.mainCategory.value;
    if(str == "1") {
        alert("카테고리을 입력하세요. ");
        f.mainCategory.focus();
        return;
    }
    
   
    
    str = f.lecturePrice.value.trim();
    if(!str) {
        alert("가격을 입력하세요. ");
        f.lecturePrice.focus();
        return;
    }
 
    if(!f.selectFile.value ) {
        alert("이미지 파일을 추가 하세요. ");
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
	document.getElementById("#lectureDuration2").value = null ;
}

$(function(){
	$('#thumbupload').click(function(){
		alert("썸네일 업로드");
	});
})

$(function(){
	$("form select[name=mainCategory]").change(function(){
		$("form select[name=categoryCode]").empty();
		$("form select[name=categoryCode]").append("<option value=''>--선택--</option>");
		
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
		<h4 class="heading">강의제작</h4>
	    <h3 class="heading">강의정보</h3>
	</div>

	<div class="lecture_def">
	<form name="lectureForm" method="post" enctype="multipart/form-data">
		<label for="lecture_sum" class="label input_label">
        	<span>강의 제목</span>
        </label>
        
        <input type="text" name="lectureSubject" value="${dto.lectureSubject}" class="form-control" id="lectureTitle" placeholder="ex) 인프런 사용법"  style="margin-top: 10px;">
        
        
		<div class="wrapper">
			<label for="lecture_sum" class="label input_label">
	        	<span>강의 두줄 요약</span>
	        	<small>(해당내용은 강의소개에서 보여집니다.)</small>
	        </label>
	        
	        <textarea class="form-control" id="lectureSummary" rows="3" 
	        placeholder="ex) 이 강의를 통해 수강생은 검퓨터 공학의 기초를 다질 수 있을 것으로 예상합니다." style="height: 150px; margin-top: 10px;"></textarea>
    	</div>
    	
    	<div class="wrapper">
			<label for="lecture_sum" class="label input_label">
	        	<span>강사</span>
	        </label>
	        
	        <input type="email" class="form-control" id="memberEmail" name="memberEmail" readonly="readonly" value="${sessionScope.member.memberEmail}">
    	</div>
    	
    	<div class="wrapper">
	    	<label for="lecture_sum" class="label input_label">
	        	<span>카테고리</span>
	        </label>
			
			<select class="form-select" name="mainCategory" style="margin-top: 10px;">
				  <option value="">:: 선택 ::</option>
				  <c:forEach items="${listCategory}" var="vo">
				  	<option value="${vo.categoryCode}" <c:if test="${vo.categoryCode eq dto.categoryCode}"> selected="selected</c:if>>${vo.categoryName}</option>
				  </c:forEach>
			</select>
    	</div>
    
    	<label for="lecture_sum" class="label input_label" style="margin-top: 20px;">
        	<span>카테고리 상세</span>
        </label>
		
		<select class="form-select" name="categoryCode" style="margin-top: 10px;">
			  <option value="">:: 선택 ::</option>
			  <c:forEach var="vo" items="${listSubCategory}">
			  		<option value="${vo.categoryCode}" ${vo.categoryCode==dto.categoryCode ? "selected='selected'":""}>${vo.categoryName}</option>
			  </c:forEach>
		</select>
			
    	<section style="background: #eaeaea; text-align: center; padding: 60px 0 67px; margin-top: 50px; margin-bottom: 50px;">
			<div class="container px-4">
				<div class="wrapper2">
					<h2 class="title">◎소개글은 강의의 인상을 좌우합니다.●</h2>
					<p class="subtitle">
						소개글이 매력적일수록 수강생의 선택을 받을 확률이 높아집니다
						학생들이 강의 소개를 볼때 수강하고 싶도록 마음껏 내 강의의 매력을 어필해 보세요.
						그래프, 사진, 영상등 설득될만한 자료는 모든 좋아요!
						<br>
						혹시 강의 소개작성이 막막한분들은 화이팅!
					</p>
				</div>
			</div>
		</section>    

        <label for="lecture_sum" class="label input_label">
        	<span>강의 상세 내용</span>
        	<small>(해당내용은 강의소개에서 보여집니다.)</small>
        </label>
        
        <textarea class="form-control" name="lectureContent" id="lectureContent" rows="3" 
        placeholder=" - 강의소개는 최소 10줄 이상 작성해 주세요!" style="height: 150px; margin-top: 10px;">${dto.lectureContent}</textarea>
    	
		
    	<div class="wrapper">
	    	<label for="lecture_sum" class="label input_label">
	        	<span>가격 설정</span>
	        </label>
	        
	        <input type="text" class="form-control" name="lecturePrice" id="lecturePrice" placeholder="" value="${dto.lecturePrice}" style="margin-top: 10px; width: 30%;">
     	</div>
     	
     	<div class="wrapper">
	    	<label for="lecture_sum" class="label input_label">
	        	<span>강의 할인율</span>
	        </label>
	        
	        <input type="text" class="form-control" name="dcPercent" id="dcPercent" placeholder="" value="${dto.dcPercent}" style="margin-top: 10px; width: 30%;">
     	</div>
     	
     	<div class="wrapper">
	     	<label for="lecture_sum" class="label input_label">
	        	<span>수강 기한</span>
	        </label>
	        <div class="duration_cover">
			    <div class="d-grid gap-2 d-md-block">
			  		<div class="buttons">
			  			<button class="btn btn-secondary" type="button" onclick="offDisplay();">무제한</button>
			 			<button class="btn btn-outline-secondary" type="button" onclick="onDisplay();">제한</button>
					</div>
				</div>
				<div class="duration">
					<select class="form-select" id="lectureDuration" style="margin-top: 10px; margin-left: 30px; text-align: center; display: none; width:100px; height : 50px;">
					  <option value="0">기간</option>
					  <option value="1">년</option>
					  <option value="2">월</option>
					  <option value="3">일</option>
					</select>
					<input type="text" class="form-control" name="lectureDuration" id="lectureDuration2" placeholder="기간을 입력해주세요" value="${dto.lectureDuration}" style="margin-top: 10px; margin-left: 30px; text-align: center; display: none; width: 200px; height: 50px;">
				</div>
			</div>
		</div>
		
		<div class="wrapper">
	     	<label for="lecture_sum" class="label input_label">
	        	<span>썸네일</span>
	        </label>
	         <div class="card_cover">
	         	<div class="lec_img">       		
	         	</div>
	         	<div class="lec_value">
	         		<label for="thumb_nail" class="label input_label">	
						<span style="font-size: 15px;">강의를 대표하는 이미지</span>
						<br>
						<small style="color: #A6A6A6;">확장자: jpg, jpeg, png, 이미지에 한글을 포함할 수 없습니다</small>
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
    	<button type="button" class="btn btn-outline-secondary" onclick="sendOk();">저장 후 다음이동</button>
	 </div>
	
	<!-- ck에디터 -->
	<script type="text/javascript">
		ClassicEditor
		   .create( document.querySelector( '#lectureContent' ), {
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

</div>
</main>

</body>
</html>