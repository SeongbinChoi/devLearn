package com.sp.dev.community;

import java.util.List;
import java.util.Map;

public interface StudyService {
	public void insertStudy(Study dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Study> listStudy(Map<String, Object> map) throws Exception;
	
	public void updateHitCount(int studyNum) throws Exception;
	public Study readStudy(int studyNum) throws Exception;
	public Study preReadStudy(Map<String, Object> map) throws Exception;
	public Study nextReadStudy(Map<String, Object> map) throws Exception;
	
	public void updateStudy(Study dto) throws Exception;
	
	public void updateStatus(int studyNum) throws Exception;
	public int replyCount(int studyNum) throws Exception;
	public void deleteStudy(int studyNum) throws Exception;
	
	public void updateReplyCount(int studyNum) throws Exception;
	public void updateReplyCountDelete(Map<String, Object> map) throws Exception;
}
