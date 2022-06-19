package com.sp.dev.notice;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.dev.admin.noticeManage.Notice;
import com.sp.dev.admin.noticeManage.NoticeManageService;
import com.sp.dev.common.MyUtil;

@Controller("notice.noticeController")
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeManageService noticeService;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "notice", method = RequestMethod.GET)	
	public String notice(
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
	
		dataCount = noticeService.countNotice(map);
		List<Notice> list = noticeService.listNotice(map);
		
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
		return ".notice.notice.list";
	}
	
	@RequestMapping(value = "eventList", method = RequestMethod.GET)	
	public String eventList() throws Exception {
		
		return ".notice.eventList";
	}
	
	@RequestMapping(value = "faq", method = RequestMethod.GET)	
	public String faq() throws Exception {
		
		return ".notice.faq";
	}
	
	@RequestMapping(value = "mTomInquiry", method = RequestMethod.GET)	
	public String mTomInquiry() throws Exception {
		
		return ".notice.11questionList";
	}
}
