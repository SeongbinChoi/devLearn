<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/core.css" type="text/css">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	list-style: none;
}

.contents {
	margin: 0;
	padding: 0;
	width: 100%;
	margin-left: 230px;
	height:100%;
}

.body-title {
	color: #424951;
    padding-top: 10px;
    padding-bottom: 5px;
    margin: 0 0 25px 0;
    border-bottom: 1px solid #ddd;
}

.body-title h3 {
	width: 300px;
	margin: 0 0 -5px 0;
	border-bottom: 3px solid #424951;
	padding-bottom: 5px;
}

.table>:not(caption)>*>* {
	padding: 0.7rem 0.7rem;
}

.write-form tr:first-child {
	border-top: 2px solid #212529;
}

.write-form tr>td:first-child {
	vertical-align: middle;
	text-align: center;
}

.write-form textarea {
    height: 170px;
    resize: none;
}

</style>

<div class="container">
	<div class="contents pt-5 col-lg-12" style="max-width: 1000px;">
		<div class="body-title">
			<h3>
				<i class="bi bi-clipboard"></i> 공지사항
			</h3>
		</div>
		
		<div class="body-main">
			<form name="noticeForm">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2">제 목</td>
						<td>
							<input type="text" class="form-control" name="subject">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">공지여부</td>
						<td>
							<input type="checkbox" name="notice"> 공지
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">작성자명</td>
						<td>관리자</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">내 용</td>
						<td>
							<textarea class="form-control" name="content">ck에디터 자리</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">첨 부</td>
						<td>
					  		<input class="form-control" type="file" id="formFileMultiple" multiple>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; border-bottom: none;">
							<button type="button" class="btn btn-dark" onclick="sendOk();">등록하기</button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light">등록취소</button>
						</td>
					</tr>
					</table>
				</form>
			</div>		
		</div>
	</div>

