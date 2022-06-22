package com.sp.dev.mypage.myWrite;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.dev.common.MyUtil;
import com.sp.dev.member.SessionInfo;

@Controller("mypage.myWrite.myWriteController")
@RequestMapping("/mypage/myWrite/*")
public class MyWriteController {
	
	@Autowired
	private MyWriteService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "myWrite", method = RequestMethod.GET)
	public String myWriteList(
						  @RequestParam(value = "page", defaultValue = "1") int current_page,
						  @RequestParam(value = "status", defaultValue = "2") int status,
						  HttpServletRequest req,
						  HttpSession session,
						  Model model
						  ) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 7;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", id);
		map.put("selected", status);
		
		dataCount = service.qnaDataCount(map);
		
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

		
		List<MyWrite> list = service.qnaList(map);
		int listNum, n = 0;
		for(MyWrite my : list) {
			listNum = dataCount - (start + n - 1);
			my.setListNum(listNum);
			n++;
		}
		
		String listUrl = cp + "/mypage/myWrite/myWrite";
		String articleUrl = cp + "/community/qnaList_article?page=1&rows=10";
		
		String qnaPaging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("qnaArticleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("qnaPaging", qnaPaging);
		model.addAttribute("status", status);
		
		
		return ".mypage.memberPageMyWrite";
	}
	
	@RequestMapping(value = "myStudyWrite", method = RequestMethod.GET)
	public String myStudyWriteList(
						  @RequestParam(value = "page", defaultValue = "1") int current_page,
						  @RequestParam(value = "status", defaultValue = "2") int status,
						  HttpServletRequest req,
						  HttpSession session,
						  Model model
						  ) throws Exception {
		
		String cp = req.getContextPath();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		// 스터디
		int rows = 3;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", id);
		map.put("status", status);
		
		dataCount = service.studyDataCount(map);
		
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
		
		List<MyStudyWrite> list = service.studyList(map);
		int listNum, n = 0;
		for(MyStudyWrite my : list) {
			listNum = dataCount - (start + n - 1);
			my.setListNum(listNum);
			n++;
		}
		
		String listUrl = cp + "/mypage/myWrite/myStudyWrite";
		String studyArticleUrl = cp + "/community/studyList_article?page=1&rows=10";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("studyArticleUrl", studyArticleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("status", status);
		
		
		return ".mypage.memberPageMyStudyWrite";
	}
	

	
	@RequestMapping(value = "applyList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> applyList(@RequestParam int studyNum) throws Exception {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		return model;
	}
	
}
