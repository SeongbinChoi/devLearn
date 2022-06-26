<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="tableTop my-2 ml-2 d-flex">
	<span style="line-height: 38px;"> 총 ${applyCount}건</span>
	<form name="applyRoleForm" class="ms-auto" style="display: block" method="post">
		<div class="d-flex justify-content-end">
			<select name="status" class="form-select mr-2" style="width: 130px;" onChange="applyStatusChange();">
				<option value="">처리상태</option>
				<option value="0" ${status == 0 ? "selected='selected'" : "" }>처리중</option>
				<option value="1" ${status == 1 ? "selected='selected'" : "" }>처리완료</option>
			</select>
			<select name="applyRole" class="form-select " style="width: 130px;" onchange="applyRollChange();">
				<option value="">지원 등급</option>
				<option value="30" ${applyRole == 30 ? "selected='selected'" : "" }>강사 &amp; 멘토</option>
				<option value="20" ${applyRole == 20 ? "selected='selected'" : "" }>강사</option>
				<option value="10" ${applyRole == 10 ? "selected='selected'" : "" }>멘토</option>
			</select>
		</div>
	</form>
</div>							
<div class="table-responsive ">
	<table class="table table-centered table-nowrap table-hover mb-0">
		<thead>
			<tr>
				<td>
					<h5 class="font-14 my-1 fw-normal">#</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">회원 메일</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">이름</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">전화번호</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">현재 등급</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">신청한 등급</h5>
				</td>
				<td>
					<h5 class="font-14 my-1 fw-normal">상태</h5>
				</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(applyList) == 0 }">
				<tr>
					<td colspan="7">신청된 권한 요청이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="apply" items="${applyList}" varStatus="status">
				<tr >
					<td>
						${status.index+1}
					</td>
					<td>
						${apply.eMail}
					</td>
					<td>
						${apply.name}
					</td>
					<td>
						${apply.phoneNum}
					</td>
					<td>
						<c:choose>
							<c:when test="${apply.mRole == 1}">
								회원
							</c:when>
							<c:when test="${apply.mRole == 10}">
								멘토
							</c:when>
							<c:when test="${apply.mRole == 20}">
								강사
							</c:when>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${apply.applyRole == 10}">
								멘토
							</c:when>
							<c:when test="${apply.applyRole == 20}">
								강사
							</c:when>
							<c:when test="${apply.applyRole == 30}">
								멘토 &amp; 강사
							</c:when>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${apply.status == 0 }">
								처리중
							</c:when>
							<c:when test="${apply.status == 1 }">
								처리완료
							</c:when>
						</c:choose>
					</td>
					<td>
						<button type="button" class="btn-sm btn-primary"  onclick="applyDetail('${apply.eMail}');">지원내용</button>
					</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
</div>

<div id="applyDetailDiv" ></div>
