package com.sp.dev.mypage.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.dev.member.SessionInfo;


@Controller("mypage.cart.cartController")
@RequestMapping("/mypage/*")
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart(
					  HttpSession session,
					  Model model
					  ) throws Exception {
		
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", id);
		
		dataCount = service.dataCount(map);

		List<Cart> list = service.cartList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		
		
		return ".mypage.memberPageCart";
	}
	
	
	@RequestMapping(value = "cart/delete", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> deleteCart(
						HttpSession session,
						@RequestParam(value = "lectureNum[]") List<Integer> lectureNum
						) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memberEmail", info.getMemberEmail());
			
			for(int i : lectureNum) {
				map.put("lectureNum", i);
				service.deleteCart(map);
			}
			
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		
		
		return map;
		
	}
	
	
	@RequestMapping(value = "cart/result", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> cartCheckList(
						HttpSession session,
						@RequestParam(value = "lectureNum[]") List<Integer> lectureNum
						) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", info.getMemberEmail());
		map.put("lectureNum", lectureNum);
		
		Cart dto = service.cartCheckList(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("dto", dto);
		
		
		return model;
		
	}
	
	
	@RequestMapping(value = "sugang", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> lectureSugang(
							@RequestParam String paymentCode,
							@RequestParam String payState,
							@RequestParam String approveNum,
							Cart dto
							) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		String state = "false";

		try {
			map.put("dto", dto);
			map.put("paymentCode", paymentCode);
			map.put("payState", payState);
			map.put("approveNum", approveNum);
			System.out.println(approveNum);
			
			service.insertSugang(map);
			
			map.put("memberEmail", dto.getMemberEmail());
			map.put("lectureNum", dto.getLectureNum());
			
			
			service.deleteCart(map);
			state = "true";
		} catch (Exception e) {
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}	
	

}
