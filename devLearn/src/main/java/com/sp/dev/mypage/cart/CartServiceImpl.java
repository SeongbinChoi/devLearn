package com.sp.dev.mypage.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.cart.cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("my.cartDataCount", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Cart> cartList(Map<String, Object> map) {
		List<Cart> list = null;
		
		try {
			list = dao.selectList("my.cartList", map);
		} catch (Exception e) {
		}
		
		return list;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("my.deleteCart", map);
		} catch (Exception e) {
		}
	}

	@Override
	public Cart cartCheckList(Map<String, Object> map) {
		Cart cart = null;
		
		try {
			cart = dao.selectOne("my.cartCheckList", map);
		} catch (Exception e) {
		}
		
		return cart;
	}

	@Override
	public void insertSugang(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("my.insertSugang", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
