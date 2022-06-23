<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Modal -->
<div class="modal fade modal-dialog modal-dialog-centered modal-lg" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원 상세 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="infoDetailForm" id="infoDetailForm">
	      	<table class="table td-border my-10" style="border: 1px border-collpase;">
	      		<tr>
	      			<td style="width:15%;">E-mail</td>
	      			<td style="width:35%;">${dto.eMail}</td>
	      			<td style="width:15%;">이름</td>
	      			<td style="width:35%;">${dto.name}</td>
	      		</tr>
	      		<tr>
	      			<td style="width:15%;">비지니스 메일</td>
	      			<td style="width:35%;">${dto.bMail}</td>
	      			<td style="width:15%;">전화번호</td>
	      			<td style="width:35%;">${dto.phoneNum}</td>
	      		</tr>
				<tr>
	      			<td style="width:15%;">가입일</td>
	      			<td style="width:35%;">${dto.reg_date}</td>
	      			<td style="width:15%;">마지막 로그인</td>
	      			<td style="width:35%;">${dto.lastLogin}</td>
				</tr>
				<tr>
	      			<td style="width:15%;">정보 업데이트</td>
	      			<td style="width:35%;">${dto.infoUpdate}</td>
	      			<td style="width:15%;">메일 수신</td>
	      			<td style="width:35%;">${dto.emailCheck == 1 ? '동의' : '미동의'}</td>
				</tr>
	      		<tr>
	      			<td style="width:15%;">회원 등급</td>
	      			<td >
	      				<select id="mRole" name="mRole" style="width: 100%;">
	      					<option value="1"  ${dto.mRole == 1  ? 'selected="selected"' : ''}>회원</option>
	      					<option value="10" ${dto.mRole == 10 ? 'selected="selected"' : ''}>멘토</option>
	      					<option value="20" ${dto.mRole == 20 ? 'selected="selected"' : ''}>강사</option>
	      					<option value="30" ${dto.mRole == 30 ? 'selected="selected"' : ''}>멘토&amp;강사</option>
	      					<option value="99" ${dto.mRole == 99 ? 'selected="selected"' : ''}>관리자</option>
	      				</select>
	      			</td>
	      			<td><button type="button" onclick="updateRole();" class="btn btn-primary">변경하기</button> </td>
	      			<td>
	      				<input type="text" style="display: none;" value="${dto.eMail}" name="eMail">
	      			</td>
	      		</tr>
      		</table>
		</form>
		<form name="stateForm" id="stateForm" >
   			<table class="table td-border my-10" style="border: 1px border-collpase;">
	      		<tr>
	      			<td>로그인 가능</td>
	      			<td colspan="2">
	      				<select name="enabled" id="enabled">
	      					<option value="1" ${dto.enabled == 1 ? 'selected="selected"' : ''}>가능</option>
	      					<option value="99" ${dto.enabled == 99 ? 'selected="selected"' : ''}>불가능</option>
	      				</select>
	      			</td>
      			</tr>
      			<tr>
	      			<td style="width: 15%;">상태</td>
	      			<td >
	      				<select name="stateCode" style="width: 100%;" >
	      					<option value=""  ${dto.stateCode == 11 ? 'selected="selected"' : '' }> :: 상태 :: </option>
	      					<option value="1" ${dto.stateCode == 1 ? 'selected="selected"' : '' }>불법적인 방법으로 로그인</option>
	      					<option value="2" ${dto.stateCode == 2 ? 'selected="selected"' : '' }>불건전 게시물 등록</option>
	      					<option value="3" ${dto.stateCode == 3 ? 'selected="selected"' : '' }>다른 유저 비방</option>
	      					<option value="4" ${dto.stateCode == 4 ? 'selected="selected"' : '' }>타 계정 도용</option>
	      					<option value="5" ${dto.stateCode == 5 ? 'selected="selected"' : '' }>기타 약관 위반</option>
	      					<option value="6" ${dto.stateCode == 6 ? 'selected="selected"' : '' }>1년 이상 로그인 하지 않음</option>
	      					<option value="9" ${dto.stateCode == 9 ? 'selected="selected"' : '' }>패스워드 6회 이상 실패</option>
	      					<option value="10" ${dto.stateCode == 10 ? 'selected="selected"' : '' }>퇴사</option>      					
	      					<option value="11">해제</option>
	      				</select>
	      			</td>
	      			<td style="width: 20%">
						<c:choose>
							<c:when test="${not empty memberState}">
				      			<button type="button" class="btn btn-primary btnStateDetail" onclick="stateDetail();" style="width: 100%;">자세히</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-primary btnStateDetail" onclick="stateDetail();" style="width: 100%;" disabled="disabled">자세히</button>
							</c:otherwise>
						</c:choose>
										
	      			</td>
	      		</tr>
				<tr>
					<td>메모</td>
					<td>
						<input type="text" name="memo" style="width: 100%;" placeholder="${dto.memo}">
						<input type="text" style="display: none;" value="${dto.eMail}" name="eMail">					
					</td>
					<td><button type="button" class="btn btn-primary" onclick="stateUpdate();" style="width: 100%;">변경하기</button> </td>
				</tr>	      			
	      	</table>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">Modal 2</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<table class="table td-border my-10" style="border: 1px border-collpase;">
		<thead>
			<tr>
				<th>내용</th>
				<th>메모</th>
				<th>변경일</th>
				<th>변경한 관리자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${stateList}">
				<tr>
					<td>
						<c:choose>
							<c:when test="${vo.stateCode == 1}">
								불법적인 방법으로 로그인
							</c:when>
							<c:when test="${vo.stateCode == 2}">
								불건전 게시물 등록
							</c:when>
							<c:when test="${vo.stateCode == 3}">
								다른 유저 비방
							</c:when>
							<c:when test="${vo.stateCode == 4}">
								타 계정 도용
							</c:when>
							<c:when test="${vo.stateCode == 5}">
								기타 약관 위반
							</c:when>
							<c:when test="${vo.stateCode == 6}">
								1년이상 로그인 하지 않음
							</c:when>
							<c:when test="${vo.stateCode == 9}">
								패스워드 6회 이상 실패
							</c:when>
							<c:when test="${vo.stateCode == 10}">
								퇴사
							</c:when>
							<c:when test="${vo.stateCode == 11}">
								해제
							</c:when>
						</c:choose>
					(${vo.stateCode})
					<td>${vo.memo}</td>
					<td>${vo.stateDate}</td>
					<td>${vo.adminId}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p style="text-align: right; font-size: 12px;">최근 5건의 변경만 조회 됩니다.</p>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Back to first</button>
      </div>
    </div>
  </div>
</div>
<a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">Open first modal</a>
	<div class="modal fade modal-dialog modal-lg" id="memberDetailModal">
		<form name="infoDetailForm" id="infoDetailForm">
	      	<table class="table td-border my-10" style="border: 1px border-collpase;">
	      		<tr>
	      			<td style="width:15%;">E-mail</td>
	      			<td style="width:35%;">${dto.eMail}</td>
	      			<td style="width:15%;">이름</td>
	      			<td style="width:35%;">${dto.name}</td>
	      		</tr>
	      		<tr>
	      			<td style="width:15%;">비지니스 메일</td>
	      			<td style="width:35%;">${dto.bMail}</td>
	      			<td style="width:15%;">전화번호</td>
	      			<td style="width:35%;">${dto.phoneNum}</td>
	      		</tr>
				<tr>
	      			<td style="width:15%;">가입일</td>
	      			<td style="width:35%;">${dto.reg_date}</td>
	      			<td style="width:15%;">마지막 로그인</td>
	      			<td style="width:35%;">${dto.lastLogin}</td>
				</tr>
				<tr>
	      			<td style="width:15%;">정보 업데이트</td>
	      			<td style="width:35%;">${dto.infoUpdate}</td>
	      			<td style="width:15%;">메일 수신</td>
	      			<td style="width:35%;">${dto.emailCheck == 1 ? '동의' : '미동의'}</td>
				</tr>
	      		<tr>
	      			<td style="width:15%;">회원 등급</td>
	      			<td >
	      				<select id="mRole" name="mRole" style="width: 100%;">
	      					<option value="1"  ${dto.mRole == 1  ? 'selected="selected"' : ''}>회원</option>
	      					<option value="10" ${dto.mRole == 10 ? 'selected="selected"' : ''}>멘토</option>
	      					<option value="20" ${dto.mRole == 20 ? 'selected="selected"' : ''}>강사</option>
	      					<option value="30" ${dto.mRole == 30 ? 'selected="selected"' : ''}>멘토&amp;강사</option>
	      					<option value="99" ${dto.mRole == 99 ? 'selected="selected"' : ''}>관리자</option>
	      				</select>
	      			</td>
	      			<td><button type="button" onclick="updateRole();" class="btn btn-primary">변경하기</button> </td>
	      			<td>
	      				<input type="text" style="display: none;" value="${dto.eMail}" name="eMail">
	      			</td>
	      		</tr>
      		</table>
		</form>
		<form name="stateForm" id="stateForm" >
   			<table class="table td-border my-10" style="border: 1px border-collpase;">
	      		<tr>
	      			<td>로그인 가능</td>
	      			<td colspan="2">
	      				<select name="enabled" id="enabled">
	      					<option value="1" ${dto.enabled == 1 ? 'selected="selected"' : ''}>가능</option>
	      					<option value="99" ${dto.enabled == 99 ? 'selected="selected"' : ''}>불가능</option>
	      				</select>
	      			</td>
      			</tr>
      			<tr>
	      			<td style="width: 15%;">상태</td>
	      			<td >
	      				<select name="stateCode" style="width: 100%;" >
	      					<option value=""  ${dto.stateCode == 11 ? 'selected="selected"' : '' }> :: 상태 :: </option>
	      					<option value="1" ${dto.stateCode == 1 ? 'selected="selected"' : '' }>불법적인 방법으로 로그인</option>
	      					<option value="2" ${dto.stateCode == 2 ? 'selected="selected"' : '' }>불건전 게시물 등록</option>
	      					<option value="3" ${dto.stateCode == 3 ? 'selected="selected"' : '' }>다른 유저 비방</option>
	      					<option value="4" ${dto.stateCode == 4 ? 'selected="selected"' : '' }>타 계정 도용</option>
	      					<option value="5" ${dto.stateCode == 5 ? 'selected="selected"' : '' }>기타 약관 위반</option>
	      					<option value="6" ${dto.stateCode == 6 ? 'selected="selected"' : '' }>1년 이상 로그인 하지 않음</option>
	      					<option value="9" ${dto.stateCode == 9 ? 'selected="selected"' : '' }>패스워드 6회 이상 실패</option>
	      					<option value="10" ${dto.stateCode == 10 ? 'selected="selected"' : '' }>퇴사</option>      					
	      					<option value="11">해제</option>
	      				</select>
	      			</td>
	      			<td style="width: 20%">
						<c:choose>
							<c:when test="${not empty memberState}">
				      			<button type="button" class="btn btn-primary btnStateDetail" onclick="stateDetail();" style="width: 100%;">자세히</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-primary btnStateDetail" onclick="stateDetail();" style="width: 100%;" disabled="disabled">자세히</button>
							</c:otherwise>
						</c:choose>
										
	      			</td>
	      		</tr>
				<tr>
					<td>메모</td>
					<td>
						<input type="text" name="memo" style="width: 100%;" placeholder="${dto.memo}">
						<input type="text" style="display: none;" value="${dto.eMail}" name="eMail">					
					</td>
					<td><button type="button" class="btn btn-primary" onclick="stateUpdate();" style="width: 100%;">변경하기</button> </td>
				</tr>	      			
	      	</table>
		</form>
	</div>
<div id="stateDetail" style="display: none;">
	<table class="table td-border my-10" style="border: 1px border-collpase;">
		<thead>
			<tr>
				<th>내용</th>
				<th>메모</th>
				<th>변경일</th>
				<th>변경한 관리자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${stateList}">
				<tr>
					<td>
						<c:choose>
							<c:when test="${vo.stateCode == 1}">
								불법적인 방법으로 로그인
							</c:when>
							<c:when test="${vo.stateCode == 2}">
								불건전 게시물 등록
							</c:when>
							<c:when test="${vo.stateCode == 3}">
								다른 유저 비방
							</c:when>
							<c:when test="${vo.stateCode == 4}">
								타 계정 도용
							</c:when>
							<c:when test="${vo.stateCode == 5}">
								기타 약관 위반
							</c:when>
							<c:when test="${vo.stateCode == 6}">
								1년이상 로그인 하지 않음
							</c:when>
							<c:when test="${vo.stateCode == 9}">
								패스워드 6회 이상 실패
							</c:when>
							<c:when test="${vo.stateCode == 10}">
								퇴사
							</c:when>
							<c:when test="${vo.stateCode == 11}">
								해제
							</c:when>
						</c:choose>
					(${vo.stateCode})
					<td>${vo.memo}</td>
					<td>${vo.stateDate}</td>
					<td>${vo.adminId}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p style="text-align: right; font-size: 12px;">최근 5건의 변경만 조회 됩니다.</p>
</div>
	