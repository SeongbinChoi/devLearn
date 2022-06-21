package com.sp.dev.lectureInquiry;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.dev.common.MyUtil;
import com.sp.dev.member.SessionInfo;

@Controller("lectureInquiry.lecInqController")
@RequestMapping("/lectureInquiry/*")
public class LecInqController {
	@Autowired
	private LecInqService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("inquiry")
	public String inquiry(@RequestParam int lectureNum, Model model) throws Exception {
		model.addAttribute("lectureNum", lectureNum);
		
		return ".lectureInquiry.inquiry";
	}
	
	public Map<String, Object> list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page) throws Exception {
		int rows = 10;
		int dataCount = 0;
		int total_page = myUtil.pageCount(rows, dataCount);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<LecInq> list = service.listLecInq(map);
		for(LecInq dto : list) {
			dto.setQuestion(dto.getQuestion().replaceAll("\n", "<br>"));
		}
		
		map.put("dataCount", dataCount);
		map.put("total_page", total_page);
		map.put("pageNo", current_page);
		map.put("list", list);
		
		return map;
	}
	
	// AJAX
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public Map<String, Object> writeSubmit(LecInq dto, HttpSession session, @RequestParam int lectureNum) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setQmember(info.getMemberEmail());
			dto.setLectureNum(lectureNum);
			service.insertInquiry(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		
		return map;
	}
	
	
	public String writeForm() throws Exception {
		
		return "redirect:/lectureInquiry/inquiry";
	}
	
	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String article(@RequestParam int inquirynum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		LecInq dto = service.readInq(inquirynum);
		if(dto == null) {
			return "redirect:/lectureInquiry/inquiry?" + query;
		}
		
		if(! info.getMemberEmail().equals(dto.getMemberEmail()) && info.getMemberRole() != "99") {
			return "redirect:/lectureInquiry/inquiry?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("query", query);
		
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
