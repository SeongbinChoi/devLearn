package com.sp.dev.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("community.studyService")
public class StudyServiceImpl implements StudyService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	// 게시글 및 댓글추가
	public void insertStudy(Study dto) throws Exception {
		try {
			// 시퀀스값 가져오기
			int seq = dao.selectOne("study.seq");
			
			// 글 등록
			dto.setStudyNum(seq);
			
			dao.insertData("study.insertStudy", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("study.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	@Override
	public List<Study> listStudy(Map<String, Object> map) throws Exception {
		List<Study> list = null;
		
		try {
			list = dao.selectList("study.listStudy", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		return list;
	}

	
	@Override
	public void updateHitCount(int studyNum) throws Exception {
		try {
			dao.updateData("study.updateHitCount", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	@Override
	public Study readStudy(int studyNum) throws Exception {
		Study dto = null;
		
		try {
			dto = dao.selectOne("study.readStudy", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	
	@Override
	public Study preReadStudy(Map<String, Object> map) {
		Study dto = null;
		
		try {
			dto = dao.selectOne("study.preReadStudy", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	
	@Override
	public Study nextReadStudy(Map<String, Object> map) {
		Study dto = null;
		
		try {
			dto = dao.selectOne("study.nextReadStudy", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateStudy(Study dto) throws Exception {
		try {
			dao.updateData("study.updateStudy", dto);
		} catch (Exception e) {
		}
		
	}
	
	@Override
	public void updateStatus(int studyNum) throws Exception {
		
	}

	
	@Override
	public int replyCount(Map<String, Object> map) throws Exception {

		return 0;
	}

	
	@Override
	public void deleteStudy(int studyNum) throws Exception {
		Study dto = readStudy(studyNum);

		if(dto == null) {
			return;
		}
		
		try {
			dao.deleteData("study.deleteStudy", studyNum);
			//dao.deleteData("qna.deleteStduyReply", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	

}
