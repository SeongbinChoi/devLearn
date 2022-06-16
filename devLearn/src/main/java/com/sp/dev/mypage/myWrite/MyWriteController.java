package com.sp.dev.mypage.myWrite;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mypage.myWrite.myWriteController")
@RequestMapping("/mypage/myWrite/*")
public class MyWriteController {
	
	@RequestMapping(value = "myWrite", method = RequestMethod.GET)
	public String myWrite() throws Exception {
		
		return ".mypage.memberPageMyWrite";
	}

}
