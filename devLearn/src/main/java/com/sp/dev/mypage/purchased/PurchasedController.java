package com.sp.dev.mypage.purchased;

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

import com.sp.dev.member.SessionInfo;

@Controller("mypage.purchased.purchasedController")
@RequestMapping("mypage/*")
public class PurchasedController {
	
	@Autowired
	private PurchasedService service;
	
	@RequestMapping(value = "purchased", method = RequestMethod.GET)
	public String purchased(HttpSession session,
							Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", id);
		
		List<Purchased> list = service.purchasedList(map);
		
		model.addAttribute("list", list);
		
		return ".mypage.memberPagePurchased";
	}
	
	// 구매내역 리스트 AJAX-Text
	@RequestMapping(value = "purchased/detailList", method = RequestMethod.GET)
	public String applyList(@RequestParam int sugangNum, Model model) throws Exception {
		
		List<Purchased> list = service.detailList(sugangNum);

		model.addAttribute("detailList", list);
		
		return "mypage/purchasedList";
	}
	
}
