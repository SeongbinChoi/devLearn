package com.sp.dev.mypage.purchased;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.purchased.purchasedService")
public class PurchasedServiceImpl implements PurchasedService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Purchased> purchasedList(Map<String, Object> map) {
		List<Purchased> list = null;
		
		try {
			list = dao.selectList("my.purchasedList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Purchased> detailList(int sugangNum) {
		List<Purchased> list = null;
		
		try {
			list = dao.selectList("my.purchasedDetailList", sugangNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
