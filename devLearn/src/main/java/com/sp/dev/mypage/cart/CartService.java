package com.sp.dev.mypage.cart;

import java.util.List;
import java.util.Map;

public interface CartService {
	public int dataCount(Map<String, Object> map);
	public List<Cart> cartList(Map<String, Object> map);
	
	public void deleteCart(Map<String, Object> map) throws Exception;
	
	public Cart cartCheckList(Map<String, Object> map);
	
	public void insertSugang(Map<String, Object> map) throws Exception;
	//public void insertSugang(Map<String, Object> map) throws Exception;
	
	public int countVal();
	
}
