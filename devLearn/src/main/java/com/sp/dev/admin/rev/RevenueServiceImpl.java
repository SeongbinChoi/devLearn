package com.sp.dev.admin.rev;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("admin.rev.revenueService")
public class RevenueServiceImpl implements RevenueService{
	
	@Autowired
	private CommonDAO dao;
		
	@Override
	public List<Integer> yearlyLectureSales(Map<String, Object> map) {
		List<Integer> list = null;
		
		try {
			list = dao.selectList("adminRev.sugangTotal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<Integer> lectureCategoryValue(Map<String, Object> map) {
		List<Integer> list = null;
		
		try {
			list= dao.selectList("adminRev.lectureCategoryValue", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<String> categoryNames() {
		List<String> list= null;
		try {
			list = dao.selectList("adminRev.getMainCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Integer> yearlyMentorSales(Map<String, Object> map) {
		List<Integer> list= null;
		try {
			list = dao.selectList("adminRev.mentorTotalSales", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Integer> mentorCategoryValue(Map<String, Object> map) {
		List<Integer> list = null;
		try {
			list = dao.selectList("adminRev.mentorCategoryValue", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
