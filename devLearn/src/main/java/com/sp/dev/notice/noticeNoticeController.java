package com.sp.dev.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.dev.common.dao.CommonDAO;

@Controller("notice.noticenoticeController")
@RequestMapping("/notice/notice")
public class noticeNoticeController {
	@Autowired
	private CommonDAO dao;
	
	public String list() {
		
		return "notice.notice.list";
	}
	
}
