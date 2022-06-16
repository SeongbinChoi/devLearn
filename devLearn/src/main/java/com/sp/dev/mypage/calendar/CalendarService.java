package com.sp.dev.mypage.calendar;

import java.util.List;
import java.util.Map;

public interface CalendarService {
	public List<Calendar> listCalendar(Map<String, Object> map);
	public Calendar readCalendar(int planNum) throws Exception;
	public void insertCalendar(Calendar cal) throws Exception;
	public void deleteCalendar(Map<String, Object> map) throws Exception;
	public void updateCalendar(Calendar cal) throws Exception;
}
