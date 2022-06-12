package com.sp.dev.admin.rev;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.rev.revnueController")
@RequestMapping("admin/rev/*")
public class RevenueController {
	
	@RequestMapping("main")
	public String main() {
		
		return ".admin.revenue.main";
	}
	
}
