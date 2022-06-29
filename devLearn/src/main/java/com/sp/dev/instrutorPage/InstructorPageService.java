package com.sp.dev.instrutorPage;

import java.util.List;
import java.util.Map;

public interface InstructorPageService {
	public Lectures readLecture(int lectureNum);
	public Lectures insertLecture(Lectures dto, String pathname) throws Exception;
	public int insertVideo(Lectures dto, String pathname) throws Exception;
	public Lectures readVideo(int videoNum);
	public void deleteVideo(int videoNum, String pathname) throws Exception;
	public void updateLecture(Lectures dto) throws Exception;
	public List<Lectures> listCategory();
	public List<Lectures> listSubCategory(String categoryCode);
	public int countLecture(Map<String, Object> map);
	public List<Lectures> listLecture(Map<String, Object> map);
}
