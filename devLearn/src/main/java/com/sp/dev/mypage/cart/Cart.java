package com.sp.dev.mypage.cart;

public class Cart {
	private String memberEmail;
	private String memberName;
	private int lectureNum;
	
	private String lectureSubject;
	private String memberNickname;
	private String lectureDuration;
	private String thumbnail;
	private int lecturePrice;
	private int dcPercent;
	
	private int dcAfterPrice;
	
	private int totalPrice;
	private int totalDiscount;
	
	private int totalPay;
	
	private int detailNum;
	
	private int sugangNum;
	private int lecturePay;
	private int discount;
	private String lectureSdate;
	private String lectureEdate;
	
	public int getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(int detailNum) {
		this.detailNum = detailNum;
	}
	public int getSugangNum() {
		return sugangNum;
	}
	public void setSugangNum(int sugangNum) {
		this.sugangNum = sugangNum;
	}
	public int getLecturePay() {
		return lecturePay;
	}
	public void setLecturePay(int lecturePay) {
		this.lecturePay = lecturePay;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getLectureSdate() {
		return lectureSdate;
	}
	public void setLectureSdate(String lectureSdate) {
		this.lectureSdate = lectureSdate;
	}
	public String getLectureEdate() {
		return lectureEdate;
	}
	public void setLectureEdate(String lectureEdate) {
		this.lectureEdate = lectureEdate;
	}
	
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getLectureSubject() {
		return lectureSubject;
	}
	public void setLectureSubject(String lectureSubject) {
		this.lectureSubject = lectureSubject;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getLectureDuration() {
		return lectureDuration;
	}
	public void setLectureDuration(String lectureDuration) {
		this.lectureDuration = lectureDuration;
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

	public int getDcAfterPrice() {
		return (lecturePrice * (100 - dcPercent) / 100);
	}
	public void setDcAfterPrice(int dcAfterPrice) {
		this.dcAfterPrice = dcAfterPrice; 
	}
	
	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public int getTotalDiscount() {
		return totalDiscount;
	}
	
	public void setTotalDiscount(int totalDiscount) {
		this.totalDiscount = totalDiscount;
	}
	public int getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	
}
