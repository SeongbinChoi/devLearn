package com.sp.dev.mypage.profile;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.FileManager;
import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.profile.profileService")
public class ProfileServiceImpl implements ProfileService {
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertProfile(Profile dto, String path) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), path);
			if (saveFilename != null) {
				dto.setSaveFileName(saveFilename);
				dao.insertData("my.insertProfile", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateProfile(Profile dto, String path) throws Exception {
		try {
			// 업로드한 파일이 존재한 경우
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), path);
			System.out.println(saveFilename);

			if (saveFilename != null) {
				// 이전 파일 지우기
				if (dto.getSaveFileName().length() != 0) {
					fileManager.doFileDelete(dto.getSaveFileName(), path);
				}

				dto.setSaveFileName(saveFilename);
			}
			System.out.println("ddd");
			dao.updateData("my.updateProfile", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Profile readProfile(Map<String, Object> map) {
		Profile dto = null;
		
		try {
			dto = dao.selectOne("my.readProfile", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateNickname(Profile dto) throws Exception {
		try {
			dao.updateData("my.updateNickname", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
