package com.poosil.projects.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.poosil.projects.dto.ProjectDto;
import com.poosil.util.db.SqlMapConfig;


public class ProjectDaoImpl extends SqlMapConfig implements ProjectDao{
	public List<ProjectDto> selectList() {

		SqlSession session = null;

		List<ProjectDto> list = new ArrayList<ProjectDto>();

		try {
			session = getSqlSessionFactory().openSession(true);

			list = session.selectList("projects-mapper.selectList");
			System.out.println("hreer" + list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return list;
	}
}
