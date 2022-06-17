package com.sp.dev.admin.noticeManage;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.dev.common.MyUtil;

@Controller("admin.noticeManage.noticeController")
@RequestMapping("/admin/noticeManage/*")
public class NoticeManageController {
	@Autowired
	private NoticeManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="main")
	private String list(
			@RequestParam(defaultValue = "1", value="page") int currentPage,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int rows = 10;
		int totalPage = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword , "utf-8");
		}
		
		int start = ( currentPage - 1 ) * rows + 1;
		int end = currentPage * rows;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		map.put("condition",condition);
		
		int dataCount = 0;
	
		dataCount = service.countNotice(map);
		List<Notice> list = service.listNotice(map);
		
		totalPage = dataCount / rows + (dataCount % rows > 0 ? 1 : 0);
		if(currentPage > totalPage) {
			totalPage = currentPage;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("page", currentPage);
		model.addAttribute("total_page", totalPage);
		model.addAttribute("rows", rows);
		model.addAttribute("dataCount", dataCount);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		return ".admin.noticeManage.list";
	}
	
	@GetMapping(value="write")
	private String writeForm () throws Exception {
		
		return "";
	}
	
	@PostMapping(value="write")
	private String writeSubmit(
			Notice dto,
			HttpSession session
			) throws Exception {
		
		//dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		
		
		service.insertNotice(dto);
		return "redirect:/admin/noticeManage/main";
	}
	
	
	@RequestMapping("article")
	private String article(
			@RequestParam int noticeNum,
			Model model
			) throws Exception {
		
		
		Notice dto = service.readNotice(noticeNum);
		
		List<Notice> list = service.listSubject();
		
		model.addAttribute("dto",dto);
		model.addAttribute("subjectList", list);
		return ".admin.noticeManage.notice_article";
	}
	
}
