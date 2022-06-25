package com.sp.dev.member;

import java.util.Map;

public interface MemberService {
	//로그인
	public Member loginMember(String email);
	// 회원가입
	public void insertMember(Member dto) throws Exception;
	
	// 최근 로그인 날짜 수정
	public void updateLastLogin(String email) throws Exception;
	// 회원정보수정
	public void updateMember(Member dto) throws Exception;
	// 임시비밀번호로 수정
	public void updateMemberPwd(Map<String, Object> map) throws Exception;
	
	// 회원이메일 중복확인
	public int readMemberCount(String email);
	// 회원정보 가져오기
	public Member readMember(String memberEmail);
	
	// 회원 탈퇴 (delete가 아닌 enabled 컬럼 update)
	public void deleteMember(Map<String, Object> map) throws Exception;
	
	// 인증코드 랜덤 10자리 변경(이메일 인증코드)
	public Mail generateEmail(Mail dto) throws Exception;
	// 인증코드 랜덤 10자리 변경(비밀번호 인증코드)
	public void generatePwd(Mail dto) throws Exception;	
	
}
