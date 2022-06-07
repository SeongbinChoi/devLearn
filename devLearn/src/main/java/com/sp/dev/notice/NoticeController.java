package com.sp.dev.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("notice.noticeController")
@RequestMapping("/notice")
public class NoticeController {
	
	@RequestMapping(value = "notice", method = RequestMethod.GET)	
	public String notice() throws Exception {
		
		return ".notice.notice";
	}
	
	@RequestMapping(value = "eventList", method = RequestMethod.GET)	
	public String eventList() throws Exception {
		
		return ".notice.eventList";
	}
	
	@RequestMapping(value = "faq", method = RequestMethod.GET)	
	public String faq() throws Exception {
		
		return ".notice.faq";
	}
	
	@RequestMapping(value = "mTomInquiry", method = RequestMethod.GET)	
	public String mTomInquiry() throws Exception {
		
		return ".notice.11questionList";
	}
}
