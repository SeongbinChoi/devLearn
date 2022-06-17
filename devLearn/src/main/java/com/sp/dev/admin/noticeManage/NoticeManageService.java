package com.sp.dev.admin.noticeManage;

import java.util.List;
import java.util.Map;

public interface NoticeManageService {
	public List<Notice> listNotice(Map<String, Object> map);
	public void insertNotice(Notice dto) throws Exception;
	public int countNotice(Map<String, Object> map);
	public Notice readNotice(int noticeNum);
	
	public List<Notice> listSubject();
	
	public void updateNotice(Notice dto) throws Exception;
	public void deleteNotice(int noticeNum);
	

}
