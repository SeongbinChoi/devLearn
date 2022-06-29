package com.sp.dev.lectureInquiry;

public class LecInq {
	private int inquiryNum;
	private int lectureNum;
	private String memberEmail;
	private String qNickname;
	private String aNickname;
	private String categoryCode;
	private String lectureSubject;
	private String lectureContent;
	private int lecturePrice;
	private int dcPercent;
	private int finalPrice;
	private String memberNickname;
	
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getLectureSubject() {
		return lectureSubject;
	}
	public void setLectureSubject(String lectureSubject) {
		this.lectureSubject = lectureSubject;
	}
	public String getLectureContent() {
		return lectureContent;
	}
	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}
	public int getLecturePrice() {
		return lecturePrice;
	}
	public void setLecturePrice(int lecturePrice) {
		this.lecturePrice = lecturePrice;
	}
	public int getDcPercent() {
		return dcPercent;
	}
	public void setDcPercent(int dcPercent) {
		this.dcPercent = dcPercent;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	private String qmember;
	private String question;
	private String q_regDate;
	
	private String amember;
	private String answer;
	private String a_regDate;
	
	public int getInquiryNum() {
		return inquiryNum;
	}
	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getQmember() {
		return qmember;
	}
	public void setQmember(String qmember) {
		this.qmember = qmember;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQ_regDate() {
		return q_regDate;
	}
	public void setQ_regDate(String q_regDate) {
		this.q_regDate = q_regDate;
	}
	public String getAmember() {
		return amember;
	}
	public void setAmember(String amember) {
		this.amember = amember;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getA_regDate() {
		return a_regDate;
	}
	public void setA_regDate(String a_regDate) {
		this.a_regDate = a_regDate;
	}
	public String getaNickname() {
		return aNickname;
	}
	public void setaNickname(String aNickname) {
		this.aNickname = aNickname;
	}
	public String getqNickname() {
		return qNickname;
	}
	public void setqNickname(String qNickname) {
		this.qNickname = qNickname;
	}
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
}
