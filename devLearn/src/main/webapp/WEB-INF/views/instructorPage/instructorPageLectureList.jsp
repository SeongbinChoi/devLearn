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
.lec_img {
	width: 150px;
	height: 75px;
}

img {
	max-width: 100%;
 	max-height: 100%;
}

th, td {
  vertical-align : middle;
}
</style>
<script type="text/javascript">

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
	    	} else if(jqXHR.status === 402) {
	    		alert("권한이 없습니다.");
	    		return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
	    	} else if(jqXHR.status === 410) {
	    		alert("삭제된 게시물입니다.");
	    		return false;
	    	}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

function ajaxFileFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		processData: false,  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		contentType: false,  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
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
	    	} else if(jqXHR.status === 402) {
	    		alert("권한이 없습니다.");
	    		return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
	    	} else if(jqXHR.status === 410) {
	    		alert("삭제된 게시물입니다.");
	    		return false;
	    	}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	$("body").on("click", ".btnLectureDelete", function(){
		if(! confirm('강의를 삭제 하시겠습니까 ? ')) {
			return false;
		}
		
		var $tr = $(this).closest("tr");
		var lectureNum = $(this).attr("data-lectureNum");
		
	    let url = "${pageContext.request.contextPath}/instructorPage/videoLecture";
		let query = "lectureNum="+lectureNum;
		
		var fn = function(data) {
			$tr.remove();
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
	
});
</script>
</head>
<body>
<main>
<jsp:include page="/WEB-INF/views/instructorPage/instructorPage.jsp"/>
<div class="mt-3">
		 		<table class="table table-centered table-nowrap table-hover mb-0">
		 			<thead>
			 			<tr>
			 				<td>번호</td>
			 				<td>썸네일</td>
			 				<td>강의명</td>
			 				<td>가격</td>
			 				<td>등록일</td>
			 				<td>상태</td>
			 				<td>강의 삭제</td>
			 			</tr>
		 			</thead>
					<tbody>
			 			<c:forEach var="dto" items="${list}" varStatus="status">
			 				<tr>
				 				<td>${dataCount - (page-1) * rows - status.index}</td>
				 				<td><div style="width: 150px; height: 100px;"><img class="img-fluid img-thumbnail w-100 h-100" src="${pageContext.request.contextPath}/uploads/thumbNail/${dto.thumbNail}"></div></td>
				 				<td>${dto.lectureSubject}</td>
				 				<td>${dto.lecturePrice}</td>
				 				<td>${dto.lectureRegDate}</td>
				 				<td>
				 					<c:choose>
				 						<c:when test="${dto.state == 0}">
				 							승인대기
				 						</c:when>
				 						<c:otherwise>
				 							승인완료
				 						</c:otherwise>
				 					</c:choose>
				 				</td>
				 				<td>
				 				<c:if test="${dto.state == 0}">
									<button type="button" class="btn btn-dark btn-sm" id="deleteBtn" onclick="" data-num="${dto.lectureNum}">삭제하기</button>
								</c:if>
				 				</td>
			 				</tr>
			 			</c:forEach>
					</tbody>
		 		</table>
		 		<div class="paginate mt-5">
		 			${paging}
		 		</div>
	 		</div>
</main>

</body>
</html>