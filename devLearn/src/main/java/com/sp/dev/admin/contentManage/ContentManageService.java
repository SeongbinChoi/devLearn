package com.sp.dev.admin.contentManage;

import java.util.List;
import java.util.Map;

public interface ContentManageService {
	public List<ContentManage> listContent(Map<String, Object> map);
	public int countLecture(Map<String, Object> map);
	public ContentManage readLecture(int lectureNum);
	public void updateContentState(int lectureNum) throws Exception;
}
