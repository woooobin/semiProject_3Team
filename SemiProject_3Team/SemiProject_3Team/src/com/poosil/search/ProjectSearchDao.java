package com.poosil.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.poosil.projects.dto.HashtagDto;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.util.db.SqlMapConfig;


public class ProjectSearchDao extends SqlMapConfig {
	
	private String namespace = "search-mapper.";
	   
	   // 게시글 리스트
	   public List<ProjectDto> searchList(String searchOption, String keyword) {
	      SqlSession session = null;
	      List<ProjectDto> list = null;
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("searchOption", searchOption);
	      map.put("keyword", keyword);
	      try {
	         session = getSqlSessionFactory().openSession(true);
	         list = session.selectList(namespace+"searchList", map);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } 
	      
	      session.close();
	      
	      return list;
	      
	   }
	
	// 해시태그 검색
	public List<HashtagDto> hashtagList(String hashtag) {
		SqlSession session = null;
		List<HashtagDto> list = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hashtag", hashtag);

		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace+"hashtagList", map);
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
			if (res > 0) {
				session.commit();
			}
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
