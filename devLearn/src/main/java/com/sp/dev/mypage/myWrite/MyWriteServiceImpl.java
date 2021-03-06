package com.sp.dev.mypage.myWrite;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.myWrite.myWriteService")
public class MyWriteServiceImpl implements MyWriteService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int qnaDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("my.qnaDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<MyWrite> qnaList(Map<String, Object> map) {
		List<MyWrite> list = null;
		try {
			list = dao.selectList("my.qnaList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int studyDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("my.studyDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<MyStudyWrite> studyList(Map<String, Object> map) {
		List<MyStudyWrite> list = null;
		
		try {
			list = dao.selectList("my.studyList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<StudyApply> studyApplyList(int studyNum) {
		List<StudyApply> list = null;
		
		try {
			list = dao.selectList("my.studyApplyList", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateApplyStatus(int applyNum) {
		try {
			dao.updateData("my.updateApplyStatus",applyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateApplyNum(int studyNum) {
		try {
			dao.updateData("my.updateApplyNum",studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateStudyStatus(int studyNum) {
		try {
			dao.updateData("my.updateStudyStatus",studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<MyStudyWrite> myStudyList(Map<String, Object> map) {
		List<MyStudyWrite> list = null;
		
		try {
			list = dao.selectList("my.myStudyList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void cancelApply(int applyNum) {
		try {
			dao.updateData("my.cancelApply", applyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
