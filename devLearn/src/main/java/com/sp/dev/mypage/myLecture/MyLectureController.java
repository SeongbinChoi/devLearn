package com.sp.dev.mypage.myLecture;

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

@Controller("mypage.myLecture.myLectureController")
@RequestMapping("/mypage/*")
public class MyLectureController {
	
	@Autowired
	private MyLectureService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "myLecture")
	public String myLecture(@RequestParam(value = "page", defaultValue = "1") int current_page,
						  @RequestParam(defaultValue = "") String keyword,
						  @RequestParam(value = "order", defaultValue = "2") int order,
						  HttpServletRequest req,
						  HttpSession session,
						  Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("order", order);
		
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		map.put("memberEmail", id);
		
		dataCount = service.myLectureDataCount(map);
		
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

		
		List<MyLecture> list = service.myLectureList(map);
		String listUrl = cp + "/mypage/myLecture";
		String articleUrl = cp + "/lectures/lectures/lectureNum=";
		
		String query = "rows=" + rows;
		if (keyword.length() != 0) {
			query += "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
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
		model.addAttribute("keyword", keyword);
		model.addAttribute("order", order);
		
		return ".mypage.memberPageMyLecture";
	}
}
