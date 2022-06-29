package com.sp.dev.instrutorPage;

import org.springframework.web.multipart.MultipartFile;

public class Lectures {
	private String memberEmail;
	private int lectureNum;
	private String categoryCode;
	private String lectureSubject;
	private String lectureContent;
	private int lecturePrice;
	private int dcPercent;
	private String memberNickname;
	private String lectureDuration;
	private String lectureRegDate;
	private String thumbNail;
	private int state;
	
	private int videoNum;
	private double fileTotalTime;
	private String videoTitle;
	private int chapter;
	private String videoFileName;
	
	private MultipartFile selectFile;
	private MultipartFile videoSelectFile;
	
	private String mainCategory;
	private String categoryName;
	
	private int newsNum;
	private String newsSubject;
	private String newsContent;
	private String newsRegDate;
	
	private int newsSaveFileNum;
	private String newsSaveFileName[];
	private String newsOriginalFileName[];
	
	private int inquiryNum;
	private String qMember;
	private String question;
	private String q_regDtae;
	private String amember;
	private String answer;
	private String a_regDate;
	
	private int qnaNum;
	private String qnaSubject;
	private String qnaContent;
	private String qnaRegDate;
	
	private int qnaAnswerNum;
	private String qnaAnswerContent;
	private String qnaAnswerRegDate;
	
	private int pauseSaveNum;
	// 수강 상세 번호
	private int detailNum;
	private double lectureSave;
	private int sugangFinish;
	
	private int reviewNum;
	private String reviewContent;
	private String reviewRegDate;
	private double lectureRate;
	private String reviewAnswer;
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
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
	public String getLectureDuration() {
		return lectureDuration;
	}
	public void setLectureDuration(String lectureDuration) {
		this.lectureDuration = lectureDuration;
	}
	public String getLectureRegDate() {
		return lectureRegDate;
	}
	public void setLectureRegDate(String lectureRegDate) {
		this.lectureRegDate = lectureRegDate;
	}
	public String getThumbNail() {
		return thumbNail;
	}
	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}
	public int getVideoNum() {
		return videoNum;
	}
	public void setVideoNum(int videoNum) {
		this.videoNum = videoNum;
	}
	public double getFileTotalTime() {
		return fileTotalTime;
	}
	public void setFileTotalTime(double fileTotalTime) {
		this.fileTotalTime = fileTotalTime;
	}
	public String getVideoTitle() {
		return videoTitle;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	public int getChapter() {
		return chapter;
	}
	public void setChapter(int chapter) {
		this.chapter = chapter;
	}
	public String getVideoFileName() {
		return videoFileName;
	}
	public void setVideoFileName(String videoFileName) {
		this.videoFileName = videoFileName;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public MultipartFile getVideoSelectFile() {
		return videoSelectFile;
	}
	public void setVideoSelectFile(MultipartFile videoSelectFile) {
		this.videoSelectFile = videoSelectFile;
	}
	public String getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getNewsNum() {
		return newsNum;
	}
	public void setNewsNum(int newsNum) {
		this.newsNum = newsNum;
	}
	public String getNewsSubject() {
		return newsSubject;
	}
	public void setNewsSubject(String newsSubject) {
		this.newsSubject = newsSubject;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getNewsRegDate() {
		return newsRegDate;
	}
	public void setNewsRegDate(String newsRegDate) {
		this.newsRegDate = newsRegDate;
	}
	public int getNewsSaveFileNum() {
		return newsSaveFileNum;
	}
	public void setNewsSaveFileNum(int newsSaveFileNum) {
		this.newsSaveFileNum = newsSaveFileNum;
	}
	public String[] getNewsSaveFileName() {
		return newsSaveFileName;
	}
	public void setNewsSaveFileName(String[] newsSaveFileName) {
		this.newsSaveFileName = newsSaveFileName;
	}
	public String[] getNewsOriginalFileName() {
		return newsOriginalFileName;
	}
	public void setNewsOriginalFileName(String[] newsOriginalFileName) {
		this.newsOriginalFileName = newsOriginalFileName;
	}
	public int getInquiryNum() {
		return inquiryNum;
	}
	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}
	public String getqMember() {
		return qMember;
	}
	public void setqMember(String qMember) {
		this.qMember = qMember;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQ_regDtae() {
		return q_regDtae;
	}
	public void setQ_regDtae(String q_regDtae) {
		this.q_regDtae = q_regDtae;
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
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getQnaSubject() {
		return qnaSubject;
	}
	public void setQnaSubject(String qnaSubject) {
		this.qnaSubject = qnaSubject;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaRegDate() {
		return qnaRegDate;
	}
	public void setQnaRegDate(String qnaRegDate) {
		this.qnaRegDate = qnaRegDate;
	}
	public int getQnaAnswerNum() {
		return qnaAnswerNum;
	}
	public void setQnaAnswerNum(int qnaAnswerNum) {
		this.qnaAnswerNum = qnaAnswerNum;
	}
	public String getQnaAnswerContent() {
		return qnaAnswerContent;
	}
	public void setQnaAnswerContent(String qnaAnswerContent) {
		this.qnaAnswerContent = qnaAnswerContent;
	}
	public String getQnaAnswerRegDate() {
		return qnaAnswerRegDate;
	}
	public void setQnaAnswerRegDate(String qnaAnswerRegDate) {
		this.qnaAnswerRegDate = qnaAnswerRegDate;
	}
	public int getPauseSaveNum() {
		return pauseSaveNum;
	}
	public void setPauseSaveNum(int pauseSaveNum) {
		this.pauseSaveNum = pauseSaveNum;
	}
	public int getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(int detailNum) {
		this.detailNum = detailNum;
	}
	public double getLectureSave() {
		return lectureSave;
	}
	public void setLectureSave(double lectureSave) {
		this.lectureSave = lectureSave;
	}
	public int getSugangFinish() {
		return sugangFinish;
	}
	public void setSugangFinish(int sugangFinish) {
		this.sugangFinish = sugangFinish;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewRegDate() {
		return reviewRegDate;
	}
	public void setReviewRegDate(String reviewRegDate) {
		this.reviewRegDate = reviewRegDate;
	}
	public double getLectureRate() {
		return lectureRate;
	}
	public void setLectureRate(double lectureRate) {
		this.lectureRate = lectureRate;
	}
	public String getReviewAnswer() {
		return reviewAnswer;
	}
	public void setReviewAnswer(String reviewAnswer) {
		this.reviewAnswer = reviewAnswer;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	



}
