package com.sp.dev.admin;

import java.util.List;
import java.util.Map;

public interface DashboardService {
	public int countMonthNewMember(Map<String, Object> map);
	public int countMonthNewLecture(Map<String, Object> map);
	public int countWaitingLecture();
	public int countWaitingQnA();
	
	public int listMonths(String month);
	public List<Integer> yearlyLectureSales(Map<String, Object> map);
}
