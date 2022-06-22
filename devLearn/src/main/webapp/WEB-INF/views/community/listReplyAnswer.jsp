<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='border-bottom m-1'>
		<div class='row p-1'>
			<div class='col-auto'>
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col ms-2 align-self-center'>
						<div class='name'>${vo.memberNickname}</div>
						<div class='date'>${vo.regDate}</div>
					</div>
				</div>
			</div>
			<div class='col align-self-center text-end'>
				<div class='reply-menu'>
					<c:choose>
						<c:when test="${(sessionScope.member.memberEmail == vo.memberEmail) || (sessionScope.member.memberRole > 50)}">
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' data-parent='${vo.parent}'>삭제</div>
						</c:when>
						<c:otherwise>
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' style=" pointer-events: none;">삭제</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class='p-2'>
			${vo.content}
		</div>
	</div>
</c:forEach>
