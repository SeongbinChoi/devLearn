package com.sp.dev.admin.memberManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("admin.memberManage.memberManageService")
public class MemberManageServiceImpl implements MemberManageService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("memberManage.countMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<MemberManage> listMember(Map<String, Object> map) {
		List<MemberManage> list = null;
		
		try {
			list = dao.selectList("memberManage.listMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MemberManage readMember(String eMail) {
		MemberManage dto = null;
		
		try {
			dto = dao.selectOne("memberManage.readMember", eMail);
			
			if (dto != null) {
				if(dto.getPhoneNum() != null) {
					
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateFailureCountReset(String eMail) throws Exception {
		
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("memberManage.updateMemberEnable", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void updateMemberEnabled(Map<String, Object> map, MemberManage dto) throws Exception {
		try {
			dao.updateData("memberManage.updateMemberEnable", map);
			dao.insertData("memberManage.insertMemberState", dto); //memberState 에 로그 찍기

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	@Override
	public void insertMemberState(MemberManage dto) throws Exception {
		try {
			dao.insertData("memberManage.insertMemberState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	
	@Override
	public List<MemberManage> listMemberState(String eMail) {
		List<MemberManage> list = null;
		
		try {
			list = dao.selectList("memberManage.listMemberState", eMail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MemberManage readMemberState(String eMail) {
		MemberManage dto = null;
		
		try {
			dto = dao.selectOne("memberManage.readMemberState", eMail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateMemberRole(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("memberManage.updateMemberRole",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
