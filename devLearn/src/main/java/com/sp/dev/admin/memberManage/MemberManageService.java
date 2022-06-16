package com.sp.dev.admin.memberManage;

import java.util.List;
import java.util.Map;



public interface MemberManageService {
	public int dataCount(Map<String, Object> map);
	public List<MemberManage> listMember(Map<String, Object> map);
	public MemberManage readMember(String eMail);
	
	public void updateFailureCountReset(String eMail) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(MemberManage dto) throws Exception;
	
	public List<MemberManage> listMemberState(String eMail);
	public MemberManage readMemberState(String eMail);
	public void updateMemberEnabled(Map<String, Object> map, MemberManage dto) throws Exception;
	public void updateMemberRole(Map<String, Object> map) throws Exception;
	
	public List<MemberManage> listApplyMember(Map<String, Object> map);
	public int countApplyMember(Map<String, Object> map);
	public ApplyManage readApplyDetail(String eMail);
	public void updateApplyStatus(String eMail) throws Exception;
	
	
	public List<NotifyManage> listNotifiedMember(Map<String, Object> map);
	public int countNotified(Map<String, Object> map);
	public NotifyManage readNotifiedDetail(int notifyNum);
	public void updateNotifiedState(int notifyNum) throws Exception;
	
}
