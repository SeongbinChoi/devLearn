package com.sp.dev.member;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private MailSender mailSender;
	
	
	// 로그인
	@Override
	public Member loginMember(String memberEmail) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("member.loginMember", memberEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	
	// 회원가입
	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			dao.insertData("member.insertMember", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	
	// 마지막 로그인일시 변경
	@Override
	public void updateLastLogin(String email) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	// 임시비밀번호로 수정 
	@Override
	public void updateMemberPwd(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("member.updateMembership", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	// 회원 정보 수정
	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			dao.updateData("member.updateMember", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	// 이메일로 회원가입여부
	@Override
	public int readMemberCount(String email) {
		int result = 0;
		
		try {
			result = dao.selectOne("member.readMemberCount", email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	// 이메일로 회원정보 읽어오기
	@Override
	public Member readMember(String memberEmail) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("member.readMember", memberEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	// 회원삭제(삭제가 아닌 비활성화)
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		
		
	}

	
	// 10 자리 임시 인증코드(이메일 확인)
	@Override
	public Mail generateEmail(Mail dto) throws Exception {
		StringBuilder sb = new StringBuilder();
		// 영문자, 숫자를 조합하여 10자리의 임시 인증코드 생성
		String s = "ABCDEFGHIJKLMNOPRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		Random rd = new Random();
		for(int i=0; i<10; i++) {
			int n = rd.nextInt(s.length());
			sb.append(s.substring(n, n+1));
		}
		
		String result;
		result = "<h3>안녕하세요. devLearn입니다.</h3><br>"
				+ dto.getReceiverEmail() + "님의 임시 인증코드는 <b>" 
				+ sb.toString()
				+ "</b> 입니다.<br>";
				
		dto.setSubject("devLearn사이트 이메일 인증코드");
		dto.setContent(result);
		
	
	  boolean b = mailSender.mailSend(dto);
	  
	  if(b) {
		  dto.setCertification(sb.toString());
	  } else {
		  throw new Exception("이메일 전송중 오류가 발생했습니다.");
	  }
  
	  return dto;
	}
	
	
	// 10 자리 임시 인증코드(비밀번호 찾기)
	@Override
	public void generatePwd(Mail dto) throws Exception {
		StringBuilder sb = new StringBuilder();
		// 영문자, 숫자를 조합하여 10자리의 임시 인증코드 생성
		String s = "ABCDEFGHIJKLMNOPRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		Random rd = new Random();
		for(int i=0; i<10; i++) {
			int n = rd.nextInt(s.length());
			sb.append(s.substring(n, n+1));
		}
		
		String result;
		result = "<h3>안녕하세요. devLearn입니다.</h3><br>"
				+ dto.getReceiverEmail() + "님의 임시 패스워드는<b>" 
				+ sb.toString()
				+ "</b> 입니다.<br>";
				
		dto.setSubject("devLearn사이트 임시비밀번호");
		dto.setContent(result);
		
	
	  boolean b = mailSender.mailSend(dto);
	  
	  if(b) {
		  dto.setCertification(sb.toString());
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("memberEmail", dto.getReceiverEmail());
		  map.put("memberPwd", dto.getCertification());
		  
		  updateMemberPwd(map);
	  } else {
		  throw new Exception("이메일 전송중 오류가 발생했습니다.");
	  }
	}
	
}
