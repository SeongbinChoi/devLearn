package com.sp.dev.admin.rev;

import java.util.List;
import java.util.Map;

public interface RevenueService {
	public List<Integer> yearlyLectureSales(Map<String, Object> map);
	public List<Integer> lectureCategoryValue(Map<String, Object> map);
	public List<String> categoryNames();
	
	
	public List<Integer> yearlyMentorSales(Map<String, Object> map);
	public List<Integer> mentorCategoryValue(Map<String, Object> map);
	
}
