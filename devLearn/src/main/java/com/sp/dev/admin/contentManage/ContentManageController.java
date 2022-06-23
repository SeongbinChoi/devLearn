package com.sp.dev.admin.contentManage;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.dev.common.MyUtil;

@Controller("admin.contentManage.ContentManageController")
@RequestMapping("/admin/contentManage/*")
public class ContentManageController {
	
	@Autowired
	private ContentManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="main")
	public String main(
			@RequestParam(defaultValue = "1", value = "page") int currentPage,
			@RequestParam(defaultValue = "99") int state,
			HttpServletRequest req,
			Model model
			) throws Exception{

		
		int rows = 10;
		int dataCount = 0;
		int totalPage = 0;
		
		int start = ((currentPage - 1) * rows) + 1;
		int end = currentPage * rows;
		

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("state", state);
		
		
		dataCount = service.countLecture(map);
		List<ContentManage> list = service.listContent(map);
		
		String cp = req.getContextPath();
		String listUrl = cp+"/admin/contentManage/main";
		String query = "";
		
		
		if(state != 99) {
			query += "&state="+state;
		}
		
		if(query.length() != 0) {
			listUrl = listUrl + "?" + query;
		}

		
		totalPage = dataCount / rows + (dataCount % rows > 0 ? 1 : 0);
		if(currentPage > totalPage) {
			totalPage = currentPage;
		}
		
		String paging = myUtil.paging(currentPage, totalPage, listUrl);
		
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("page", currentPage);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("state", state);
		return ".admin.contentManage.main";
	}
	
}
