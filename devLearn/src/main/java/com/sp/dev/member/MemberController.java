package com.sp.dev.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("member.memberController")
@RequestMapping(value = "/member/*")
class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("visuable", "hidden");
		return ".member.signUp";
	}
	
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String memberSubmit(
			Member dto,
			final RedirectAttributes reAttr,
			Model model) {
		
		try {
			service.insertMember(dto);
		} catch (DuplicateKeyException e) {
			// 기본키 중복에 의한 제약 조건 위반
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
			return ".member.signUp";
		} catch (DataIntegrityViolationException e) {
			// 데이터형식 오류, 참조키, NOT NULL 등의 제약조건 위반
			model.addAttribute("message", "제약 조건 위반으로 회원가입이 실패했습니다.");
			return ".member.signUp";
		} catch (Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return ".member.signUp";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getMemberEmail() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인 화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("message", sb.toString());
		
		return ".redirect:/member/complete";
	}
	
	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {
		if(message == null || message.length() == 0) {
			return "redirect:/";
		}
		
		return ".member.complete";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {
		
		return ".member.login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String memberEmail,
			@RequestParam String memberPwd,
			HttpSession session,
			Model model) {
		
		Member dto = service.loginMember(memberEmail);
		if(dto == null || !memberPwd.equals(dto.getMemberPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}
		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setMemberEmail(dto.getMemberEmail());
		info.setMemberName(dto.getMemberName());
		info.setMemberNickname(dto.getMemberNickname());
		info.setMemberRole(dto.getMemberRole());
		info.setPhoneNum(dto.getPhoneNum());
		
		session.setMaxInactiveInterval(30 * 60);
		session.setAttribute("member", info);
		
		// 로그인 이전 URI 이동
		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if(uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}
		
		return uri;
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		// 세션 정보 삭제
		session.removeAttribute("member");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "infoShare", method = RequestMethod.GET)
	public String infoShare() {
		
		return ".member.infoShare";
	}
}
