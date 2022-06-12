package com.sp.dev.admin.contentManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.contentManage.ContentManageController")
@RequestMapping("/admin/contentManage/*")
public class ContentManageController {
	
	@RequestMapping(value="main")
	public String main() {
		
		return ".admin.contentManage.main";
	}
	
}
