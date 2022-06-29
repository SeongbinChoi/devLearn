package com.sp.dev.lecturenews;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.dev.common.FileManager;
import com.sp.dev.common.MyUtil;
import com.sp.dev.lectures.Lectures;
import com.sp.dev.lectures.LecturesService;
import com.sp.dev.member.SessionInfo;

@Controller("lecturenews.lecNewsController")
@RequestMapping("/lecturenews/*")
public class LecNewsController {
	@Autowired
	private LecNewsService service;
	@Autowired
	private LecturesService lservice;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	// 연결하면서 강의번호 받아오기
	@RequestMapping("news")
	public String news(@RequestParam int lectureNum, Model model) throws Exception {
		
		Lectures dto = lservice.readLecture(lectureNum);
		if(dto == null) {
			return "redirect:/lectures/lectures";
		}
		
		dto.setLectureContent(dto.getLectureContent());
		
		model.addAttribute("dto", dto); 
		model.addAttribute("lectureNum", lectureNum);
		
		return ".lecturenews.news";
	}
	
	// 작성
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info.getMemberRole() != "20" && info.getMemberRole() != "30") {
			return "redirect:/lecturenews/article";
		}
		model.addAttribute("mode", "write");
		
		return "lecturenews.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(LecNews dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info.getMemberRole() != "20" && info.getMemberRole() != "30") {
			return "redirect:/lecturenews/article";
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "lecturenews";
			
			dto.setMemberEmail(info.getMemberEmail());
			service.insertLecNews(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/lecturenews/article";
	}
	
	@ResponseBody
	@RequestMapping(value = "article")
	public Map<String, Object> article(
			@RequestParam int lectureNum,
			
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNum", lectureNum);
		
		
		int rows = 3;
		int dataCount = service.dataCount(map);
		int total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<LecNews> list = service.listLecNews(map);
		for(LecNews dto : list) {
			dto.setSubject(dto.getSubject());
			dto.setRegDate(dto.getRegDate());
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		Map<String, Object> mod = new HashMap<>();
		
		mod.put("dataCount", dataCount);
		mod.put("total_page", total_page);
		mod.put("pageNo", current_page);
		mod.put("list", list);
		
		return mod;
	}
	
	public String updateForm() throws Exception {
		
		return ".lecturenews.write";
	}
	
	public String updateSubmit() throws Exception {
		
		return "redirect:/lecturenews/article";
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam int newsNum,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info.getMemberRole() != "99") {
			return "redirect:/lecturenews/news";
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "lecturenews";
			service.deleteLecNews(newsNum, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/lecturenews/article";
	}
	
	@RequestMapping(value = "download")
	public void download(@RequestParam int newsFileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "lecturenews";

		boolean b = false;
		
		LecNews dto = service.readFile(newsFileNum);
		if(dto != null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if(!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	public Map<String, Object> deleteFile() throws Exception {
		
		return null;
	}
}
