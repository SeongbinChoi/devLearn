package com.sp.dev.mypage.myWrite;

import java.util.List;
import java.util.Map;

public interface MyWriteService {
	public int qnaDataCount(Map<String, Object> map);
	public List<MyWrite> qnaList(Map<String, Object> map);
}
