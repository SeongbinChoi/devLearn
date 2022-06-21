package com.sp.dev.lectures;

import java.util.List;
import java.util.Map;

public interface LecturesService {
	public Lectures readLecture(int lectureNum);
	public void insertLecture(Lectures dto) throws Exception;
	public void updateLecture(Lectures dto) throws Exception;
	public List<Lectures> listCategory();
	public List<Lectures> listLecture(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public void insertLectureLike(Map<String, Object> map) throws Exception;
	public void deleteLectureLike(Map<String, Object> map) throws Exception;
	public int lectureLikeCount(int num);
	public boolean memberLectureLiked(Map<String, Object> map);
}
