package com.sp.dev.mypage.inquiry;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.dev.common.MyUtil;
import com.sp.dev.member.SessionInfo;

@Controller("mypage.inquiry.inquiryController")
@RequestMapping("/mypage/*")
public class InquiryController {
	
	@Autowired
	private InquiryService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "myInquiry")
	public String myInquiry(
						  @RequestParam(value = "page", defaultValue = "1") int current_page,
						  @RequestParam(defaultValue = "content") String condition,
						  @RequestParam(defaultValue = "") String keyword,
						  @RequestParam(value = "status", defaultValue = "2") int status,
						  HttpServletRequest req,
						  HttpSession session,
						  Model model
						  ) throws Exception {
		
		String cp = req.getContextPath();
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		map.put("memberEmail", id);
		map.put("status", status);
		
		dataCount = service.dataCount(map);
		
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		
		List<Inquiry> list = service.inquiryList(map);
		System.out.println(list);
		String listUrl = cp + "/mypage/myInquiry";
		String articleUrl = cp + "/lectures/lectures/lectureNum=";
		
		String query = "rows=" + rows;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		listUrl += "?" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("rows", rows);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("status", status);
		
		return ".mypage.memberPageInquiry";
	}
	
	
	@RequestMapping(value = "myInquiry/delete")
	public String deleteInquiry(@RequestParam int inquiryNum) throws Exception {
		
		try {
			service.deleteInquiry(inquiryNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypage/myInquiry";
	}
	
}
