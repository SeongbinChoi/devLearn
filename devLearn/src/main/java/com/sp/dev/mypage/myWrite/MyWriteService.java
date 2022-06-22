package com.sp.dev.mypage.myWrite;

import java.util.List;
import java.util.Map;

public interface MyWriteService {
	public int qnaDataCount(Map<String, Object> map);
	public List<MyWrite> qnaList(Map<String, Object> map);
	
	public int studyDataCount(Map<String, Object> map);
	public List<MyStudyWrite> studyList(Map<String, Object> map);
	
	public List<StudyApply> studyApplyList(int studyNum);
	public void updateApplyStatus(int applyNum);
	public void updateApplyNum(int studyNum);
	
	public void updateStudyStatus(int studyNum);
	public List<MyStudyWrite> myStudyList(Map<String, Object> map);
	
	public void cancelApply(int applyNum);
}
