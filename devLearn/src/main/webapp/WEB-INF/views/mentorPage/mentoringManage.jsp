<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.body-container {
	max-width: 800px;
}

.ck.ck-editor {
	max-width: 97%;
}
.ck-editor__editable {
    min-height: 400px;
}
.ck-content .image>figcaption {
	min-height: 25px;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mentoringManage.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>
<script type="text/javascript">
$(function() {
	
});

function sendOk() {
	let f = document.mentoringManageForm;
	let str;
	
	if(! f.mentorSubject.value.trim()) {
		alert("제목을 입력하세요.");
		f.mentorSubject.focus();
		return;
	}
	
	if(! f.categoryNum.value) {
		alert("카테고리를 선택하세요.");
		f.categoryNum.focus();
		return;
	}
	
	if(! f.mentorPrice.value.trim()) {
		alert("가격을 입력하세요.");
		f.mentorSubject.focus();
		return;
	}
	
	str = window.editor.getData().trim();
    if(! str) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
	f.mentorContent.value = str;
	
	if(parseInt(f.sTime.value) >= parseInt(f.eTime.value) ) {
		alert("종료시간이 시작시간보다 이릅니다.");
		f.sTime.focus();
		return;
	}
	
	f.action="${pageContext.request.contextPath}/mentorPage/mentoringSubmit";
	f.submit();
}

// 멘토링 가능 날짜 체크 함수
$(function() {
	let str = "${dto.ableDay}";
	let arr = str.split(",");
	//console.log(arr);
	for(let i = 0; i < $("input[name=ableDay]").length; i ++) {
		if(arr.indexOf($("input[name=ableDay]")[i].value) > -1) {
			$("input[name=ableDay]")[i].checked=true;
		} 
	}
});


</script>
<jsp:include page="mentorPage.jsp"/>
	
<div class="mentor-content">
	<h2>멘토링 관리</h2>
	<form name="mentoringManageForm" method="post">
		<table class="list-table table">
			<tr>	
				<td style="width:15%;">제목</td>
				<td colspan="3"><input type="text" name="mentorSubject" class="form-control" value="${dto.mentorSubject}"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td style="width:35%;">
					<select name="categoryNum" class="form-select">
						<c:forEach var="vo" items="${categoryList}">
							<option value="${vo.categoryNum}" <c:if test="${vo.categoryNum eq dto.categoryNum}">
								selected="selected"</c:if>
							>${vo.categoryName}</option>
						</c:forEach>
					</select>
				</td>
				<td style="width:15%;">가격</td>
				<td style="width:35;"><input type="text" name="mentorPrice" class="form-control" value="${dto.mentorPrice}"></td>
			</tr>
			<tr>	
				<td colspan="4">내 용</td>	
			</tr>
			<tr>	
				<td colspan="4">
					<div class="editor">${dto.mentorContent}</div>
					<input type="hidden" name="mentorContent">					
				</td>
			</tr>
			<tr>
				<td colspan="4"></td>
			</tr>				
			<tr>
				<td>가능 요일</td>
				<td colspan="3">
					<input type="checkbox" name="ableDay" value="1"><label>월</label>
					<input type="checkbox" name="ableDay" value="2"><label>화</label>
					<input type="checkbox" name="ableDay" value="3"><label>수</label>
					<input type="checkbox" name="ableDay" value="4"><label>목</label>
					<input type="checkbox" name="ableDay" value="5"><label>금</label>
					<input type="checkbox" name="ableDay" value="6"><label>토</label>
					<input type="checkbox" name="ableDay" value="0"><label>일</label>
				</td>
			</tr>
			<tr>
				<td>시작 시간</td>
				<td>
					<select name="sTime" class="form-select">
						<c:forEach var="i" begin="1" end="24">
							<option value="${i}" <c:if test="${dto.sTime eq i}">selected="selected"</c:if>>${i}시</option>
						</c:forEach>
					</select>
				</td>
				<td>종료 시간</td>
				<td>
					<select name="eTime" class="form-select">
						<c:forEach var="i" begin="1" end="24">
							<option value="${i}" <c:if test="${dto.eTime eq i}">selected="selected"</c:if>>${i}시</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="margin:0; padding:0;">
					<button type="button" onclick="sendOk();" class="btn btn-primary" style="width:100%; height:100%; padding:5px;">등 록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
	
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