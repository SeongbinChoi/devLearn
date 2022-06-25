package com.sp.dev.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("member.infoShareController")
@RequestMapping("/member/infoShare/*")
public class InfoShareController {
	@Autowired
	private InfoShareService service;
	
	@RequestMapping(value="enroll", method = RequestMethod.POST)
	public String enrollInfoShare(
			InfoShare dto,
			Model model,
			RedirectAttributes ra
			) throws Exception {
		String eMail = dto.geteMail();
		
		InfoShare readKnowledgeApplyDto = service.readKnowledgeApply(eMail);
		if(readKnowledgeApplyDto != null) {
			model.addAttribute("message", "이미 신청된 내용이 있습니다. 신청이 처리되기를 조금만 기다려주세요.");
			return ".member.infoShare";
		}
		try {
			String readProfileMail =service.readProfile(eMail); 
			if( readProfileMail == null ) {
				service.insertProfile(dto);
			} else {
				service.updateProfile(dto);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ra.addFlashAttribute("message","신청이 완료되었습니다.");
		return "redirect:/member/infoShare";
	}
	
	
}
