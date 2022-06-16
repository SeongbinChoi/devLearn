package com.sp.dev.mypage.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.dev.member.SessionInfo;

@Controller("mypage.calendar.calendarController")
@RequestMapping("/mypage/myPlan/*")
public class CalendarController {
	
	@Autowired
	private CalendarService calService;
	
	// 일정관리
	
	// 메인
	@RequestMapping(value = "planMain")
	public String main(HttpSession session) throws Exception {
		
		
		return ".mypage.memberPagePlan";
		/*
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", info.getMemberEmail());
		
		List<Calendar> list = calService.listCalendar(map);
		
		
		ModelAndView mav = new ModelAndView(".mypage.memberPagePlan");
		mav.addObject("list", list);
		
		return mav;
		*/
	}
	
	// 리스트
	@RequestMapping(value = "myPlan", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> myPlan(@RequestParam String sDate,
										@RequestParam String eDate, 
										HttpSession session) throws Exception {
		
		System.out.println(sDate);
		System.out.println(eDate);
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", info.getMemberEmail());
		map.put("sDate", sDate);
		map.put("eDate", eDate);
		
		List<Calendar> list = calService.listCalendar(map);
		
		for(Calendar cal : list) {
	    	if(cal.getRepeatCheck() != 0 && cal.getRepeatCycle() != 0) { // 반복 일정인 경우
	    		if( cal.getsDate().substring(0,4).compareTo(sDate.substring(0,4)) != 0 ) {
	    			cal.setsDate(sDate.substring(0,4)+cal.getsDate().substring(5));
	    		}
	    	}	    	

		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		
		
		return model;
	}
	
	@RequestMapping(value = "myPlan", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> myPlan(HttpSession session, Calendar cal) throws Exception {
		//일정추가
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";
		
		try {
			cal.setMemberEmail(info.getMemberEmail());
			
			calService.insertCalendar(cal);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	// 일정 상세 - AJAX
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> detailPlan(HttpSession session, @RequestParam int planNum) throws Exception {
		
		Calendar cal = calService.readCalendar(planNum);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cal", cal);
		
		return model;
		
	}
	
	
	// 일정 수정 - AJAX
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatePlan(HttpSession session, Calendar cal) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";
		
		try {
			cal.setMemberEmail(info.getMemberEmail());
			
			calService.updateCalendar(cal);
			
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
		
	}
	
	
	// 일정 삭제 AJAX
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deletePlan(@RequestParam int planNum, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String state = "true";
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("memberEmail", info.getMemberEmail());
			map.put("planNum", planNum);
			calService.deleteCalendar(map);
			
		}catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
		
	}
}
