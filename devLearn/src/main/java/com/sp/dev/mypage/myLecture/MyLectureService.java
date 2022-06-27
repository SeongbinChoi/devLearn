package com.sp.dev.mypage.myLecture;

import java.util.List;
import java.util.Map;

public interface MyLectureService {
	public int myLectureDataCount(Map<String, Object> map);
	public List<MyLecture> myLectureList(Map<String, Object> map);
}
