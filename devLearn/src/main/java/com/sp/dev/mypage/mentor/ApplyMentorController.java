package com.sp.dev.mypage.mentor;

import java.text.SimpleDateFormat;
import java.util.Date;
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


@Controller("mypage.mentor.mentorController")
@RequestMapping("/mypage/mentor/*")
public class ApplyMentorController {
	
	@Autowired
	private ApplyMentorService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String mentorList(
					  @RequestParam(value = "page", defaultValue = "1") int current_page,
					  @RequestParam(value = "status", defaultValue = "9") int status,
					  HttpServletRequest req,
					  HttpSession session,
					  Model model
					  ) throws Exception {
		
		String cp = req.getContextPath();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		// status가 예약확정(1)인 리스트 날짜 불러오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", id);
		List<ApplyMentor> statusList  = service.status1(map);
		
		// 시간 비교
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date currentTime = new Date();
		String date = format.format(currentTime);
		
		for(ApplyMentor my : statusList) {
			String end_dt = my.getMentoringDate().replaceAll("/", "-");
			
			System.out.println(my.getMentoringDate());
			System.out.println(date);
			
			Date endDate = format.parse(end_dt);
			Date todate = format.parse(date);
			
			int compare = endDate.compareTo(todate);
			if(compare >= 0) {
				System.out.println("사용가능");
			} else {
				System.out.println("유효기간만료");
				
				service.updateStatus(my.getMentoringNum());
			}
			
		}

		
		// 전체 리스트
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		map.put("status", status);
		
		dataCount = service.mentorDataCount(map);
		
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

		
		List<ApplyMentor> list = service.mentorList(map);
		int listNum, n = 0;
		for(ApplyMentor my : list) {
			listNum = dataCount - (start + n - 1);
			my.setListNum(listNum);
			n++;
		}
		
		String listUrl = cp + "/mypage/mentor/list";
		String articleUrl = cp + "/community/qnaList_article?page=1&rows=10";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("status", status);
		
		return ".mypage.memberPageMentor";
	}
	
	
	// 멘토링 상세 - AJAX
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> readMentor(HttpSession session, @RequestParam int mentoringNum) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", id);
		map.put("mentoringNum", mentoringNum);
		
		ApplyMentor am = service.readMentor(map);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("am", am);
		
		return model;
		
	}
	
	
	@RequestMapping(value = "insertReview", method = RequestMethod.POST)
	public String insertReview(ApplyMentor dto, Model model) throws Exception {
		
		try {
			ApplyMentor am = service.readMentorReview(dto.getMentoringNum());
			
			if(am == null) {
				service.insertMentorReview(dto);
			} else {
				service.updateMentorReview(dto);
			}
			
		} catch (Exception e) {
		}
		
		return "redirect:/mypage/mentor/list?status=3";
	}
	
	@RequestMapping(value = "readReview", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> readReview(@RequestParam int mentoringNum) throws Exception {
		
		ApplyMentor dto = service.readMentorReview(mentoringNum);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("readReview", dto);
		
		return model;
	}
}
