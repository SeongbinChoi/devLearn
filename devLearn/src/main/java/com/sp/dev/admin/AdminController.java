package com.sp.dev.admin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.adminController")
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	private DashboardService service;
	
	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String admin(
			Model model
			) throws Exception {
		DashBoard dto = new DashBoard();
		
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		String thisMonth =  y+"-"+(m < 10 ? "0"+m : m);
		
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("month", thisMonth);
		int monthNewMember = service.countMonthNewMember(map);
		dto.setMonthNewMember(monthNewMember);
		
		int monthnewLecture = service.countMonthNewLecture(map);
		dto.setMonthnewLecture(monthnewLecture);
		
		int waitingLecture = service.countWaitingLecture();
		dto.setWaitingLecture(waitingLecture);
		
		int waitingQnA = service.countWaitingQnA();
		dto.setWaitingQnA(waitingQnA);
		
		if (--m == 0) {
			y--;
			m = 12;
		}
		String lastMonth = y+"-"+(m < 10 ? "0"+m : m);
		
		map.clear();
		map.put("month",lastMonth);
		int lastMonthNewMember = service.countMonthNewMember(map);
		dto.setLastMonthNewMember(lastMonthNewMember);
		double newMemberPer = (double)(Math.abs(monthNewMember - lastMonthNewMember))/monthNewMember * 100;
		newMemberPer  = (double)Math.round(newMemberPer*100)/100;

		int lastMonthnewLecture = service.countMonthNewLecture(map);
		dto.setLastMonthnewLecture(lastMonthnewLecture);
		double newLecturePer = (double)(Math.abs(monthnewLecture - lastMonthnewLecture))/monthnewLecture * 100;
		newLecturePer  = (double)Math.round(newLecturePer*100)/100;

		
		
		
		
		model.addAttribute("newLecturePer",newLecturePer);
		model.addAttribute("newMemberPer",newMemberPer);
		model.addAttribute("dto",dto);
		
		return ".admin.main.dashboard";
	}
	
	
	@RequestMapping(value = "drwGraph")
	@ResponseBody
	public Map<String, Object> drawGraph (
			) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		Map<String, Object> monthMap = new HashMap<String, Object>();
		String month = y+"-"+(m < 10 ? "0"+m : m);
		monthMap.put("month12", month);
		
		for(int i = 0 ; i< 11 ; i++) {
			m--;
			if(m <= 0) {
				m = 12;
				y--;
			}
			month = y+"-"+(m < 10 ? "0"+m : m);
			monthMap.put("month"+(11-i),month);
		}
		
		Set<String> keySet = monthMap.keySet();
		List<String> monthTitleList = new ArrayList<String>();
		for(String s : keySet) {
			monthTitleList.add(monthMap.get(s).toString());
		}
		Collections.sort(monthTitleList);
		
		List<Integer> yearlyLectureSalesList = service.yearlyLectureSales(monthMap);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("monthList", monthTitleList);
		model.put("yearlyData",yearlyLectureSalesList);
		return model;
	}
	
}
