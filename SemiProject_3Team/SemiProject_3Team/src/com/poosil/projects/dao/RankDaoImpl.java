package com.poosil.projects.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.poosil.projects.dto.ProjectDto;
import com.poosil.util.db.SqlMapConfig;

public class RankDaoImpl extends SqlMapConfig implements RankDao{

	@Override
	public List<ProjectDto> selectTopLike() {
		SqlSession session = null;
		
		List<ProjectDto> list = new ArrayList<ProjectDto>();
		try {
			session = getSqlSessionFactory().openSession(true);
			
			list = session.selectList("rank-mapper.selectTopLike");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return list;
		
	}

	@Override
	public List<ProjectDto> selectTopPrice() {
		SqlSession session = null;
		
		List<ProjectDto> list = new ArrayList<ProjectDto>();
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList("rank-mapper.selectTopPrice");
			System.out.println(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return list;
	}

	@Override
	public List<Integer> selectTopCategoryCount() {
		SqlSession session = null;
		
		List<Integer> intList = new ArrayList<Integer>();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			intList = session.selectList("rank-mapper.selectTopCategoryCount");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return intList;
	}

	@Override
	public List<String> selectTopCategoryName() {
		SqlSession session = null;
		
		List<String> stringList = new ArrayList<String>();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			stringList = session.selectList("rank-mapper.selectTopCategoryCategory");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return stringList;
	}

}
