package com.sp.dev.community;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public void insertQna(Qna dto, String mode) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Qna> listQna(Map<String, Object> map);

	public void updateHitCount(int qnaNum) throws Exception;			// 조회수 갱신
	public Qna readQna(int qnaNum) throws Exception;
	public Qna preReadQna(Map<String, Object> map);
	public Qna nextReadQna(Map<String, Object> map);
	
	public void updateSelected(int qnaNum) throws Exception;			// qna질문 해결로 변경 
	public int replyCount(Map<String, Object> map) throws Exception;	// 게시글에 대한 답변개수
	public void updateQna(Qna dto) throws Exception;
	public void deleteQna(int qnaNum, int groupNum, String memberEmail, int memberRole) throws Exception;
	//public void insertNotify(Map<String, Object> map) throws Exception;
}
