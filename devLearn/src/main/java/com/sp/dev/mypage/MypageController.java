package com.sp.dev.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage() throws Exception {
		
		return ".mypage.memberPageDashboard";
	}
}
