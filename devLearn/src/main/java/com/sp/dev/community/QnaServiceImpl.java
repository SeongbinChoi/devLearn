package com.sp.dev.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("community.qnaService")
public class QnaServiceImpl implements QnaService {
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	// 게시글 및 답변, 답변의 답변 추가
	public void insertQna(Qna dto, String mode) throws Exception {
		try {
			// 시퀀스 값 확인
			int seq = dao.selectOne("qna.seq");
			//System.out.println("seq = " + seq);
			
			// 새 글을 등록시 -> 게시글일때와 답변일경우 나누어서 replyNum체크하기
			if(mode.equals("write"))  {
				dto.setQnaNum(seq);
				dto.setGroupNum(seq);
				dto.setDepth(0);
				dto.setOrderNo(0);
				dto.setParent(0);
				dto.setSelected(0);
				dto.setReplyNum(0);
			} else { // 답글 등록시 -> groupNum에 해당하는 게시글의 ReplyNum을 올려준다.
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("groupNum", dto.getGroupNum());
				map.put("orderNo", dto.getOrderNo());
				dao.updateData("qna.updateOrderNo", map);
				
				dto.setQnaNum(seq);
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
				
				dao.updateData("qna.updateReplyCount", dto.getGroupNum());
			}
			
			dao.insertData("qna.insertQna", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("qna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@Override
	public void updateHitCount(int qnaNum) throws Exception {
		try {
			dao.updateData("qna.updateHitCount", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;
		
		try {
			list = dao.selectList("qna.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	@Override
	public Qna readQna(int qnaNum) throws Exception {
		Qna dto = null;
		
		try {
			dto = dao.selectOne("qna.readQna", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	
	@Override
	public Qna preReadQna(Map<String, Object> map) {
		Qna dto = null;
		
		try {
			dto = dao.selectOne("qna.preReadQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	@Override
	public Qna nextReadQna(Map<String, Object> map) {
		Qna dto = null;
		
		try {
			dto = dao.selectOne("qna.nextReadQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	@Override
	public void updateSelected(int qnaNum) throws Exception {
		try {
			dao.updateData("qna.updateSelected", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	@Override
	public int replyCount(Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
			result = dao.selectOne("qna.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	@Override
	public void updateQna(Qna dto) throws Exception {
		try {
			dao.updateData("qna.updateQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	@Override
	public void deleteQna(int qnaNum, int groupNum, String memberEmail, int memberRole) throws Exception {
		try {
			Qna dto = readQna(qnaNum);
			if(dto == null || (memberRole < 99 && ! dto.getMemberEmail().equals(memberEmail))) {
				return;
			}
			
			dao.deleteData("qna.deleteQna", qnaNum);
			dao.updateData("qna.updateReplyCountDelete", groupNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}




}
