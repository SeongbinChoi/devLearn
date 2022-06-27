package com.sp.dev.member;

public class Member {
	private String memberEmail; // 회원 로그인 아이디(이메일)
	private String memberPwd;	// 패스워드
	private String memberName;	// 실명
	private String memberNickname;	// 닉네임
	private String memberRole;	// 등급(회원, 멘토, 강사, 관리자 등)
	private int pwdFail;		// 비밀번호 실패 횟수
	private String regDate;		// 회원가입 날짜
	private int emailCheck;		// 이메일 수신 여부
	private int enabled;		// 로그인 가능 여부
	private String infoUpdate;	// 정보 수정일
	private String lastLogin;	// 마지막 로그인 날짜
	
	private String profileSaveFileName;	// 프로필 저장 파일 명
	private String intro;				// 소개
	private String businessEmail;		// 비지니스 메일 명
	private String phoneNum;			// 전화번호
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberRole() {
		return memberRole;
	}
	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}
	public int getPwdFail() {
		return pwdFail;
	}
	public void setPwdFail(int pwdFail) {
		this.pwdFail = pwdFail;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getEmailCheck() {
		return emailCheck;
	}
	public void setEmailCheck(int emailCheck) {
		this.emailCheck = emailCheck;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getInfoUpdate() {
		return infoUpdate;
	}
	public void setInfoUpdate(String infoUpdate) {
		this.infoUpdate = infoUpdate;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String getProfileSaveFileName() {
		return profileSaveFileName;
	}
	public void setProfileSaveFileName(String profileSaveFileName) {
		this.profileSaveFileName = profileSaveFileName;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getBusinessEmail() {
		return businessEmail;
	}
	public void setBusinessEmail(String businessEmail) {
		this.businessEmail = businessEmail;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	
}
