package com.sp.dev.mypage.like;

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

@Controller("mypage.like.likeController")
@RequestMapping("/mypage/*")
public class LikeController {
	
	@Autowired
	private LikeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "like")
	public String list(
			  @RequestParam(value = "page", defaultValue = "1") int current_page,
			  @RequestParam(value = "free", defaultValue = "2") int free,
			  @RequestParam(value = "order", defaultValue = "2") int order,
			  HttpServletRequest req,
			  HttpSession session,
			  Model model
			  ) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", id);
		map.put("free", free);
		map.put("order", order);
		
		dataCount = service.likeDataCount(map);
		
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

		
		List<Like> list = service.likeList(map);
		
		String listUrl = cp + "/mypage/like";
		String articleUrl = cp + "/community/qnaList_article?page=1&rows=10";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("free", free);
		model.addAttribute("order", order);
		
		return ".mypage.memberPageLike";
	}
}
