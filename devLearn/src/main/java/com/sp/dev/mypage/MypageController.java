package com.sp.dev.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session) throws Exception {
		
		return ".mypage.memberPageDashboard";
	}
	
	
	@RequestMapping(value = "myStudy", method = RequestMethod.GET)
	public String myStudy() throws Exception {
		
		return ".mypage.memberPageMyStudy";
	}
	
	
	@RequestMapping(value = "myInquiry", method = RequestMethod.GET)
	public String myInquiry() throws Exception {
		
		return ".mypage.memberPageInquiry";
	}

	
	@RequestMapping(value = "coupon", method = RequestMethod.GET)
	public String coupon() throws Exception {
		
		return ".mypage.memberPageCoupon";
	}
	
	
	@RequestMapping(value = "point", method = RequestMethod.GET)
	public String point() throws Exception {
		
		return ".mypage.memberPagePoint";
	}

	
	@RequestMapping(value = "purchased", method = RequestMethod.GET)
	public String purchased() throws Exception {
		
		return ".mypage.memberPagePurchased";
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
