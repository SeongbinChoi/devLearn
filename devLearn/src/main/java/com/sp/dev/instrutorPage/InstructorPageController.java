package com.sp.dev.instrutorPage;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.dev.common.MyUtil;
import com.sp.dev.member.SessionInfo;

@Controller("instructorPage.instructorPageController")
@RequestMapping("/instructorPage/*")
public class InstructorPageController {
	@Autowired
	private InstructorPageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "instructorPageDashboard", method = RequestMethod.GET)
	public String instructorPageDashboard() throws Exception {
		
		return ".instructorPage.instructorPageDashboard";
	}
	
	
	@GetMapping("subCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(
			@RequestParam String mainCategory
			) throws Exception {
		
		List<Lectures> listSubCategory = service.listSubCategory(mainCategory);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listSubCategory", listSubCategory);
		
		return model;
	}
		
	// 처음 등록 화면
	@RequestMapping(value = "instructorPageNewLecture", method = RequestMethod.GET)
	public String instructorPageNewLecture(
			Model model, 
			HttpSession session
			) throws Exception {
		
		
		// 대분류
		List<Lectures> listCategory = service.listCategory();
		// 대분류에 대한 중분류
		
		List<Lectures> listSubCategory = null;
		if(listCategory != null) {
			String catogoryCode = listCategory.get(0).getCategoryCode();
			listSubCategory =service.listSubCategory(catogoryCode);
		}
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		
		return ".instructorPage.instructorPageNewLecture";
	}
	
	@RequestMapping(value = "instructorPageNewLecture2", method = RequestMethod.POST)
	public String instructorPageNewLecture2(
			Lectures dto, HttpSession session
			) throws Exception {
		// 테이블애 자장하고 비디오 등록 화면으로 이동
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "thumbNail";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setMemberEmail(info.getMemberEmail());
		
		try {
			service.insertLecture(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/instructorPage/instructorPageNewLecture2";
	}


	
	@RequestMapping(value = "instructorPageNewLecture3", method = RequestMethod.GET)
	public String instructorPageNewLecture3() throws Exception {
		
		return ".instructorPage.instructorPageNewLecture3";
	}
	
	@RequestMapping(value = "instructorPageNewLecture2", method = RequestMethod.GET)
	public String instructorPageNewLecture2() throws Exception {
		
		return ".instructorPage.instructorPageNewLecture2";
	}
	
	@RequestMapping(value = "instructorPageLectureList", method = RequestMethod.GET)
	public String instructorPageNewLecture4() throws Exception {
		
		return ".instructorPage.instructorPageLectureList";
	}
	
	
	@RequestMapping(value = "instructorPage", method = RequestMethod.GET)
	public String instructorPage() throws Exception {
		
		return ".instructorPage.instructorPage";
	}
	
	@RequestMapping(value = "instructorPage2", method = RequestMethod.GET)
	public String instructorPage2() throws Exception {
		
		return ".instructorPage.instructorPage2";
	}
	
	@RequestMapping(value = "instructorPageDashBoard", method = RequestMethod.GET)
	public String instructorPageDashBoard() throws Exception {
		
		return ".instructorPage.instructorPageDashBoard";
	}
	
	@RequestMapping(value = "instructorPageRev", method = RequestMethod.GET)
	public String instructorPageRev() throws Exception {
		
		return ".instructorPage.instructorPageRev";
	}
	
}

