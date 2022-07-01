package com.sp.dev.mypage.myLecture;

public class MyLecture {
	private String thumbnail;
	private String lectureSubject;
	private String memberNickname;   // 강사 닉네임
	private String lectureEdate;
	private int lectureNum;

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
	public String getLectureEdate() {
		return lectureEdate;
	}
	public void setLectureEdate(String lectureEdate) {
		this.lectureEdate = lectureEdate;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	
	
}
