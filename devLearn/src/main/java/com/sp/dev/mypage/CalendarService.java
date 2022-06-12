package com.sp.dev.mypage;

import java.util.List;
import java.util.Map;

public interface CalendarService {
	public List<Calendar> listCalendar(Map<String, Object> map);
	public void insertCalendar(Calendar cal) throws Exception;
	public void deleteCalendar(Map<String, Object> map) throws Exception;
}
