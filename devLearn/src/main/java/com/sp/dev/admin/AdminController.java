package com.sp.dev.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.adminController")
@RequestMapping("/admin/*")
public class AdminController {
	
	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String admin() throws Exception {
		
		return ".admin.main.dashboard";
	}
}
