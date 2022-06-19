package com.sp.dev.mentorPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	// 멘토링 관리 페이지
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
	
	// 신청 관리 페이지
	@RequestMapping(value = "applyManage")
	public String mentorApply(
			@RequestParam(defaultValue = "all") String status,
			Model model, HttpSession session
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(status.equals("wait")) {
			status = "0";
		} else if(status.equals("accept")) {
			status = "1";
		} else if(status.equals("cancel")) {
			status = "3";
		} else {
			status = "-1";
		}
		
		map.put("memberEmail", info.getMemberEmail());
		map.put("status", status);
		
		List<Mentors> list = service.listMentoringApply(map);
		
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		
		return ".mentorPage.mentoringApplyManage";
	}
	
	@RequestMapping(value = "readMentoringApply")
	@ResponseBody
	public Map<String, Object> readMentoringApply(@RequestParam int mentoringNum) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		Mentors dto = service.readMentoringApply(mentoringNum);
	
		model.put("dto", dto);
		
		return model;
	}
	
	
	@PostMapping(value = "updateApply")
	public String updateApply(
			@RequestParam int mentoringNum,
			@RequestParam int status
			) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("mentoringNum", mentoringNum);
			map.put("status", status);
			
			service.updateMentoringApply(map);	
		} catch (Exception e) {
		}
		
		return "redirect:/mentorPage/applyManage";
	}
	
	@RequestMapping(value = "planManage")
	public String mentorPlan() throws Exception {
		
		
		return ".mentorPage.mentorPlanManage";
	}
	
	@RequestMapping(value = "listMentoring")
	@ResponseBody
	public Map<String, Object> mentorPlan(
			@RequestParam(defaultValue = "2022-05-29") String sDate,
			@RequestParam(defaultValue = "2022-07-10") String eDate,
			HttpSession session			
			) throws Exception {			
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> model = new HashMap<String, Object>();
		
		String memberEmail = info.getMemberEmail();
		
		sDate = sDate.replaceAll("-", "/");
		eDate = eDate.replaceAll("-", "/");
		
		map.put("memberEmail", memberEmail);
		map.put("sDate", sDate);
		map.put("eDate", eDate);
		
		List<Mentors> list = service.listMentoring(map);
		
		model.put("list", list);
		
		return model;
	}
	
	@RequestMapping(value = "listMentoringPlan", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> listMentoringPlan(
			String mentoringDate, 
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mentoringDate", mentoringDate);
		map.put("memberEmail", info.getMemberEmail());
		
		List<Mentors> list = service.listMentoringPlan(map);
		
		model.put("list", list);
		
		return model;
	}
	
	@RequestMapping(value = "revenueManage")
	public String mentorRevenue() throws Exception {
		
		return ".mentorPage.mentorRevenueManage";
	}
	
	
}
