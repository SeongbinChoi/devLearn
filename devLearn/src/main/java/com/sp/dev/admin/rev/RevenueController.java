package com.sp.dev.admin.rev;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.rev.revnueController")
@RequestMapping("admin/rev/*")
public class RevenueController {
	
	@Autowired
	private RevenueService service;
	
	@RequestMapping("main")
	public String main() {
		
		return ".admin.revenue.main";
	}
	
	@RequestMapping(value="totalSales" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> totalChart() {
	
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		
		List<String> months = new ArrayList<String>();
		String month = y+"-"+(m < 10 ? "0"+m : m);
		months.add(month);
		for(int i = 0 ; i< 11 ; i++) {
			m--;
			if(m <= 0) {
				m = 12;
				y--;
			}
			month = y+"-"+(m < 10 ? "0"+m : m);
			months.add(month);
		}
		
		Collections.sort(months);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("months", months);
		
		
		List<Integer> yearlyLectureSalesList = service.yearlyLectureSales(map);
		List<Integer> yearlyMentorSalesList = service.yearlyMentorSales(map);
		List<Integer> yearlyTotalSalesList = new ArrayList<Integer>();
		int s;
		for(int i=0; i<yearlyLectureSalesList.size(); i++) {
			s = yearlyLectureSalesList.get(i) + yearlyMentorSalesList.get(i);
			yearlyTotalSalesList.add(s);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("totalSales", yearlyTotalSalesList);
		model.put("monthList",months);
		return model;
	}
	
	@RequestMapping(value= "totalCategories", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> totalCategories() throws Exception {
Calendar cal = Calendar.getInstance();
		

		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		String month = y+"-"+(m < 10 ? "0"+m : m);
		map.put("stdMonth", month);
		
		List<String> categories = new ArrayList<String>();
		List<String> categoryNames = service.categoryNames();
		for(int i = 1 ; i<=categoryNames.size() ; i++) {
			String s;
			if(i<10) {
				s = "0"+i;
			} else {
				s = String.valueOf(i);
			}
				
			categories.add(s);
		}
		
		map.put("categories", categories);
		List<Integer> mentorValueList = service.mentorCategoryValue(map);
		List<Integer> lectureValueList = service.lectureCategoryValue(map);
		int s;
		
		List<Integer> resultList = new ArrayList<Integer>();
		
		for(int i = 0; i<mentorValueList.size(); i++) {
			s = mentorValueList.get(i)+ lectureValueList.get(i);
			resultList.add(s);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("resultList",resultList);
		model.put("categories",categoryNames);
		model.put("stdMonth", month);
		return model;
	}
	
	
	@RequestMapping(value="lectureSales" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> lectureSales() throws Exception {
		
		Calendar cal = Calendar.getInstance();
		
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		
		List<String> months = new ArrayList<String>();
		String month = y+"-"+(m < 10 ? "0"+m : m);
		months.add(month);
		for(int i = 0 ; i< 11 ; i++) {
			m--;
			if(m <= 0) {
				m = 12;
				y--;
			}
			month = y+"-"+(m < 10 ? "0"+m : m);
			months.add(month);
		}
		
		Collections.sort(months);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("months", months);
		List<Integer> yearlyLectureSalesList = service.yearlyLectureSales(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("monthList",months);
		model.put("yearlyLectureSalesList",yearlyLectureSalesList);
		return model;
	}
	
	@RequestMapping(value= "lectureCategories", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> lectureCategoies(
			) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		

		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		String month = y+"-"+(m < 10 ? "0"+m : m);
		map.put("stdMonth", month);
		
		List<String> categoryNames = service.categoryNames();
		List<String> categories = new ArrayList<String>();
		for(int i = 1 ; i<=categoryNames.size() ; i++) {
			String s;
			if(i<10) {
				s = "0"+i;
			} else {
				s = String.valueOf(i);
			}
				
			categories.add(s);
		}
		
		map.put("categories", categories);
		List<Integer> list = service.lectureCategoryValue(map);
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("list",list);
		model.put("categories",categoryNames);
		model.put("stdMonth", month);
		return model;
	}
	
	@RequestMapping(value = "mentorSales" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String , Object> mentorSales () throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Calendar cal = Calendar.getInstance();
		
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		
		List<String> months = new ArrayList<String>();
		String month = y+"-"+(m < 10 ? "0"+m : m);
		months.add(month);
		for(int i = 0 ; i< 11 ; i++) {
			m--;
			if(m <= 0) {
				m = 12;
				y--;
			}
			month = y+"-"+(m < 10 ? "0"+m : m);
			months.add(month);
		}
		
		Collections.sort(months);
		map.put("months", months);
		
		List<Integer> yearlyMentorSalesList = service.yearlyMentorSales(map);
		
		Map<String, Object> model = new HashMap<String, Object>();

		
		model.put("monthList",months);
		model.put("yearlyMentorSalesList",yearlyMentorSalesList);
		return model;
	}

	@RequestMapping(value= "mentorCategories", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> mentorCategoies(
			) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		

		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		String month = y+"-"+(m < 10 ? "0"+m : m);
		map.put("stdMonth", month);
		
		List<String> categories = new ArrayList<String>();
		List<String> categoryNames = service.categoryNames();
		for(int i = 1 ; i<=categoryNames.size() ; i++) {
			String s;
			if(i<10) {
				s = "0"+i;
			} else {
				s = String.valueOf(i);
			}
				
			categories.add(s);
		}
		
		map.put("categories", categories);
		List<Integer> list = service.mentorCategoryValue(map);
		
		Map<String, Integer> resultmap = new HashMap<String, Integer>();
		for(int i = 0; i<categories.size(); i++) {
			resultmap.put(categories.get(i),list.get(i));
		}
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("categories", categoryNames);
		model.put("list", list);
		model.put("stdMonth", month);
		return model;
	}
	/*
	@RequestMapping(value= "mentorCategories", produces="application/json; charset=utf-8")
	@ResponseBody
	public String mentorCategoies(
			) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		

		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		String month = y+"-"+(m < 10 ? "0"+m : m);
		map.put("stdMonth", month);
		
		List<String> categoryNames = service.categoryNames();
		List<String> categories = new ArrayList<String>();
		for(int i = 1 ; i<=categoryNames.size() ; i++) {
			String s;
			if(i<10) {
				s = "0"+i;
			} else {
				s = String.valueOf(i);
			}
				
			categories.add(s);
		}
		
		map.put("categories", categories);
		List<Integer> list = service.mentorCategoryValue(map);
		
		Map<String, Integer> resultmap = new HashMap<String, Integer>();
		for(int i = 0; i<categories.size(); i++) {
			resultmap.put(categories.get(i),list.get(i));
		}
		
		JSONArray jarr = new JSONArray();
		
		JSONObject job;
		
		for(int i = 0; i<categories.size(); i++) {
			job = new JSONObject();
			job.put("name", categoryNames.get(i));
			job.put("value",list.get(i));
			jarr.put(job);
			
		}	
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("resultData", jarr.toString());
		model.put("stdMonth", month);
		return jarr.toString();
	}
	*/
	
}
