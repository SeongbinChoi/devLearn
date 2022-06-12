package com.sp.dev.admin.memberManage;


public class MemberManage {
	private String eMail;
	private String name;
	private int mRole;
	private String reg_date;
	private String lastLogin;
	private String infoUpdate;
	private String phoneNum;
	private String bMail;
	private int enabled;
	private int emailCheck;
	
	private int pwdFail;
	private int stateCode;
	private String stateDate;
	private String adminId;
	private String memo;
	
	private int notifyNum;
	private int qnaNum;
	private String notifyReason;
	private String notifyState;
	
	
	
	public int getPwdFail() {
		return pwdFail;
	}
	public void setPwdFail(int pwdFail) {
		this.pwdFail = pwdFail;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getmRole() {
		return mRole;
	}
	public void setmRole(int mRole) {
		this.mRole = mRole;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getbMail() {
		return bMail;
	}
	public void setbMail(String bMail) {
		this.bMail = bMail;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public int getEmailCheck() {
		return emailCheck;
	}
	public void setEmailCheck(int emailCheck) {
		this.emailCheck = emailCheck;
	}
	public int getStateCode() {
		return stateCode;
	}
	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String getInfoUpdate() {
		return infoUpdate;
	}
	public void setInfoUpdate(String infoUpdate) {
		this.infoUpdate = infoUpdate;
	}
	public String getStateDate() {
		return stateDate;
	}
	public void setStateDate(String stateDate) {
		this.stateDate = stateDate;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public int getNotifyNum() {
		return notifyNum;
	}
	public void setNotifyNum(int notifyNum) {
		this.notifyNum = notifyNum;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getNotifyReason() {
		return notifyReason;
	}
	public void setNotifyReason(String notifyReason) {
		this.notifyReason = notifyReason;
	}
	public String getNotifyState() {
		return notifyState;
	}
	public void setNotifyState(String notifyState) {
		this.notifyState = notifyState;
	}
}
