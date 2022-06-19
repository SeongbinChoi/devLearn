package com.sp.dev.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("community.studyReplyService")
public class StudyReplyServiceImpl implements StudyReplyService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertReply(StudyReply dto) throws Exception {
		try {
			dao.insertData("study.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	

	@Override
	public List<StudyReply> listReply(Map<String, Object> map) {
		List<StudyReply> list = null;
		
		try {
			list = dao.selectList("study.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("study.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("study.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	@Override
	public List<StudyReply> listReplyAnswer(int parent) {
		List<StudyReply> list = null;
		
		try {
			list = dao.selectList("study.listReplyAnswer", parent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	@Override
	public int replyAnswerCount(int parent) {
		int result = 0;
		
		try {
			result = dao.selectOne("study.replyAnswerCount", parent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
