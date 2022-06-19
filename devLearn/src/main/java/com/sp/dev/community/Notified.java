package com.sp.dev.community;

public class Notified {
	private int notifynum;
	private int qnaNum;
	private String MemberEmail;			
	private String singoNickname;		// 신고자
	private String notifyReason;		// 신고사유
	private String subject;				// 신고 당한 게시글 제목
	private String singoedNickname;		// 글작성자 
	private String regDate;				// 신고날짜
	private int notifyState;			// 처리여부
	
	public int getNotifynum() {
		return notifynum;
	}
	public void setNotifynum(int notifynum) {
		this.notifynum = notifynum;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getMemberEmail() {
		return MemberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		MemberEmail = memberEmail;
	}
	public String getSingoNickname() {
		return singoNickname;
	}
	public void setSingoNickname(String singoNickname) {
		this.singoNickname = singoNickname;
	}
	public String getNotifyReason() {
		return notifyReason;
	}
	public void setNotifyReason(String notifyReason) {
		this.notifyReason = notifyReason;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSingoedNickname() {
		return singoedNickname;
	}
	public void setSingoedNickname(String singoedNickname) {
		this.singoedNickname = singoedNickname;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getNotifyState() {
		return notifyState;
	}
	public void setNotifyState(int notifyState) {
		this.notifyState = notifyState;
	}
	
}
