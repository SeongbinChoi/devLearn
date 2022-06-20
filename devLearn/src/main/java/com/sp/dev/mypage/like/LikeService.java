package com.sp.dev.mypage.like;

import java.util.List;
import java.util.Map;

public interface LikeService {
	public int likeDataCount(Map<String, Object> map);
	public List<Like> likeList(Map<String, Object> map);
}
