package com.sp.dev.mypage.profile;

import java.util.Map;

public interface ProfileService {
	public void insertProfile(Profile dto, String path) throws Exception;
	public void updateProfile(Profile dto, String path) throws Exception;
	
	public Profile readProfile(Map<String, Object> map);
	
}
