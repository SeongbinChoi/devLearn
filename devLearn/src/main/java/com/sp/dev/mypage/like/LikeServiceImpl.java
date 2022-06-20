package com.sp.dev.mypage.like;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.dev.common.dao.CommonDAO;

@Service("mypage.like.likeServiceImpl")
public class LikeServiceImpl implements LikeService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int likeDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("my.likeDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Like> likeList(Map<String, Object> map) {
		List<Like> list = null;
		
		try {
			list = dao.selectList("my.likeList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
