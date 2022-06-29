package com.sp.dev.lectureInquiry;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.dev.common.MyUtil;
import com.sp.dev.lectures.Lectures;
import com.sp.dev.lectures.LecturesService;
import com.sp.dev.member.SessionInfo;

@Controller("lectureInquiry.lecInqController")
@RequestMapping("/lectureInquiry/*")
public class LecInqController {
	@Autowired
	private LecInqService service;
	@Autowired
	private LecturesService lservice;
	@Autowired
	private MyUtil myUtil;
	
	// 연결하면서 강의 번호 받아오기 - 이거 없애면 404
	@RequestMapping("inquiry")
	public String inquiry(@RequestParam int lectureNum,
			Model model) throws Exception {
		model.addAttribute("lectureNum", lectureNum); // 이걸로 강의번호를 받아오긴 했는데 이걸로 끝인가?
		
		return ".lectureInquiry.inquiry";
	}
	
	// AJAX - 문의 등록(까지는 작동했다)
	@ResponseBody
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public Map<String, Object> writeSubmit(LecInq dto, HttpSession session, @RequestParam int lectureNum) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setQmember(info.getMemberEmail());
			dto.setLectureNum(lectureNum);
			service.insertInquiry(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	// 답변 등록(입력창이 필요)
	@ResponseBody
	@RequestMapping(value = "answer", method = RequestMethod.POST)
	public Map<String, Object> answerSubmit(LecInq dto, HttpSession session, @RequestParam int lectureNum) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setAmember(info.getMemberEmail());
			dto.setLectureNum(lectureNum);
			service.insertAnswer(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return null;
	}
	
	// 리스트(페이지에 들어가면 질문+답변 2가지가 모두, 1명의 문답만이 아니라 전체 사용자의 문답이 한꺼번에 다 나오도록)
	// sb쪽을 보면 문의 쪽은 list/article.jsp 형태로 나뉘지만 방명록은 guest.jsp 하나만 존재한다 >> 내 경우는 list만 만들면 되는 것
	// 따라서 방명록 쪽에는 listGuest만 있고 readGuest 같은건 없다
	// 반면 문의는 listInquiry와 readInquiry가 모두 있어야 한다(insert, dataCount, delete는 다 있는거고 문의는 answer도 필요하긴 하다)
	@ResponseBody
	@RequestMapping(value = "list")
	public Map<String, Object> list(
			@RequestParam int lectureNum,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNum", lectureNum); // 이게 가장 먼저 나와야 그 아래에서 강의별 dataCount든 list든 가져올 수 있다!
		
		int rows = 5;
		int dataCount = service.dataCount(map);
		int total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<LecInq> list = service.listLecInq(map);
		for(LecInq dto : list) {
			dto.setQuestion(dto.getQuestion().replaceAll("\n", "<br>"));
		}
		
		Map<String, Object> mod = new HashMap<>();
		
		mod.put("dataCount", dataCount);
		mod.put("total_page", total_page);
		mod.put("pageNo", current_page);
		mod.put("list", list);
		
		Lectures dto = lservice.readLecture(lectureNum);
		model.addAttribute("dto", dto);
		System.out.println(dto.getDcPercent() + "---------");
		model.addAttribute("lectureNum", lectureNum);
		return mod;
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteInquiry", method = RequestMethod.POST)
	public Map<String, Object> deleteInquiry(@RequestParam int lectureNum, @RequestParam int inquiryNum, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNum", lectureNum);
		map.put("inquiryNum", inquiryNum);
		 
		String state = "true";
		try {
			map.put("memberRole", info.getMemberRole());
			map.put("memberEmail", info.getMemberEmail());
			service.deleteInquiry(map);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
}
