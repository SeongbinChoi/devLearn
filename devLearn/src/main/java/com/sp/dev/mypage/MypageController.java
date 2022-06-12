package com.sp.dev.mypage;

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
import org.springframework.web.servlet.ModelAndView;

import com.sp.dev.member.SessionInfo;

@Controller("mypage.mypageController")
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private CalendarService calService;
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session) throws Exception {
		
		return ".mypage.memberPageDashboard";
	}
	
	
	// 일정관리
	
	// 메인
	@RequestMapping(value = "planMain")
	public ModelAndView main(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", info.getMemberEmail());
		
		List<Calendar> list = calService.listCalendar(map);
		
		
		ModelAndView mav = new ModelAndView(".mypage.memberPagePlan");
		mav.addObject("list", list);
		
		return mav;
	}
	
	// 리스트
	@RequestMapping(value = "myPlan", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> myPlan(HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", info.getMemberEmail());
		
		List<Calendar> list = calService.listCalendar(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		
		
		return model;
	}
	
	@RequestMapping(value = "myPlan", method = RequestMethod.POST)
	public String myPlan(HttpSession session, Calendar cal) throws Exception {
		//일정추가
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			cal.setMemberEmail(info.getMemberEmail());
			
			calService.insertCalendar(cal);
		} catch (Exception e) {
		}

		return "redirect:/mypage/planMain";
		
	}
	
	
	// 일정 삭제 AJAX
	@RequestMapping(value = "myPlan/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> planDelete(@RequestParam int planNum, HttpSession session) throws Exception {
		
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
	

	
	
	@RequestMapping(value = "myStudy", method = RequestMethod.GET)
	public String myStudy() throws Exception {
		
		return ".mypage.memberPageMyStudy";
	}
	
	@RequestMapping(value = "mentor", method = RequestMethod.GET)
	public String mentor() throws Exception {
		
		return ".mypage.memberPageMentor";
	}

	
	@RequestMapping(value = "myWrite", method = RequestMethod.GET)
	public String myWrite() throws Exception {
		
		return ".mypage.memberPageMyWrite";
	}
	
	@RequestMapping(value = "myInquiry", method = RequestMethod.GET)
	public String myInquiry() throws Exception {
		
		return ".mypage.memberPageInquiry";
	}
	
	
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart() throws Exception {
		
		return ".mypage.memberPageCart";
	}

	
	@RequestMapping(value = "like", method = RequestMethod.GET)
	public String like() throws Exception {
		
		return ".mypage.memberPageLike";
	}

	
	@RequestMapping(value = "coupon", method = RequestMethod.GET)
	public String coupon() throws Exception {
		
		return ".mypage.memberPageCoupon";
	}
	
	
	@RequestMapping(value = "point", method = RequestMethod.GET)
	public String point() throws Exception {
		
		return ".mypage.memberPagePoint";
	}

	
	@RequestMapping(value = "purchased", method = RequestMethod.GET)
	public String purchased() throws Exception {
		
		return ".mypage.memberPagePurchased";
	}
	
	
	
	
	@RequestMapping(value = "noti", method = RequestMethod.GET)
	public String noti() throws Exception {
		
		return ".mypage.memberPageNoti";
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile() throws Exception {
		
		return ".mypage.memberPageProfile";
	}

	
	@RequestMapping(value = "setNoti", method = RequestMethod.GET)
	public String setNoti() throws Exception {
		
		return ".mypage.memberPageSetNoti";
	}
	
}
