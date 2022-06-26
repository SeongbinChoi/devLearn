package com.sp.dev.mypage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.dev.member.SessionInfo;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private MypageService service;
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", id);
		
		DashBoard dto = service.readDash(map);
		
		model.addAttribute("dto", dto);
		
		return ".mypage.memberPageDashboard";
	}
	
	
	@RequestMapping(value = "myStudy", method = RequestMethod.GET)
	public String myStudy() throws Exception {
		
		return ".mypage.memberPageMyStudy";
	}
	
	
	
	@RequestMapping(value = "coupon", method = RequestMethod.GET)
	public String coupon() throws Exception {
		
		return ".mypage.memberPageCoupon";
	}
	
	
	@RequestMapping(value = "point", method = RequestMethod.GET)
	public String point() throws Exception {
		
		return ".mypage.memberPagePoint";
	}

	
	
	@RequestMapping(value = "noti", method = RequestMethod.GET)
	public String noti() throws Exception {
		
		return ".mypage.memberPageNoti";
	}
	

	
	@RequestMapping(value = "setNoti", method = RequestMethod.GET)
	public String setNoti() throws Exception {
		
		return ".mypage.memberPageSetNoti";
	}
	
}
