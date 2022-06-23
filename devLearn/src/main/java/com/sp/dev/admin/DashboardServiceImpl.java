package com.sp.dev.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("admin.dashBoardService")
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	private CommonDAO dao;

	@Override
	public int countMonthNewMember(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("adminDashboard.countMonthNewMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}

	@Override
	public int countMonthNewLecture(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("adminDashboard.countMonthNewLecture", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}

	@Override
	public int countWaitingLecture() {
		int result = 0;
		try {
			result = dao.selectOne("adminDashboard.countWaitingLecture");
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}

	@Override
	public int countWaitingQnA() {
		int result = 0;
		try {
			result = dao.selectOne("adminDashboard.countWaitingQnA");
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
	}

	@Override
	public int listMonths(String month) {
		int result = 0;
		try {
			result = dao.selectOne("adminDashboard.test", month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Integer> yearlyLectureSales(Map<String, Object> map) {
		List<Integer> list = null;
		
		try {
			list = dao.selectList("adminDashboard.yearlyLectureSales",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
