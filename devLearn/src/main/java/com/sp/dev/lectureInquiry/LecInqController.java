package com.sp.dev.lectureInquiry;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.dev.member.SessionInfo;

@Controller("lectureInquiry.lecInqController")
@RequestMapping("/lectureInquiry/*")
public class LecInqController {
	@Autowired
	private LecInqService service;
	
//	@RequestMapping("inquiry")
//	public String inquiry(@RequestParam int lectureNum, Model model) throws Exception {
//		model.addAttribute("lectureNum", lectureNum);
//		
//		return ".lectureInquiry.inquiry";
//	}
	
	@RequestMapping("inquiry")
	public String inquiry(Model model) throws Exception {
		
		return ".lectureInquiry.inquiry";
	}
	
	// AJAX
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public Map<String, Object> writeSubmit(LecInq dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setQmember(info.getMemberEmail());
			service.insertInquiry(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	
	public String writeForm() throws Exception {
		
		return "redirect:/lectureInquiry/inquiry";
	}
	
	public String article() throws Exception {
		
		return ".lectureInquiry.inquiry";
	}
	
	public String answerSubmit() throws Exception {
		
		return "redirect:/lectureInquiry/inquiry?";// + query;
	}
	
	public String deleteAnswer() throws Exception {
		
		return "redirect:/lectureInquiry/inquiry?";// + query;
	}
	
	public String delete() throws Exception {
		
		return "redirect:/lectureInquiry/inquiry?";// + query;
	}
}
