package com.sp.dev.lecturenews;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.dev.common.FileManager;
import com.sp.dev.common.dao.CommonDAO;

@Service("lecturenews.lecNewsService")
public class LecNewsServiceImpl implements LecNewsService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertLecNews(LecNews dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("lectureNews.seq");
			dto.setNewsNum(seq);
			
			dao.insertData("lecturenews.insertLecNews", dto);
			
			// 파일
			if(! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					
					String originalFilename = mf.getOriginalFilename();
					// long fileSize = mf.getSize();
					
					dto.setOriginalFileName(originalFilename);
					dto.setSaveFileName(saveFilename);
					
					insertFile(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("lecturenews.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<LecNews> listNews(Map<String, Object> map) {
		List<LecNews> list = null;
		
		try {
			list = dao.selectList("lecturenews.listNews");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public LecNews readNews(int num) {
		LecNews dto = null;
		
		try {
			dto = dao.selectOne("lecturenews.readNews", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateLecNews(LecNews dto, String pathname) throws Exception {
		try {
			dao.updateData("lecturenews.updateLecNews", dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					
					String originalFilename = mf.getOriginalFilename();
					
					dto.setOriginalFileName(originalFilename);
					dto.setSaveFileName(saveFilename);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteLecNews(int num, String pathname) throws Exception {
		try {
			List<LecNews> listFile = listFile(num);
			if(listFile != null) {
				for(LecNews dto : listFile) {
					fileManager.doFileDelete(dto.getSaveFileName(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			
			dao.deleteData("lecturenews.deleteLecNews", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertFile(LecNews dto) throws Exception {
		try {
			dao.insertData("lecturenews.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<LecNews> listFile(int newsNum) {
		List<LecNews> listFile = null;
		
		try {
			listFile = dao.selectList("lecturenews.listFile", newsNum);
		} catch (Exception e) {
			e.printStackTrace();			
		}
		
		return listFile;
	}

	@Override
	public LecNews readFile(int newsFileNum) {
		LecNews dto = null;
		
		try {
			dto = dao.selectOne("lecturenews.readFile", newsFileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("lecturenews.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
