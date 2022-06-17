package com.sp.dev.lectures;

import java.util.List;

public interface LecturesService {
	public Lectures readLecture(String memberEmail);
	public void insertLecture(Lectures dto) throws Exception;
	public void updateLecture(Lectures dto) throws Exception;
	public List<Lectures> listCategory();
}
