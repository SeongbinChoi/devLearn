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
	@RequestMapping(value = "delete", method = RequestMethod.GET)
		public String delete(@RequestParam String videoFilename,
				@RequestParam(defaultValue = "all") String condition,
				@RequestParam(defaultValue = "") String keyword,
				HttpSession session) throws Exception {

			keyword = URLDecoder.decode(keyword, "utf-8");
			if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "video" + File.separator + videoFilename;

			try {
				service.deleteVideo(pathname);
			} catch (Exception e) {
			}

			return "redirect:/instructorPage/instructorNewLecture2?" + query;
		}
	*/

	/*
	@RequestMapping(value = "instructorPageLectureList", method = RequestMethod.POST)
	public String instructorPageLectureList(
			Lectures dto, HttpSession session
			) throws Exception {
		// 테이블애 저장하고 비디오 리스트 화면으로 이동
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "video";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setMemberEmail(info.getMemberEmail());
		
		try {
			service.insertVideo(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/instructorPage/instructorPageLectureList";
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
		String id = info.getMemberEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", id);
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
	
	@RequestMapping(value = "instructorPageQnaList", method = RequestMethod.GET)
	public String instructorPageQnaList() throws Exception {
		
		return ".instructorPage.instructorPageQnaList";
	}
	
	
	
}

