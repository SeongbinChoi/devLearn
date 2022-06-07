package com.sp.dev.member;

import java.util.Map;

public interface MemberService {
	public Member loginMember(String email);
	
	public void insertMember(Member dto) throws Exception;
	
	public void updateLastLogin(String email) throws Exception;
	public void updateMember(Member dto) throws Exception;
	
	public Member readMember(String email);
	
	// 회원 탈퇴 (delete가 아닌 enabled 컬럼 update)
	public void deleteMember(Map<String, Object> map) throws Exception;
	
	// 비밀번호 랜덤 10자리 변경(비밀번호 찾기)
	public void generatePwd(Member dto) throws Exception;
}
