package com.sp.dev.member;

import java.util.Map;

import com.sp.dev.admin.memberManage.MemberManage;

public interface MemberService {
	//로그인
	public Member loginMember(String email);
	// 로그인 성공 시 초기화사항(last login 현재날짜, pwdFail을 0으로 초기화)
	public void updateMemberState(String memberEmail) throws Exception;
	// 로그인 실패 횟수를 세고 5회 이하면 -> 카운트 증가
	public void updatePwdFailUp(String memberEmail) throws Exception;
	// 로그인 실패 횟수를 세고 5회 이상이면 -> 계정 비활성화 시키기
	public void updatePwdEnabled(MemberManage dto, String memberEmail) throws Exception;
	// 1년이상 미접속자 -> 계정 비활성화 시키기
	public void updateLoginEnabled(MemberManage dto, String memberEmail) throws Exception;
	
	// 회원가입
	public void insertMember(Member dto) throws Exception;
	
	// 회원정보수정
	public void updateMember(Member dto) throws Exception;
	// 비밀번호 찾으면 임시비밀번호로 수정
	public void updateMemberPwd(Map<String, Object> map) throws Exception;
	
	
	// 회원이메일 중복확인
	public int readMemberCount(String email);
	// 회원정보 가져오기
	public Member readMember(String memberEmail);
	
	// 인증코드 랜덤 10자리 변경(이메일 인증코드)
	public Mail generateEmail(Mail dto) throws Exception;
	// 인증코드 랜덤 10자리 변경(비밀번호 인증코드)
	public void generatePwd(Mail dto) throws Exception;	
	
}
