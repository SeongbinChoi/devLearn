package com.sp.dev.lecturenews;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class LecNews {
	private String categoryCode;
	private String lectureSubject;
	private String lectureContent;
	private int lecturePrice;
	private int dcPercent;
	private String memberNickname;
	
	private int newsNum;
	private int lectureNum;
	private String memberEmail;
	private String nickName;
	
	private String subject;
	private String regDate;
	private String content;
	
	private int newsFileNum;
	private String originalFilename;
	private String saveFilename;
	private int fileCount;
	
	private List<MultipartFile> selectFile; // <input type="file" name="selectFile"
	private long gap;
	
	
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
	public int getNewsNum() {
		return newsNum;
	}
	public void setNewsNum(int newsNum) {
		this.newsNum = newsNum;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNewsFileNum() {
		return newsFileNum;
	}
	public void setNewsFileNum(int newsFileNum) {
		this.newsFileNum = newsFileNum;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public int getFileCount() {
		return fileCount;
	}
	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public long getGap() {
		return gap;
	}
	public void setGap(long gap) {
		this.gap = gap;
	}
}
