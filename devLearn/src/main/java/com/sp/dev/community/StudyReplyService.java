package com.sp.dev.community;

import java.util.List;
import java.util.Map;

public interface StudyReplyService {
	// 댓글 쓰기, 리스스뽑기, 갯수세기
	public void insertReply(StudyReply dto) throws Exception;
	public List<StudyReply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	// 댓글의 댓글의 리스트 뽑기와 갯수세기
	public List<StudyReply> listReplyAnswer(int parent);
	public int replyAnswerCount(int parent);
	
	// deleteReply는 댓글과 대댓글을 모두 제어한다.
}
