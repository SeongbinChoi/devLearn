package com.sp.dev.lectures;

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

@Controller("lectures.lecturesController")
@RequestMapping("/lectures/*")
public class LecturesController {
	@Autowired
	private LecturesService service;
	@Autowired
	private MyUtil myUtil;
		
	@RequestMapping("all")
	public String lectureAll(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 20;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
 
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Lectures> list = service.listLecture(map);
		
		String query = "";
		String listUrl = cp + "/lectures/all";
		String articleUrl = cp + "/lectures/lectureDetail" + current_page;
		if(keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/lectures/all?page=" + current_page + "&" + query;
			articleUrl = cp + "/lectures/lectureDetail?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("current_page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
		return ".lectures.lectures";
	}
	
	@RequestMapping(value = "detail")
	public String lectureDetail(@RequestParam int lectureNum,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "lectureNum=" + lectureNum;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + 
					"&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		Lectures dto = service.readLecture(lectureNum);
		if(dto == null) {
			return "redirect:/lectures/lectures?" + query;
		}
		
		dto.setLectureContent(dto.getLectureContent());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", info.getMemberEmail());
		boolean memberLectureLike = service.memberLectureLiked(map);
		
		model.addAttribute("dto", dto);		
		model.addAttribute("lectureNum", lectureNum);
		model.addAttribute("memberLectureLike", memberLectureLike);

		model.addAttribute("query", query);
		
		return ".lectures.lectureDetail";
	}
}
