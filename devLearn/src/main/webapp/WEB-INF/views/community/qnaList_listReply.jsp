<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="question px-3 py-1" style="display: none;">
	<c:forEach var="dto" items="${qnaListReply}">
		<c:forEach var="n" begin="1" end="${dto.depth}">&nbsp;&nbsp;&nbsp;</c:forEach>
			<c:if test="${dto.depth != 0}">└&nbsp;</c:if>
				<span style="font-size: 18px; font-weight: bold;">${dto.subject}</span>
					<div class="question_footer" style="font-size: 18px; margin-top: 5px;">
						<c:forEach var="n" begin="0" end="${dto.depth}">&nbsp;&nbsp;</c:forEach>
							${dto.memberNickname} | ${dto.regDate} | 조회수 : ${dto.hitCount}
					</div>
	</c:forEach>
</div>