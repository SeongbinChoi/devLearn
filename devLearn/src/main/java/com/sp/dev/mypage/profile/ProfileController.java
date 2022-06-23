package com.sp.dev.mypage.profile;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.dev.member.SessionInfo;

@Controller("mypage.profile.profileController")
@RequestMapping("/mypage/*")
public class ProfileController {
	
	@Autowired
	private ProfileService service;
	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(HttpSession session,
			  				Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String memberEmail = info.getMemberEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		
		Profile dto = service.readProfile(map);
		
		model.addAttribute("dto", dto);
		
		return ".mypage.memberPageProfile";
	}
	
	@RequestMapping(value = "profile/submit", method = RequestMethod.POST)
	public String profileSubmit(HttpSession session, Profile dto) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String memberEmail = info.getMemberEmail();
		dto.setMemberEmail(memberEmail);
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + File.separator + "uploads" + File.separator + "profile";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		
		Profile prof = service.readProfile(map);
		
		if(prof == null) {
			service.insertProfile(dto, path);
		} else {
			service.updateProfile(dto, path);
		}
		service.updateNickname(dto);
		
		
		return "redirect:/mypage/profile";
	}

}
