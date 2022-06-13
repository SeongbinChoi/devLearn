package com.sp.dev.community;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.dev.common.MyUtil;
import com.sp.dev.member.SessionInfo;

@Controller("community.communityController")
@RequestMapping("/community/*")
public class CommunityController {
	@Autowired
	private QnaService service;
	
	@Autowired
	private NotifiedService service2;
	
	@Autowired
	private MyUtil myUtil;

	// QnA 리스트 가져오기
	@RequestMapping(value = "qnaList")
	public String qnaList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(value = "rows", defaultValue = "10") int rows,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		
		System.out.println("-----------------------");
		System.out.println(current_page);
		System.out.println(rows);
		System.out.println(dataCount);
		System.out.println(total_page);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Qna> list = service.listQna(map);
		
		String cp = req.getContextPath();
		String query = "rows=" + rows;
		String listUrl = cp + "/community/qnaList";
		String articleUrl = cp + "/community/qnaList_article?page=" + current_page;
		
		if(keyword.length() != 0) {
			query += "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		model.addAttribute("rows", rows);
		model.addAttribute("keyword", keyword);
		
		return ".community.qnaList";
	}
	
	
	// QnA 게시글 상세보기
	@RequestMapping(value = "qnaList_article")
	public String qnaList_article(
			@RequestParam int qnaNum,
			@RequestParam String page,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam int rows,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page + "&rows=" + rows;
		if(keyword.length() != 0) {
			query += "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		service.updateHitCount(qnaNum);
		Qna dto = service.readQna(qnaNum);
		if(dto == null)
			return "redirect:/community/qnaList?" + query;
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("groupNum", dto.getGroupNum());
		map.put("orderNo", dto.getOrderNo());
		Qna preReadQna = service.preReadQna(map);
		Qna nextReadQna = service.nextReadQna(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadQna", preReadQna);
		model.addAttribute("nextReadQna", nextReadQna);
		model.addAttribute("query", query);
		model.addAttribute("rows", rows);
		model.addAttribute("page", page);
		
		return ".community.qnaList_article";
	}
	

	// 메인 게시글 등록하기
	@RequestMapping(value = "qnaList_write")
	public String qnaList_write(Qna dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberEmail(info.getMemberEmail());
			service.insertQna(dto, "write");
		} catch (Exception e) {
		}
		
		
		return "redirect:/community/qnaList";
	}

	
	// 메인 게시글 수정
	@RequestMapping(value = "qnaList_update")
	public String qnaList_update(
			Qna dto,
			@RequestParam int rows,
			@RequestParam String page,
			@RequestParam String content,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberEmail(info.getMemberEmail());
			service.updateQna(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/community/qnaList?page="+page+"&rows="+rows;
	}
	
	
	// 메인 게시글 해결됨으로 수정 함수
	@RequestMapping(value = "qnaList_updateSelected")
	public String qnaList_updateSelected(
			@RequestParam int qnaNum,
			@RequestParam String page,
			@RequestParam int rows) {
		String query = "page="+page+"&rows="+rows;
		
		try {
			service.updateSelected(qnaNum);
		} catch (Exception e) {
		}
		
		return "redirect:/community/qnaList?" + query;
	}
	
	
	// 답변 게시글
	// 답변 게시글 등록하기(GET) - 폼으로 들어갈때
	@RequestMapping(value = "qnaList_reply", method = RequestMethod.GET)
	public String replyForm(
			@RequestParam int qnaNum,
			@RequestParam String page,
			@RequestParam int rows,
			Model model) throws Exception {

		Qna dto = service.readQna(qnaNum);
		if (dto == null) {
			return "redirect:/community/qnaList?page=" + page + "&rows=" + rows;
		}

		dto.setContent("[" + dto.getSubject() + "] 에 대한 답변입니다.\n");

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		model.addAttribute("mode", "reply");
		
		return ".community.qnaList_replyWrite";
	}
	
	
	// 답변 게시글 등록하기(POST) - 저장
	@RequestMapping(value = "qnaList_reply", method = RequestMethod.POST)
	public String replySubmit(
			Qna dto,
			@RequestParam int rows,
			@RequestParam String page,
			HttpSession session) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberEmail(info.getMemberEmail());
			service.insertQna(dto, "reply");
		} catch (Exception e) {
		}
		
		return "redirect:/community/qnaList?page="+page+"&rows="+rows;
	}
	
		
	// 답변 게시글 수정(GET)
	@RequestMapping(value = "qnaList_replyUpdate", method = RequestMethod.GET)
	public String replyUpdateForm(
			@RequestParam int qnaNum,
			@RequestParam String page,
			@RequestParam int rows,
			Model model) throws Exception {
		
		Qna dto = service.readQna(qnaNum);
		if (dto == null) {
			return "redirect:/community/qnaList?page=" + page + "&rows=" + rows;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		model.addAttribute("mode", "replyUpdate");
		
		return ".community.qnaList_replyWrite";
	}
	
	
	// 답변 게시글 수정(POST)
	@RequestMapping(value = "qnaList_replyUpdate", method = RequestMethod.POST)
	public String replyUpdateSubmit(
			Qna dto,
			@RequestParam int rows,
			@RequestParam String page,
			HttpSession session) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberEmail(info.getMemberEmail());
			service.updateQna(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/community/qnaList?page="+page+"&rows="+rows;
	}
	
	
	// 게시글 삭제
	@RequestMapping(value = "qnaList_delete")
	public String qnaList_delete(
			@RequestParam int qnaNum,
			@RequestParam int groupNum,
			@RequestParam String page,
			@RequestParam int rows,
			@RequestParam (defaultValue="") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String query = "page="+page+"&rows="+rows;
		if(keyword.length() != 0) {
			query += "&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		try {
			service.deleteQna(qnaNum, groupNum, info.getMemberEmail(), Integer.parseInt(info.getMemberRole()));
		} catch (Exception e) {
		}
		
		return "redirect:/community/qnaList?" + query;
	}

	
	// 게시글 신고
	@RequestMapping(value = "qna_singo")
	public String qna_singo(
			Notified dto,
			@RequestParam(value="NqnaNum") int qnaNum,
			@RequestParam(value="NmemberEmail") String memberEmail,
			@RequestParam String page,
			@RequestParam int rows,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		dto.setQnaNum(qnaNum);
		dto.setMemberEmail(memberEmail);
		dto.setSingoNickName(info.getMemberNickname());
		
		
//		System.out.println("----------" + memberEmail);
//		System.out.println("----------" + qnaNum);
//		System.out.println("----------" + page);
//		System.out.println("----------" + rows);
//		System.out.println("----------" + dto.getNotifyReason());
//		System.out.println("----------" + dto.getSubject());
		
		try {
			service2.insertNotified(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/community/qnaList";
	}
	
	
	
	////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////
	// 스터디
	
	@RequestMapping(value = "studyList_aritcle", method = RequestMethod.GET)
	public String studyList_article() throws Exception {
		
		return ".community.studyList_article";
	}
	
	// 게시글 
	@RequestMapping(value = "studyList", method = RequestMethod.GET)
	public String studyList() throws Exception {
		
		return ".community.studyList";
	}
}

