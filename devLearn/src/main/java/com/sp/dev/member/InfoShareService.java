package com.sp.dev.member;

public interface InfoShareService {
	public String readProfile(String eMail);
	public InfoShare readKnowledgeApply(String eMail);
	public int countKnowledgeApply(String eMail);
	public void insertProfile(InfoShare dto) throws Exception;
	public void updateProfile(InfoShare dto) throws Exception;
}
