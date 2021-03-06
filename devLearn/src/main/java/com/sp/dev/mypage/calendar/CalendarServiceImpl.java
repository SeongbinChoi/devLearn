package com.sp.dev.mypage.calendar;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.calendar.calendarService")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Calendar> listCalendar(Map<String, Object> map) {
		List<Calendar> list = null;
		try {
			list = dao.selectList("cal.listCalendar", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertCalendar(Calendar cal) throws Exception {
		try {
			dao.insertData("cal.insertCalendar", cal);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteCalendar(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("cal.deleteCalendar", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateCalendar(Calendar cal) throws Exception {
		try {
			dao.updateData("cal.updateCalendar", cal);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Calendar readCalendar(int planNum) throws Exception {
		Calendar cal = null;
		try {
			cal = dao.selectOne("cal.readCalendar", planNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cal;
	}
	
	

}
