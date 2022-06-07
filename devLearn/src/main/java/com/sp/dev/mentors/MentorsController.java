package com.sp.dev.mentors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mentors.mentorsController")
@RequestMapping("/mentors/*")
public class MentorsController {
	
	@RequestMapping(value = "mentor", method = RequestMethod.GET)
	public String mentor() throws Exception {
		
		return ".mentors.mentors";
	}
}
