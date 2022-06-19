package com.sp.dev.community;

public class Region {
	private int num;				// 기본키
	private String subject;			// 제목
	private String addr;			// 주소
	private String other;			// 상세주소
	private String imageFilename;	// 이미지파일
	private double latitude;		// 위도
	private double longtitude;		// 경도
	
	public Region() {
	}
	
	public Region(int num, String subject, String addr, String other,
				String imageFilename, double latitude, double longtitude) {
		this.num = num;
		this.subject = subject;
		this.addr = addr;
		this.other = other;
		this.imageFilename = imageFilename;
		this.latitude = latitude;
		this.longtitude = longtitude;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(double longtitude) {
		this.longtitude = longtitude;
	}
	
}
