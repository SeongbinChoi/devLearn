package com.sp.dev.admin.memberManage;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.dev.common.MyUtil;
import com.sp.dev.member.SessionInfo;
	
@Controller("admin.memberManage.memberManageController")
@RequestMapping("/admin/memberManage/*")
public class MemberManageController {
	@Autowired
	private MemberManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="main")	
	public String main(
			@RequestParam(defaultValue = "") String enabled,
			@RequestParam(defaultValue = "") String mRole,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1" , value="page") int currentPage,
			HttpServletRequest req,
			Model model
			) {
		
		String cp = req.getContextPath();
		
		int rows = 5;
		
		int dataCount = 0;
		int totalPage = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("mRole", mRole);
		map.put("enabled", enabled);
		dataCount = service.dataCount(map);
		
		totalPage = dataCount / rows + (dataCount % rows > 0 ? 1 : 0);
		if (currentPage > totalPage) {
			totalPage = currentPage;
		}
		
		int start = (currentPage -1 ) * rows + 1 ;
		int end = currentPage * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<MemberManage> list = service.listMember(map);		
		
		String listUrl = cp+ "/admin/memberManage/main"; 
		String query = "";
		
		try {
			
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (enabled.length() != 0) {
			if (query.length() != 0)
				query = query + "&enabled=" + enabled;
			else
				query = "enabled=" + enabled;
		}
		
		if (mRole.length() != 0) {
			if (query.length() != 0)
				query = query + "&mRole=" + mRole;
			else
				query = "mRole=" + mRole;
		}
		
		if (query.length() != 0) {
			listUrl = listUrl + "?" + query;
		}
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		String paging = myUtil.paging(currentPage, totalPage, listUrl);
		
		model.addAttribute("rows", rows);
		model.addAttribute("paging", paging);
		model.addAttribute("page", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("mRole", mRole);
		model.addAttribute("enabled", enabled);
		model.addAttribute("memberCount", dataCount);
		model.addAttribute("list", list);
		
		return ".admin.memberManage.main";
	}
	
	
	@RequestMapping(value="detail")
	public String detailMember(
			@RequestParam String eMail, 
			Model model
			) throws Exception {
		
		MemberManage dto = service.readMember(eMail);
		MemberManage memberState = service.readMemberState(eMail);
		List<MemberManage> list = service.listMemberState(eMail);
		
		model.addAttribute("dto", dto);
		model.addAttribute("stateList", list);
		model.addAttribute("memberState", memberState);
		
		return "admin/memberManage/infoDetail";
	}
	
	@RequestMapping(value="updateRole")
	@ResponseBody
	public Map<String, Object> updateRole(
			@RequestParam String eMail,
			@RequestParam String mRole
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eMail", eMail);
		map.put("mRole", mRole);
		
		try {
			service.updateMemberRole(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("eMail", eMail);
		return model;
		//return "redirect:/admin/memberManage/main";
	}
	
	@RequestMapping(value="updateEnabled")
	@ResponseBody
	public Map<String, Object> insertMemberState(
			MemberManage dto,
			HttpServletRequest req,
			HttpSession session
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String admin =info.getMemberEmail();
		dto.setAdminId(admin);
		
		String eMail = dto.geteMail();
		int enabled = dto.getEnabled();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eMail",eMail);
		map.put("enabled",enabled);
		try {
			service.updateMemberEnabled(map, dto);
			
			if (enabled == 1) {
				service.updateFailureCountReset(dto.geteMail());
					
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("eMail",eMail);
		return model;
	}
	
	@RequestMapping(value="applyList")
	public String applyList(
			@RequestParam(defaultValue = "") String applyRole,
			@RequestParam(defaultValue = "") String status,
			Model model
			) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("applyRole", applyRole);
		map.put("status", status);
		
		int dataCount = service.countApplyMember(map);
		List<MemberManage> list = service.listApplyMember(map);
		
		model.addAttribute("status", status);
		model.addAttribute("applyRole", applyRole);
		model.addAttribute("applyList", list);
		model.addAttribute("applyCount", dataCount);
		return "admin/memberManage/applyList";
	}
	
	
	@RequestMapping(value = "applyDetail")
	public String readApplyDetail(
			@RequestParam String eMail,
			Model model
			) {
		
		ApplyManage dto = service.readApplyDetail(eMail);
		
		model.addAttribute("applyDto",dto);
		return "admin/memberManage/applyDetail";
	}
	
	@RequestMapping(value = "updateApply")
	public String updateApply(
			ApplyManage dto
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eMail",dto.geteMail());
		map.put("mRole", dto.getApplyRole());
		
		service.updateMemberRole(map);
		service.updateApplyStatus(dto.geteMail());
		
		return "redirect:/admin/memberManage/applyList";
	}
	
	@RequestMapping(value="notifyList")
	public String notifiyList(
			@RequestParam(defaultValue = "") String state,
			@RequestParam(defaultValue = "1" , value="page") int currentPage,
			NotifyManage dto,
			HttpServletRequest req,
			Model model
			) {
		
		
		int rows = 5;
		int start = (currentPage -1 ) * rows + 1 ;
		int end = currentPage * rows;
		int dataCount = 0;
		int totalPage = 0;
		
		totalPage = dataCount / rows  + (dataCount % rows > 0 ? 1 : 0);
		if (currentPage > totalPage) {
			totalPage = currentPage;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("state",state);
		
		dataCount = service.countNotified(map);
		List<NotifyManage> list = service.listNotifiedMember(map);
		
		String cp = req.getContextPath();
		String listUrl = cp+"/bbs/memberManage/notifyList";
		String query = "";
		
		
		if (state.length() != 0) {
			query = "state="+state;
		}
		
		if(query.length() != 0) {
			listUrl = listUrl + "?" + query;
		} 
		
		String paging = myUtil.paging(currentPage, totalPage, listUrl);
		
		model.addAttribute("notifyRows",rows);
		model.addAttribute("notifyPage",currentPage);
		model.addAttribute("notifyTotalPage",totalPage);
		model.addAttribute("notifyPaging", paging);
		model.addAttribute("notifyCount",dataCount);
		model.addAttribute("notifyList", list);
		return "admin/memberManage/notifyList";
	}
	
	
	@RequestMapping(value="notifyDetail")
	public String notifyDetail(
			@RequestParam(defaultValue = "") int notifyNum,
			Model model
			) throws Exception {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notifyNum", notifyNum);
		
		NotifyManage dto = service.readNotifiedDetail(notifyNum);
		
		model.addAttribute("notifyDto", dto);
		return "admin/memberManage/notifyDetail";
	}
}
