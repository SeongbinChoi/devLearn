package com.sp.dev.mentors;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.dev.common.MyUtilBootstrap;

@Controller("mentors.mentorsController")
@RequestMapping("/mentors/*")
public class MentorsController {
	@Autowired
	private MentorsService service;
	
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@RequestMapping(value = "mentor")
	public String mentor(
			@RequestParam(value = "current_page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int choiceValue,
			@RequestParam(defaultValue = "0") int categoryNum,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows = 12;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("choiceValue", choiceValue);
		map.put("categoryNum", categoryNum);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Mentors> list = service.listMentoring(map);
		List<Mentors> categoryList = service.listCategory();
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/mentors/mentor";
		
		if(choiceValue != 0) { query += "choiceValue=" + choiceValue; }
		if(categoryNum != 0) { query += "&categoryNum=" + categoryNum; }
		
		listUrl += "?" + query;
		
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
				
		model.addAttribute("list", list);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("current_page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("choiceValue", choiceValue);
		
		return ".mentors.mentors";
	}
	
	// ajax - json
	@RequestMapping(value = "mentorDetail")
	@ResponseBody
	public Map<String, Object> mentorDetail(
			@RequestParam(value="pageNo", defaultValue = "1")int current_page,
			@RequestParam(value="mentorNum") int mentorNum
			) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		Mentors dto = service.readMentors(mentorNum);
		model.put("dto", dto);
		
		return model;
	};
	
	// ajax - json 테스트 - 시간만 가져오기
	@RequestMapping(value = "mentorApply")
	@ResponseBody
	public Map<String, Object> mentorApply(@RequestParam(value="mentorNum") int mentorNum) throws Exception {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		Mentors dto = service.readAbleTime(mentorNum);
		int sTime = Integer.parseInt(dto.getsTime());
		int eTime = Integer.parseInt(dto.geteTime());
		int size = 0;
		
		for(int i = sTime; i < eTime; i++) {
			 size += 1;
		}
		System.out.println(size);
		
		int ableTime[] = new int[size];
		int index = 0;
		
		for(int i = sTime; i < eTime; i++) {
			 ableTime[index] = i;
			 index++;
		}
	
		
		model.put("dto", dto); // 멘토링 상세 정보(멘토링 번호, 시작, 종료시간, 멘토링 회당 가격)
		model.put("ableTime", ableTime); // 멘토링 가능 시간
		
		return model;
	}
}
