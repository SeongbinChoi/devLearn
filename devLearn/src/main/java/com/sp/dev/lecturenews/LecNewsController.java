package com.sp.dev.lecturenews;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.dev.common.FileManager;
import com.sp.dev.common.MyUtil;
import com.sp.dev.member.SessionInfo;

@Controller("lecturenews.lecNewsController")
@RequestMapping("/lecturenews/*")
public class LecNewsController {
	@Autowired
	private LecNewsService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<LecNews> list = service.listNews(map);
		
		Date endDate = new Date();
		long gap;
		int listNum, n = 0;
		for (LecNews dto : list) {
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate = formatter.parse(dto.getRegDate());
			gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
			dto.setGap(gap);
			
			dto.setRegDate(dto.getRegDate().substring(0, 10));
			
			n++;			
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/lecturenews/list";
		String articleUrl = cp + "/lecturenews/article?page=" + current_page;
		if(keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/lecturenews/list?" + query;
			articleUrl = cp + "/lecturenews/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);		
		
		return ".lecturenews.article";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(LecNews dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		// 강사 아니면 컷하는거
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
	
	@RequestMapping(value = "article")
	public String article(@RequestParam int newsNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page;
		if(keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		LecNews dto = service.readNews(newsNum);
		if(dto == null) {
			return "redirect:/lecturenews/list?" + query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		List<LecNews> listFile = service.listFile(newsNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);		
		
		return ".lecturenews.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam int newsNum,
			@RequestParam String page,
			HttpSession session,			
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		LecNews dto = service.readNews(newsNum);
		if(dto == null || ! info.getMemberEmail().equals(dto.getMemberEmail())) {
			return "redirect:/lecturenews/list?page=" + page;
		}
		
		List<LecNews> listFile = service.listFile(newsNum);

		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		return ".lecturenews.write";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(LecNews dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info.getMemberRole() != "20" && info.getMemberRole() != "30") {
			return "redirect:/lecturenews/list?page=" + page;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "lecturenews";
			
			dto.setMemberEmail(info.getMemberEmail());
			service.updateLecNews(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/lecturenews/list?page=" + page;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam int newsNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if(keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(info.getMemberRole() != "20" && info.getMemberRole() != "30") {
			return "redirect:/lecturenews/list?" + query;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "lecturenews";
			service.deleteLecNews(newsNum, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/lecturenews/list?" + query;
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
			String saveFilename = dto.getSaveFileName();
			String originalFilename = dto.getOriginalFileName();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if(! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드 실패');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	public Map<String, Object> deleteFile() throws Exception {
		
		return null;
	}

}
