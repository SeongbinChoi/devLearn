package com.sp.dev.lecturenews;

import java.util.List;
import java.util.Map;

public interface LecNewsService {
	public void insertLecNews(LecNews dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<LecNews> listNews(Map<String, Object> map);
	public LecNews readNews(int num);
	
	public void updateLecNews(LecNews dto, String pathname) throws Exception;
	public void deleteLecNews(int num, String pathname) throws Exception;
	
	public void insertFile(LecNews dto) throws Exception;
	public List<LecNews> listFile(int newsNum);
	public LecNews readFile(int newsFileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
}
