package com.poosil.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.poosil.util.db.SqlMapConfig;


public class ProjectSearchDao extends SqlMapConfig {
	
	private String namespace = "search-mapper.";
	
	// 게시글 리스트
	public List<ProjectSearchDto> selectList(int start, int end, String searchOption, String keyword) {
		SqlSession session = null;
		List<ProjectSearchDto> list = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		session.close();
		
		return list;
		
	}
	
	// 게시글 수
	public int listCount(String searchOption, String keyword) {
		SqlSession session = null;
		int res = 0;
		
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace+"listCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		session.close();
		
		return res;
	}
	
	// 조회수
	public int viewCount(int seq) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "viewcount", seq);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		session.close();
		
		return res;
	}

}
