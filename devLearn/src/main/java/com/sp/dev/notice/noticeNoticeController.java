package com.sp.dev.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.dev.admin.noticeManage.Notice;
import com.sp.dev.admin.noticeManage.NoticeManageService;

@Controller("notice.noticenoticeController")
@RequestMapping("/notice/notice/*")
public class noticeNoticeController {
	@Autowired
	private NoticeManageService service;
	
	@RequestMapping("article")
	private String article(
			@RequestParam int noticeNum,
			Model model
			) throws Exception {
		
		
		Notice dto = service.readNotice(noticeNum);
		
		List<Notice> list = service.listSubject();
		
		model.addAttribute("dto",dto);
		model.addAttribute("subjectList", list);
		return ".notice.notice.article";
	}
}
