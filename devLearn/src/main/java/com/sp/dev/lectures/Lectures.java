package com.sp.dev.lectures;

public class Lectures {
	private int lectureNum;
	private int categoryCode;
	private String lectureSubject;
	private String lectureContent;
	private int price;
	private int dcPercent;
	
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
	private String inquirySubject;
	private String inquiryQuestion;
	private String inquiry;
	private String inquiryRegDate;
	private String answerRegDate;
	
	private int qnaNum;
	private String qnaSubject;
	private String qnaContent;
	private String qnaRegDate;
	
	private int qnaAnswerNum;
	private String qnaAnswerContent;
	private String qnaAnswerRegDate;
	
	private int videoNum;
	private String Thumbnail;
	private double FileTotalTime;
	private String videoTitle;
	private int chapter;
	private String videoFileName;
	
	private int pauseSaveNum;
	// 수강 상세 번호
	private int detailNum;
	private double lectureSave;
	private int sugangFinish;
	
	private int reviewNum;
	private String reviewContent;
	private String reviewRegDate;
	private double lectureRate;
	private String reiewAnswer;
	
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public int getcategoryCode() {
		return categoryCode;
	}
	public void setcategoryCode(int categoryCode) {
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDcPercent() {
		return dcPercent;
	}
	public void setDcPercent(int dcPercent) {
		this.dcPercent = dcPercent;
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
	public String getInquirySubject() {
		return inquirySubject;
	}
	public void setInquirySubject(String inquirySubject) {
		this.inquirySubject = inquirySubject;
	}
	public String getInquiryQuestion() {
		return inquiryQuestion;
	}
	public void setInquiryQuestion(String inquiryQuestion) {
		this.inquiryQuestion = inquiryQuestion;
	}
	public String getInquiry() {
		return inquiry;
	}
	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}
	public String getInquiryRegDate() {
		return inquiryRegDate;
	}
	public void setInquiryRegDate(String inquiryRegDate) {
		this.inquiryRegDate = inquiryRegDate;
	}
	public String getAnswerRegDate() {
		return answerRegDate;
	}
	public void setAnswerRegDate(String answerRegDate) {
		this.answerRegDate = answerRegDate;
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
	public int getVideoNum() {
		return videoNum;
	}
	public void setVideoNum(int videoNum) {
		this.videoNum = videoNum;
	}
	public String getThumbnail() {
		return Thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		Thumbnail = thumbnail;
	}
	public double getFileTotalTime() {
		return FileTotalTime;
	}
	public void setFileTotalTime(double fileTotalTime) {
		FileTotalTime = fileTotalTime;
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
	public String getReiewAnswer() {
		return reiewAnswer;
	}
	public void setReiewAnswer(String reiewAnswer) {
		this.reiewAnswer = reiewAnswer;
	}
	
}
