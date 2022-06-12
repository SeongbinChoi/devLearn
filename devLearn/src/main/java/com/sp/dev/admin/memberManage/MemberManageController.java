package com.sp.dev.admin.memberManage;

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

import com.sp.dev.member.SessionInfo;
	
@Controller("admin.memberManage.memberManageController")
@RequestMapping("/admin/memberManage/*")
public class MemberManageController {
	@Autowired
	private MemberManageService service;
	
	@RequestMapping(value="main")	
	public String main(
			@RequestParam(defaultValue = "") String enabled,
			HttpServletRequest req,
			Model model
			) {

		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		dataCount = service.dataCount(map);
		
		List<MemberManage> list = service.listMember(map);		
		
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
		
		System.out.println("=================================admin: "+admin);
		
		String eMail = dto.geteMail();
		int enabled = dto.getEnabled();
		dto.setAdminId(admin);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eMail",eMail);
		map.put("enabled",enabled);
		try {
			service.updateMemberEnabled(map, dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("eMail",eMail);
		return model;
	}
	
}
