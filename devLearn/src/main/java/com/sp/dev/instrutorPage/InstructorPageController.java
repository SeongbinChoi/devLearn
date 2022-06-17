package com.sp.dev.instrutorPage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.dev.common.MyUtil;
import com.sp.dev.community.NotifiedService;
import com.sp.dev.community.Qna;
import com.sp.dev.lectures.Lectures;
import com.sp.dev.lectures.LecturesService;
import com.sp.dev.member.SessionInfo;

@Controller("instructorPage.instructorPageController")
@RequestMapping("/instructorPage/*")
public class InstructorPageController {
	@Autowired
	private InstructorPageService service;
	
	@Autowired
	private LecturesService service2;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "instructorPageDashboard", method = RequestMethod.GET)
	public String instructorPageDashboard() throws Exception {
		
		return ".instructorPage.instructorPageDashboard";
	}
	
	@RequestMapping(value = "instructorPageNewLecture", method = RequestMethod.GET)
	public String instructorPageNewLecture() throws Exception {
		
		return ".instructorPage.instructorPageNewLecture";
	}
	
	
	@RequestMapping(value = "instructorPageNewLecture2", method = RequestMethod.GET)
	public String instructorPageNewLecture2() throws Exception {
		
		return ".instructorPage.instructorPageNewLecture2";
	}
	
	@RequestMapping(value = "instructorPageNewLecture3", method = RequestMethod.GET)
	public String instructorPageNewLecture3() throws Exception {
		
		return ".instructorPage.instructorPageNewLecture3";
	}
	
	@RequestMapping(value = "instructorPageLectureList", method = RequestMethod.GET)
	public String instructorPageNewLecture4() throws Exception {
		
		return ".instructorPage.instructorPageLectureList";
	}
	
	
	@RequestMapping(value = "instructorPage", method = RequestMethod.GET)
	public String instructorPage() throws Exception {
		
		return ".instructorPage.instructorPage";
	}
	
	@RequestMapping(value = "instructorPageDashBoard", method = RequestMethod.GET)
	public String instructorPageDashBoard() throws Exception {
		
		return ".instructorPage.instructorPageDashBoard";
	}
	
	@RequestMapping(value = "instructorPageRev", method = RequestMethod.GET)
	public String instructorPageRev() throws Exception {
		
		return ".instructorPage.instructorPageRev";
	}
}
