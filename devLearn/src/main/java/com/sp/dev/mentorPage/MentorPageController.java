package com.sp.dev.mentorPage;

import java.time.LocalDateTime;
import java.util.ArrayList;
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
	public String mentorPage(
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<Object> revenueList = new ArrayList<Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		LocalDateTime now = LocalDateTime.now();
		String year = now.toString().substring(0, 4);
		map.put("year", year);
		map.put("memberEmail", info.getMemberEmail());
		
		revenueList = service.mentoringRevenueList(map);
		dataMap = service.dashbardDataList(info.getMemberEmail());
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("revenueList", revenueList);
		
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
		
		// 0: 승인대기, 1: 승인, 2: 거절, 3: 이용완료, 4:취소, 5:환불, -1: 전체
		if(status.equals("wait")) {
			status = "0";
		} else if(status.equals("accept")) {
			status = "1";
		} else if(status.equals("cancel")) {
			// 취소/환불
			status = "4";
		} else {
			// 전체
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
			@RequestParam() String sDate,
			@RequestParam() String eDate,
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
	
	@RequestMapping(value = "MentoringDetail", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> mentoringDetail(@RequestParam int mentoringNum) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		Mentors dto = service.listMentoringDetail(mentoringNum);
		
		model.put("dto", dto);
		
		return model;
	}
	
	@RequestMapping(value = "revenueManage")
	public String mentorRevenue(
			@RequestParam(required = false) String year,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		List<Object> revenueList = new ArrayList<Object>();
		List<Mentors> mentoringDetailList = new ArrayList<Mentors>();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		LocalDateTime now = LocalDateTime.now();
		String nowYearMonth = now.toString().substring(0, 7).replaceAll("-", "/");
		int mentoringPrice = 0;
		map.put("year", year);
		map.put("memberEmail", info.getMemberEmail());
		
		map2.put("nowYearMonth", nowYearMonth);
		map2.put("memberEmail", info.getMemberEmail());
		
		revenueList = service.mentoringRevenueList(map);
		mentoringDetailList = service.mentoringDetailList(map);
		for(Mentors item : mentoringDetailList) {
			mentoringPrice += item.getMentoringPrice();
		}
		
		//System.out.println("========================" + mentoringPrice);
		
		//System.out.println("----------------------------" + revenueList);
		model.addAttribute("allRevenue", service.allRevenueCount(info.getMemberEmail()));
		model.addAttribute("monthRevenue", service.monthRevenueCount(map2));
		model.addAttribute("revenueList", revenueList);
		model.addAttribute("mentoringDetailList", mentoringDetailList);
		model.addAttribute("mentoringPrice", mentoringPrice);
		model.addAttribute("mentoringYearList", service.mentoringYearList(info.getMemberEmail()));
		model.addAttribute("year", year);
		
		return ".mentorPage.mentorRevenueManage";
	}
	
	
}
