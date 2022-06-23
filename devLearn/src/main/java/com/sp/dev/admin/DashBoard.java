package com.sp.dev.admin;

import java.util.List;

public class DashBoard {
	private int todayTotalVisitor;
	private int simulVisitor;
	private int yesterdayTotalVisitor;
	private int yesterdaySimulVisitor;
	private int monthNewMember;
	private int monthnewLecture;
	private int lastMonthNewMember;
	private int lastMonthnewLecture;
	private int waitingLecture;
	private int waitingQnA;
	
	private List<Integer> totalSales;
	private List<Integer> lectureSales;
	private List<Integer> mentorSales;
	 
	
	public int getTodayTotalVisitor() {
		return todayTotalVisitor;
	}
	public void setTodayTotalVisitor(int todayTotalVisitor) {
		this.todayTotalVisitor = todayTotalVisitor;
	}
	public int getSimulVisitor() {
		return simulVisitor;
	}
	public void setSimulVisitor(int simulVisitor) {
		this.simulVisitor = simulVisitor;
	}
	public int getYesterdayTotalVisitor() {
		return yesterdayTotalVisitor;
	}
	public void setYesterdayTotalVisitor(int yesterdayTotalVisitor) {
		this.yesterdayTotalVisitor = yesterdayTotalVisitor;
	}
	public int getYesterdaySimulVisitor() {
		return yesterdaySimulVisitor;
	}
	public void setYesterdaySimulVisitor(int yesterdaySimulVisitor) {
		this.yesterdaySimulVisitor = yesterdaySimulVisitor;
	}
	public int getMonthNewMember() {
		return monthNewMember;
	}
	public void setMonthNewMember(int monthNewMember) {
		this.monthNewMember = monthNewMember;
	}
	public int getMonthnewLecture() {
		return monthnewLecture;
	}
	public void setMonthnewLecture(int monthnewLecture) {
		this.monthnewLecture = monthnewLecture;
	}
	public int getLastMonthNewMember() {
		return lastMonthNewMember;
	}
	public void setLastMonthNewMember(int lastMonthNewMember) {
		this.lastMonthNewMember = lastMonthNewMember;
	}
	public int getLastMonthnewLecture() {
		return lastMonthnewLecture;
	}
	public void setLastMonthnewLecture(int lastMonthnewLecture) {
		this.lastMonthnewLecture = lastMonthnewLecture;
	}
	public int getWaitingLecture() {
		return waitingLecture;
	}
	public void setWaitingLecture(int waitingLecture) {
		this.waitingLecture = waitingLecture;
	}
	public int getWaitingQnA() {
		return waitingQnA;
	}
	public void setWaitingQnA(int waitingQnA) {
		this.waitingQnA = waitingQnA;
	}
	public List<Integer> getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(List<Integer> totalSales) {
		this.totalSales = totalSales;
	}
	public List<Integer> getLectureSales() {
		return lectureSales;
	}
	public void setLectureSales(List<Integer> lectureSales) {
		this.lectureSales = lectureSales;
	}
	public List<Integer> getMentorSales() {
		return mentorSales;
	}
	public void setMentorSales(List<Integer> mentorSales) {
		this.mentorSales = mentorSales;
	}
}
