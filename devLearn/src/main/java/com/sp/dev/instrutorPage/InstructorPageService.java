package com.sp.dev.instrutorPage;

import java.util.List;

import com.sp.dev.lectures.Lectures;

public interface InstructorPageService {
	public Lectures readLecture(String memberEmail);
	public void insertLecture(Lectures dto) throws Exception;
	public void updateLecture(Lectures dto) throws Exception;
	public List<Lectures> listCategory();
}
