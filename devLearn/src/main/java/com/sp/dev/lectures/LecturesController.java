package com.sp.dev.lectures;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("lectures.lecturesController")
@RequestMapping("/lectures/*")
public class LecturesController {
	
	
	@RequestMapping(value = "all", method = RequestMethod.GET)
	public String lectureAll() throws Exception {
		
		return ".lectures.lectures";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String lectureDetail() throws Exception {
		
		return ".lectures.lectureDetail";
	}
}
