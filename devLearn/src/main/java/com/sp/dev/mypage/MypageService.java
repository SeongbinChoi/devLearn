package com.sp.dev.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public DashBoard readDash(Map<String, Object> map);
	public DashLecture dashLectureCount(Map<String, Object> map);
	public List<DashLecture> dashRecentLecture(Map<String, Object> map);
}
