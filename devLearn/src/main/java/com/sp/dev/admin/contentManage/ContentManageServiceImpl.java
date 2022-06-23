package com.sp.dev.admin.contentManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("admin.contentManage.contentManageService")
public class ContentManageServiceImpl implements ContentManageService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<ContentManage> listContent(Map<String, Object> map) {
		List<ContentManage> list = null;
		try {
			list = dao.selectList("contentManage.listLecture",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateContentState(int lectureNum) throws Exception {
		try {
			dao.updateData("contentManage.updateLectureState", lectureNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public ContentManage readLecture(int lectureNum) {
		ContentManage dto = null;
		
		try {
			dto = dao.selectOne("contentManage.readLecture", lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int countLecture(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("contentManage.countLecture", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

}
