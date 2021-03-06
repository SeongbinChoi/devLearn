package com.sp.dev.community;

public class Study {
	private int studyNum;
	private String memberEmail;
	private String memberNickname;
	private int regionNum;
	private String region;
	private String subject;
	private String content;
	private int hitCount;
	private String regDate;
	private int status;
	private int limit;
	private int applied;
	private int replyCount;
	
	// 스터디모집현황은 따로 java로 뺴는게 좋아보임
	//private int applyNum;
	//private String applicationEmail;
	//private int applyStatus;
	
	
	public int getStudyNum() {
		return studyNum;
	}
	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getRegionNum() {
		return regionNum;
	}
	public void setRegionNum(int regionNum) {
		this.regionNum = regionNum;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
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
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getApplied() {
		return applied;
	}
	public void setApplied(int applied) {
		this.applied = applied;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
}
