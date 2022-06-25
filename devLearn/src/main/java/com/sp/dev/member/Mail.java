package com.sp.dev.member;

public class Mail {
	private String receiverEmail;  		// 받는 사람  이메일
	private String senderEmail; 		// 보내는 사람  이메일
	private String senderName; 			// 보내는 사람  이름
	private String subject; 			// 메일 제목
	private String content; 			// 메일 내용
	private String Certification; 		// 인증코드

	
	public String getReceiverEmail() {
		return receiverEmail;
	}
	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}
	public String getSenderEmail() {
		return senderEmail;
	}
	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCertification() {
		return Certification;
	}
	public void setCertification(String certification) {
		Certification = certification;
	}
	
}
