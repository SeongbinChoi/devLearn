<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class='reply-info'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
</div>

<table class='table table-borderless'>
	<c:forEach var="vo" items="${listReply}">
		<tr class='border bg-light'>
			<td width='50%'>
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col-auto align-self-center'>
						<div class='name'>${vo.memberNickname}</div>
						<div class='date'>${vo.regDate}</div>
					</div>
				</div>
			</td>
			<td width='50%' align='right' class='align-middle'>
				<div class="reply-menu">
					<c:choose>
						<c:when test="${( sessionScope.member.memberEmail != null )}">
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}'>삭제</div>
						</c:when>
						<c:otherwise>
							<div class='reply-menu-item' data-replyNum='${vo.replyNum}' style=" pointer-events: none;">삭제</div>
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan='2' valign='top'>${vo.content}</td>
		</tr>

		<tr>
			<td>
				<button type='button' class='btn btn-light btnReplyAnswerLayout' data-replyNum='${vo.replyNum}'>답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span></button>
			</td>
		</tr>
	
	    <tr class='reply-answer'>
	        <td colspan='2'>
	        	<div class='border rounded'>
		            <div id='listReplyAnswer${vo.replyNum}' class='answer-list'></div>
		            <div>
		                <textarea class="form-control m-2"></textarea>
		            </div>
					<div class='text-end pe-2 pb-1'>
						<button type='button' class='btn btn-light btnSendReplyAnswer' data-replyNum='${vo.replyNum}'>답글 등록</button>
		            </div>
	            </div>
			</td>
	    </tr>
	</c:forEach>
</table>		
