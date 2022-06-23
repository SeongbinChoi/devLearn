package com.sp.dev.instrutorPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.FileManager;
import com.sp.dev.common.dao.CommonDAO;

@Service("instructorPage.instructorPageService")
public class InstructorPageServiceImpl implements InstructorPageService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	

	@Override
	public Lectures readLecture(int lectureNum) {
		Lectures dto = null;
		
		try {
			dto = dao.selectOne("instructorPage.readLecture", lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return dto;
	}

	@Override
	public void insertLecture(Lectures dto, String pathname) throws Exception {
		try {
			
			if(! dto.getSelectFile().isEmpty()) {
				String thumbNail = fileManager.doFileUpload(dto.getSelectFile(), pathname);
				dto.setthumbNail(thumbNail);
			}
			
			dao.insertData("instructorPage.insertLecture", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void updateLecture(Lectures dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Lectures> listCategory() {
		List<Lectures> list = null;
		
		try {
			// 대분류
			list = dao.selectList("instructorPage.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Lectures> listSubCategory(String categoryCode) {
		List<Lectures> list = null;
		
		try {
			// 대분류에 대한 중분류
			list = dao.selectList("instructorPage.listSubCategory", categoryCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
