package com.sp.dev.member;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("member.memberController")
@RequestMapping(value = "/member/*")
class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "goMain")
	public String goMain() {
		
		return "redirect:/";
	}
	
	// 회원가입 폼 (GET)
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode", "signUp");
		
		return ".member.member";
	}
	
	// 회원가입 (POST)
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String memberSubmit(
			Member dto,
			final RedirectAttributes reAttr,
			Model model) {
		try {
			service.insertMember(dto);
		} catch (DuplicateKeyException e) {
			// 기본키 중복에 의한 제약 조건 위반
			model.addAttribute("message", "이메일 중복으로 회원가입에 실패했습니다.");
			return ".member.member";
		} catch (DataIntegrityViolationException e) {
			// 데이터형식 오류, 참조키, NOT NULL 등의 제약조건 위반
			model.addAttribute("message", "제약 조건 위반으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return ".member.member";
		}

		StringBuilder sb = new StringBuilder();
		sb.append("<b>" + dto.getMemberName() + "</b> 님의 <br>회원 가입이 정상적으로 처리되었습니다.<br><br>");
		sb.append("메인 화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("title", "회원가입");
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/member/complete";
	}
	
	
	// 확인문구
	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {
		if(message == null || message.length() == 0) {
			return "redirect:/";
		}
		
		return ".member.complete";
	}
	
	
	// 로그인 (GET)
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {
		
		return ".member.login";
	}
	
	// 로그인 (POST)
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
	
	
	// 로그아웃
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		// 세션 정보 삭제
		session.removeAttribute("member");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	// 
	@RequestMapping(value = "infoShare", method = RequestMethod.GET)
	public String infoShare() {
		
		return ".member.infoShare";
	}
	
	
	// 비밀번호 찾기 폼(GET)
	@RequestMapping(value="pwdFind", method=RequestMethod.GET)
	public String pwdFindForm(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info != null) {
			return "redirect:/";
		}
		
		return ".member.pwdFind";
	}
	
	
	// 비밀번호 찾기 (POST)
	@RequestMapping(value="pwdFind", method=RequestMethod.POST)
	public String pwdFindSubmit(
			@RequestParam String memberEmail,
			RedirectAttributes reAttr,
			Model model) throws Exception {
		int res = service.readMemberCount(memberEmail);
		// 이메일이 존재하지 않으면 -> 실패
		if(res == 0) {
			model.addAttribute("message", "등록된 아이디가 아닙니다.");
			return ".member.pwdFind";
		} else {
			Member dto = service.readMember(memberEmail);
			
			// 비활성화 계정이라면 -> 실패
			if(dto.getEnabled() == 99) {
				model.addAttribute("message", "비활성화 된 계정입니다.");
				return ".member.pwdFind";
			} else {	// 정상 회원이라면 -> 이메일로 임시 비밀번호 전송
				try {
					Mail mDto = new Mail();
					mDto.setSenderEmail("limchae157@naver.com");
					mDto.setSenderName("관리자");
					mDto.setReceiverEmail(memberEmail);
					
					service.generatePwd(mDto);
				} catch (Exception e) {
					model.addAttribute("message", "임시비밀번호 전송이 실패했습니다.");
					return ".member.pwdFind";
				}
					
			}
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<b>" + memberEmail + "</b>님의 이메일로 <br>임시 패스워드를 전송했습니다.<br><br>");
		sb.append("로그인 후 패스워드를 변경 하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("title", "비밀번호 찾기");
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/member/complete";
	}
	
	
	// 정보수정 전 패스워드 재확인
	@RequestMapping(value = "pwdCheck")
	public String pwdCheck(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info == null) {
			return "redirect:/";
		}
		Member dto = service.readMember(info.getMemberEmail());
		
		model.addAttribute("dto", dto);
		
		return ".member.pwdCheck";
	}
	
	// 정보수정(GET)
	@RequestMapping(value = "update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam String memberEmail,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getMemberEmail());
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".member.member";
	}
	
	// 정보수정(POST)
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public String updateSubmit(
			Member dto,
			final RedirectAttributes reAttr,
			Model model) throws Exception {
		
		try {
			service.updateMember(dto);
		} catch (Exception e) {
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append(dto.getMemberName() + "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("message", sb.toString());

		return "redirect:/member/complete";
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////
	// ajax
	// 이메일 중복확인을 위한 ajax-json
	@RequestMapping(value = "emailOverlapCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> emailOverlapCheck(@RequestParam String email) throws Exception {
		String p = "true";
		int result = service.readMemberCount(email);
		
		if(result != 0) {
			p = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("passed", p);
		
		return model;
	}
	
	
	// 이메일로 인증코드 보내기 ajax-json
	@RequestMapping(value = "emailCertification", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> emailCertification(@RequestParam String email) {
		
		String p = "true";
		
		Mail dto = new Mail();
		
		dto.setSenderEmail("limchae157@naver.com");
		dto.setSenderName("관리자");
		dto.setReceiverEmail(email);
		
		try {
			dto = service.generateEmail(dto);
		} catch (Exception e) {
			p = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("passed", p);
		model.put("Certification", dto.getCertification());
		
		return model;
	}
	
}
