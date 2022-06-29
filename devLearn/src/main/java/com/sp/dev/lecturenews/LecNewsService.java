package com.sp.dev.lecturenews;

import java.util.List;
import java.util.Map;

public interface LecNewsService {
	public void insertLecNews(LecNews dto, String pathname) throws Exception;
	public List<LecNews> listLecNews(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public void updateLecNews(LecNews dto, String pathname) throws Exception;
	public void deleteLecNews(int newsNum, String pathname) throws Exception;
	
	public void insertFile(LecNews dto) throws Exception;
	public List<LecNews> listFile(int newsNum);
	public LecNews readFile(int newsFileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
}
