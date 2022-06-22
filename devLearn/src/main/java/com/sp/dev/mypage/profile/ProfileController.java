package com.sp.dev.mypage.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mypage.profile.profileController")
@RequestMapping("/mypage/*")
public class ProfileController {
	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile() throws Exception {
		
		return ".mypage.memberPageProfile";
	}

}
