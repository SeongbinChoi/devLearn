package com.sp.dev.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("community.communityController")
@RequestMapping("/community/*")
public class CommunityController {
	
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public String qnaList() throws Exception {
		
		return ".community.qnaList";
	}
	
	@RequestMapping(value = "studyList", method = RequestMethod.GET)
	public String studyList() throws Exception {
		
		return ".community.studyList";
	}
}
