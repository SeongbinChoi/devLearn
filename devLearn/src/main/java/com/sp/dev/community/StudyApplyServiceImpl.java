package com.sp.dev.community;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("community.studyApplyService")
public class StudyApplyServiceImpl implements StudyApplyService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	// 스터디 신청
	public void insertStudyApply(Map<String, Object> map) throws Exception {
		try {
			// 스터디 신청
			dao.insertData("study.insertStudyApply", map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}

