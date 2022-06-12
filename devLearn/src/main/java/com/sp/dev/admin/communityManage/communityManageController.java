package com.sp.dev.admin.communityManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.communityManage.communityManageController")
@RequestMapping("/admin/communityManage/*")
public class communityManageController {
	
	@RequestMapping(value="main")	
	public String method() {
		
		return ".admin.communityManage.main";
	}
	
}
