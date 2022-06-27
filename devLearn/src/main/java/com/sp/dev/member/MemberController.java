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

import com.sp.dev.admin.memberManage.MemberManage;

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
			RedirectAttributes rea,
			Model model) throws Exception {
		
		int res = service.readMemberCount(memberEmail); // 이메일이 존재하지 않으면 -> 실패 
		if(res== 0) { 
			StringBuilder mes = new StringBuilder();
			mes.append("등록된 아이디가 아닙니다.");
		 
			rea.addFlashAttribute("message", mes.toString());
			rea.addFlashAttribute("mode", "enabled"); return "redirect:/"; 
		}
		
		Member dto = service.loginMember(memberEmail);
		
		// 로그인 실패시 -> 비번 틀린경우
		if(dto == null || !memberPwd.equals(dto.getMemberPwd())) {
			// 틀린횟수 5회 일때 -> 상태 비활성화로 변경 후 메인으로 이동하면서 비활성화 됬다고 알리기
			if(dto.getPwdFail() == 5) {
				MemberManage Mdto = new MemberManage();
				Mdto.setAdminId("admin");
				Mdto.seteMail(memberEmail);
				Mdto.setStateCode(9);
				Mdto.setMemo("비밀번호 잘못입력 횟수 초과");
				
				service.updatePwdEnabled(Mdto ,memberEmail);
				service.updatePwdFailUp(memberEmail);
				
				StringBuilder mes = new StringBuilder();
				mes.append("패스워드 5회 이상 실패로 비활성화 되었습니다.\\n관리자에게 문의해주세요.");
				
				rea.addFlashAttribute("message", mes.toString());
				rea.addFlashAttribute("mode", "enabled");
				return "redirect:/";
			}
			
			// 틀린횟수 5회 이상 -> 메인으로 이동하면서 비활성화 계정이라고 알려줌
			else if(dto.getPwdFail() > 5) {
				StringBuilder mes = new StringBuilder();
				mes.append("패스워드 5회 이상 실패로 비활성화 되었습니다.\\n관리자에게 문의해주세요.");
				
				rea.addFlashAttribute("message", mes.toString());
				rea.addFlashAttribute("mode","enabled");
				return "redirect:/";
			}
			
			// 틀린횟수 5회 미만시 -> pwdFail 카운트 증가
			else if(dto.getPwdFail() < 5) {
				model.addAttribute("message", "패스워드가 일치하지 않습니다.");
				service.updatePwdFailUp(memberEmail);
				return ".member.login";
			}
		}
		
		// 로그인 성공했는데 비활성화 계정인 경우
		if(dto.getEnabled() == 99) {
			rea.addFlashAttribute("message","비활성 된 계정입니다. 관리자에게 문의해주세요.");
			rea.addFlashAttribute("mode","enabled");
			return "redirect:/";
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
		
		
		// 6개월이상 정보수정안한사람 -> 관리자문의
		
		// 1년이상 미접속자 -> 관리자 문의  (보류)
		
		// 로그인 성공 시 변경사항들 업데이트
		service.updateMemberState(info.getMemberEmail());
		
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
