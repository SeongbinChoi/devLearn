package com.sp.dev.instrutorPage;

import java.util.List;

public interface InstructorPageService {
	public Lectures readLecture(int lectureNum);
	public void insertLecture(Lectures dto, String pathname) throws Exception;
	public void updateLecture(Lectures dto) throws Exception;
	public List<Lectures> listCategory();
	public List<Lectures> listSubCategory(String categoryCode);
}
