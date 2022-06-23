package com.sp.dev.mentorPage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;
import com.sp.dev.mentors.Mentors;

@Service("mentorPage.mentorPageService")
public class MentorPageServiceImpl implements MentorPageService {
	@Autowired
	CommonDAO dao;
	
	@Override
	public Mentors readMentoring(String memberEmail) {
		Mentors dto = null;
		
		try {
			dto = dao.selectOne("mentorPage.readMentoring", memberEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public void insertMentoring(Mentors dto) throws Exception {
		
		try {
			dao.updateData("mentorPage.insertMentoring", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMentoring(Mentors dto) throws Exception {
		try {
			dao.updateData("mentorPage.updateMentoring", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public List<Mentors> listCategory() {
		List<Mentors> list = null;
		
		try {
			list = dao.selectList("mentors.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Mentors> listMentoringApply(Map<String, Object> map) {
		List<Mentors> list = null;
		
		try {
			list = dao.selectList("mentorPage.listMentoringApply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return list;
	}

	@Override
	public Mentors readMentoringApply(int mentoringNum) {
		Mentors dto = null;
		try {
			dto = dao.selectOne("mentorPage.readMentoringApply", mentoringNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateMentoringApply(Map<String, Object> map) throws Exception {
	
		try {
			dao.updateData("mentorPage.updateMentoringApply", map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Mentors> listMentoringPlan(Map<String, Object> map) {
		List<Mentors> list = null;
		try {
			list = dao.selectList("mentorPage.listMentoringPlan", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Mentors> listMentoring(Map<String, Object> map) {
		List<Mentors> list = null;
		
		try {
			list = dao.selectList("mentorPage.listMentoring", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Mentors listMentoringDetail(int mentoringNum) {
		Mentors dto = null;
		
		try {
			dto = dao.selectOne("mentorPage.listMentoringDetail", mentoringNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Object> mentoringRevenueList(Map<String, Object> param) {
		List<Object> list = new ArrayList<Object>();
		try {
			list = dao.selectList("mentorPage.mentoringRevenueList", param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Object> mentoringYearList(String memberEmail) {
		List<Object> list = new ArrayList<Object>();
		try {
			list = dao.selectList("mentorPage.mentoringYearList", memberEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mentors> mentoringDetailList(Map<String, Object> map) {
		List<Mentors> list = new ArrayList<Mentors>();
		
		try {
			list = dao.selectList("mentorPage.mentoringDetailList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int allRevenueCount(String memberEmail) {
		int result = 0;
		try {
			result = dao.selectOne("mentorPage.allRevenueCount", memberEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int monthRevenueCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("mentorPage.monthRevenueCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Map<String, Object> dashbardDataList(String memberEmail) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.selectOne("mentorPage.dashbardDataList", memberEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
