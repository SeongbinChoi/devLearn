package com.sp.dev.mypage.cart;

import java.util.ArrayList;
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
			List<CartList> list = new ArrayList<CartList>();
			
			CartList dto = (CartList)map.get("dto");
			
			for(int i=0; i<dto.getLectureNums().size(); i++) {
				
				CartList vo = new CartList();
				vo.setMemberEmail(dto.getMemberEmails().get(i));
				vo.setTotalPay(dto.getTotalPays().get(i));
				vo.setTotalDiscount(dto.getTotalDiscounts().get(i));
				vo.setPaymentCode(dto.getPaymentCodes().get(i));
				vo.setPayState(dto.getPayStates().get(i));
				vo.setApproveNum(dto.getApproveNums().get(i));
				vo.setLectureNum(dto.getLectureNums().get(i));
				vo.setLecturePay(dto.getLecturePays().get(i));
				vo.setDiscount(dto.getDiscounts().get(i));
				vo.setLectureEdate(dto.getLectureEdates().get(i));
				
				vo.setDetailNum(dto.getDetailNums().get(i));
				
				list.add(vo);
				System.out.println(vo.getMemberEmail()+"-----------------------");
				if(i == 0) {
					map.put("memberEmail", vo.getMemberEmail());
					map.put("totalPay", vo.getTotalPay());
					map.put("totalDiscount", vo.getTotalDiscount());
					map.put("payState", vo.getPayState());
					map.put("approveNum", vo.getApproveNum());
					
				}
				
				dao.deleteData("my.deleteCart", vo);
				
			}
			map.put("list", list);
			

			dao.insertData("my.insertSugang", map);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int countVal() {
		int a = 0;
		try {
			a = dao.selectOne("my.countVal");
		} catch (Exception e) {
		}
		return a;
	}

	/*
	@Override
	public void insertSugang(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("my.insertSugang", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
}
