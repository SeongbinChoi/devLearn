package com.sp.dev.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("member.infoShareService")
public class InfoshareServiceImpl implements InfoShareService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public String readProfile(String eMail) {
		String mail = null;
		try {
			mail = dao.selectOne("infoShare.readProfile",eMail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mail;
	}

	@Override
	public void insertProfile(InfoShare dto) throws Exception {
		try {
			dao.insertData("infoShare.insertMemberProfile",dto);
			dao.insertData("infoShare.insertKnowledgeApply",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateProfile(InfoShare dto) throws Exception {
		try {
			dao.updateData("infoShare.updateMemberProfile", dto);
			dao.insertData("infoShare.insertKnowledgeApply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public InfoShare readKnowledgeApply(String eMail) {
		InfoShare dto = null;
		try {
			dto = dao.selectOne("infoShare.readKnowledgeApply",eMail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int countKnowledgeApply(String eMail) {
		int result = 0;
		try {
			result = dao.selectOne("infoShare.countKnowledgeApply", eMail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
