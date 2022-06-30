package com.sp.dev.instrutorPage;

import java.util.List;
import java.util.Map;

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
	public Lectures insertLecture(Lectures dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("instructorPage.seq");
			
			dto.setLectureNum(seq);
			
			if(! dto.getSelectFile().isEmpty()) {
				String thumbNail = fileManager.doFileUpload(dto.getSelectFile(), pathname);
				dto.setThumbNail(thumbNail);
			}
			
			dao.insertData("instructorPage.insertLecture", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return dto;

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

	@Override
	public int insertVideo(Lectures dto, String pathname) throws Exception {
		int videoNum = 0;
		
		try {
			if(! dto.getVideoSelectFile().isEmpty()) {
				int seq = dao.selectOne("instructorPage.videoSeq");
				dto.setVideoNum(seq);
				String videoFileName = fileManager.doFileUpload(dto.getVideoSelectFile(), pathname);
				dto.setVideoFileName(videoFileName);
				
				dao.insertData("instructorPage.insertVideo", dto);
				videoNum = seq;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return videoNum;
	}
	
	@Override
	public Lectures readVideo(int videoNum) {
		Lectures dto = null;
		
		try {
			dto = dao.selectOne("instructorPage.readVideo", videoNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteVideo(int videoNum, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			
			dao.deleteData("instructorPage.deleteVideo", videoNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int countLecture(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("instructorPage.countLecture", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Lectures> listLecture(Map<String, Object> map) {
		List<Lectures> list = null;
		try {
			list = dao.selectList("instructorPage.listLecture",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int countInquiry(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("instructorPage.countInquiry", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Lectures> listInquiry(Map<String, Object> map) {
		List<Lectures> list = null;
		try {
			list = dao.selectList("instructorPage.listInquiry", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteLecture(int lectureNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLectureVideo(int lectureNum, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			
			dao.deleteData("instructorPage.deleteLectureVideo", lectureNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
