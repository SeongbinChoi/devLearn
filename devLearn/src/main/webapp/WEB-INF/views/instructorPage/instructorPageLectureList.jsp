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
</head>
<body>
<main>
<jsp:include page="/WEB-INF/views/instructorPage/instructorPage.jsp"/>
<table class="table table-hover" style="background: #FFFFFF;">
  <thead>
    <tr>
      <th scope="col">강의 이미지</th>
      <th scope="col">강의명</th>
      <th scope="col">평점</th>
      <th scope="col">총 수강생</th>
      <th scope="col">질문</th>
      <th scope="col">총 수입</th>
      <th scope="col">상태</th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">
      	<div class="lec_img">
      		<img src="${pageContext.request.contextPath}/resources/images/no_image.gif">
      	</div>
      </th>
      <td>나도 할수 있다! 데브런강사!</td>
      <td>5.0</td>
      <td>172</td>
      <td>5</td>
      <td>$300,000</td>
      <td><a href="#">미승인</a></td>
    </tr>
    <tr>
      <th scope="row">
      	<div class="lec_img">
      		<img src="${pageContext.request.contextPath}/resources/images/no_image.gif">
      	</div>
	</th>
      <td>나도 할수 있다! 데브런강사!22</td>
      <td>3.5</td>
      <td>172</td>
      <td>4</td>
      <td>$250,000</td>
      <td><a href="#">승인</a></td>
    </tr>
    <tr>
      <th scope="row">
      	<div class="lec_img">
      		<img src="${pageContext.request.contextPath}/resources/images/no_image.gif">
      	</div>
      </th>
      <td>나도 할수 있다! 데브런강사!33</td>
      <td>4.0</td>
      <td>12</td>
      <td>0</td>
      <td>$280,000</td>
      <td><a href="#">미승인</a></td>
    </tr>
    <tr>
      <th scope="row">
      	<div class="lec_img">
      		<img src="${pageContext.request.contextPath}/resources/images/no_image.gif">
      	</div>
      </th>
      <td>나도 할수 있다! 데브런강사!44</td>
      <td>4.7</td>
      <td>69</td>
      <td>2</td>
      <td>$250,000</td>
      <td><a href="#">승인</a></td>
    </tr>
    <tr>
      <th scope="row">
      	<div class="lec_img">
      		<img src="${pageContext.request.contextPath}/resources/images/no_image.gif">
      	</div>
      </th>
      <td>나도 할수 있다! 데브런강사!55</td>
      <td>2.3</td>
      <td>109</td>
      <td>11</td>
      <td>$730,000</td>
      <td><a href="#">승인</a></td>
    </tr>
    <tr>
      <th scope="row">
      	<div class="lec_img">
      		<img src="${pageContext.request.contextPath}/resources/images/no_image.gif">
      	</div>
      </th>
      <td>나도 할수 있다! 데브런강사!66</td>
      <td>5.0</td>
      <td>72</td>
      <td>5</td>
      <td>$300,000</td>
      <td><a href="#">승인</a></td>
    </tr>
  </tbody>
</table>
</main>

</body>
</html>