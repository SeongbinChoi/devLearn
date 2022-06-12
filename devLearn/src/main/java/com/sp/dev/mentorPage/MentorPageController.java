package com.sp.dev.mentorPage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.dev.member.SessionInfo;
import com.sp.dev.mentors.Mentors;

@Controller("mentorPage.mentorPageController")
@RequestMapping("/mentorPage/*")
public class MentorPageController {
	@Autowired
	private MentorPageService service;
	
	@RequestMapping(value = "dashboard")
	public String mentorPage() throws Exception {
		
		return ".mentorPage.mentorDashboard";
	}

	@RequestMapping(value = "mentoringManage")
	public String mentoring(Model model, HttpSession session) throws Exception {		
		Mentors mentoringDto = null;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		List<Mentors> categoryList = service.listCategory();
		mentoringDto = service.readMentoring(info.getMemberEmail());
		
		model.addAttribute("dto", mentoringDto);
		model.addAttribute("categoryList", categoryList);
		
		return ".mentorPage.mentoringManage";
	}
	
	@RequestMapping(value = "mentoringSubmit", method = RequestMethod.POST)
	public String mentoringSubmit(
			Mentors dto,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		dto.setMemberEmail(info.getMemberEmail());
				
		try {
			if(service.readMentoring(info.getMemberEmail()) == null) {
				service.insertMentoring(dto);
			} else {
				service.updateMentoring(dto);
			}
		} catch (Exception e) {
		}
		
		return "redirect:/mentorPage/mentoringManage";
	}
	
	@RequestMapping(value = "applyManage")
	public String mentorApply() throws Exception {
		
		return ".mentorPage.mentoringApplyManage";
	}
	
	@RequestMapping(value = "planManage")
	public String mentorPlan() throws Exception {
		
		return ".mentorPage.mentorPlanManage";
	}
	
	@RequestMapping(value = "revenueManage")
	public String mentorRevenue() throws Exception {
		
		return ".mentorPage.mentorRevenueManage";
	}
	
	
}
