package com.sp.dev.admin.noticeManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("admin.noticeManage.noticeService")
public class NoticeManageServiceImpl implements NoticeManageService {
	@Autowired
	private CommonDAO dao;
	@Override
	public void insertNotice(Notice dto) throws Exception {
		try {
			dao.insertData("noticeManage.insertNotice", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("noticeManage.listNotice", map);
		} catch (Exception e) {
			 e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int countNotice(Map<String, Object> map) {

		return 0;
	}

	@Override
	public Notice readNotice(int noticeNum) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("noticeManage.readNotice", noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateNotice(Notice dto) throws Exception {
	}

	@Override
	public void deleteNotice(int noticeNum) {
	}

	@Override
	public List<Notice> listSubject() {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("noticeManage.listSubject");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	

}
