package com.sp.dev.instrutorPage;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			@ModelAttribute Lectures dto, 
			HttpSession session,
			RedirectAttributes ra
			) throws Exception {
		// 테이블애 자장하고 비디오 등록 화면으로 이동
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "thumbNail";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setMemberEmail(info.getMemberEmail());
		
		try {
			dto=service.insertLecture(dto, pathname);
		} catch (Exception e) {
		}
		
		ra.addFlashAttribute("dto", dto);
		
		return "redirect:/instructorPage/instructorPageNewLecture2";
	}

	// AJAX를 이용하여 비디오 저장
	@RequestMapping(value = "instructorPageLectureVideo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> instructorPageLectureVideo(
			Lectures dto, 
			HttpSession session
			) throws Exception {
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "video";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setMemberEmail(info.getMemberEmail());
		
		System.out.println(dto.getLectureNum() + dto.getVideoSelectFile().getOriginalFilename());
		
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "false";
		try {
			int videoNum = service.insertVideo(dto, pathname);
			
			state = "true";
			model.put("videoNum", videoNum);
		} catch (Exception e) {
		}
		
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "videoDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> instructorPageLectureVideoDelete(
			@RequestParam int videoNum, 
			HttpSession session
			) throws Exception {
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "video";
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "false";
		try {
			Lectures dto = service.readVideo(videoNum);
			if(dto != null) {
				pathname = pathname + File.separator + dto.getVideoFileName();
				
				service.deleteVideo(videoNum, pathname);
				state = "true";
			}
			
		} catch (Exception e) {
		}
		
		model.put("state", state);
		return model;
	}
	
	/*
	@RequestMapping(value = "lectureDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> instructorPageLectureDelete(
			@RequestParam int lectureNum, 
			HttpSession session
			) throws Exception {
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "video";
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "false";
		try {
			Lectures dto = service.readVideo(lectureNum);
			Lectures dto2 = service.readLecture(lectureNum);
			if(dto != null && dto2 != null) {
				pathname = pathname + File.separator + dto.getVideoFileName();
				
				service.deleteLectureVideo(lectureNum, pathname);
				state = "true";
			}
		String state2 = "false";	
			if(dto2 != null && state ="true") {
				pathname = pathname + File.separator + dto.getThumbNail();
				
				service.deleteLecture(lectureNum, pathname);
				state2 = "true";
			}
			
		} catch (Exception e) {
		}
		
		model.put("state", state);
		return model;
	}
	*/


	
	
	@RequestMapping(value = "instructorPageNewLecture2", method = RequestMethod.GET)
	public String instructorPageNewLecture2(@ModelAttribute("dto") Lectures dto) throws Exception {
		
		return ".instructorPage.instructorPageNewLecture2";
	}
	
	@RequestMapping(value = "instructorPageLectureList", method = RequestMethod.GET)
	public String instructorPageLectureList(
			@RequestParam(defaultValue = "1", value = "page") int currentPage,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int rows = 10;
		int totalPage = 0;
		int dataCount = 0;
		
		int start = (currentPage - 1) * rows + 1;
		int end = currentPage * rows;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String memberEmail = info.getMemberEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("start", start);
		map.put("end", end);
		
		dataCount = service.countLecture(map);
		List<Lectures> list = service.listLecture(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/instructorPage/instructorPageLectureList";
		String query = "";
		
		if(query.length() != 0) {
			listUrl = listUrl + "?" + query;
		}
		
		if(dataCount != 0) {
			totalPage = myUtil.pageCount(rows, dataCount);
		}
		
		totalPage = dataCount / rows + (dataCount % rows > 0 ? 1 : 0);
		if(currentPage > totalPage) {
			totalPage = currentPage;
		}
		
		String lecturePaging = myUtil.paging(currentPage, totalPage, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("page", currentPage);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("paging", lecturePaging);
		
		return ".instructorPage.instructorPageLectureList";
	}
	
	@RequestMapping(value = "instructorPageNewLecture4", method = RequestMethod.GET)
	public String instructorPageNewLecture4() throws Exception {
		
		return ".instructorPage.instructorPageNewLecture4";
	}
	
	@RequestMapping(value = "instructorPageNewLecture3", method = RequestMethod.GET)
	public String instructorPageNewLecture3() throws Exception {
		
		return ".instructorPage.instructorPageNewLecture3";
	}
	
	@RequestMapping(value = "instructorPage", method = RequestMethod.GET)
	public String instructorPage() throws Exception {
		
		return ".instructorPage.instructorPage";
	}
	
	
	
	
	@RequestMapping(value = "instructorPageDashBoard", method = RequestMethod.GET)
	public String instructorPageDashBoard() throws Exception {
		
		return ".instructorPage.instructorPageDashBoard";
	}
	
	@RequestMapping(value = "instructorPageRev", method = RequestMethod.GET)
	public String instructorPageRev() throws Exception {
		
		return ".instructorPage.instructorPageRev";
	}
	
		
	@RequestMapping(value = "instructorPageQnaList")
	public String instructorPageQnaList(
						  @RequestParam(value = "page", defaultValue = "1") int current_page,
						  HttpServletRequest req,
						  HttpSession session,
						  Model model
						  ) throws Exception {
		
		String cp = req.getContextPath();
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String id = info.getMemberEmail();
		
		map.put("memberEmail", id);
		
		dataCount = service.countInquiry(map);
		System.out.println("데이터카운트 : " + dataCount);
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

		
		List<Lectures> list = service.listInquiry(map);
		System.out.println(list);
		String listUrl = cp + "/instructorPage/instructorPageQnaList";
		String articleUrl = cp + "/lectures/lectures/lectureNum=";
		
		String query = "rows=" + rows;
		listUrl += "?" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("rows", rows);
		
		return ".instructorPage.instructorPageQnaList";
	}
	
	
	
}

