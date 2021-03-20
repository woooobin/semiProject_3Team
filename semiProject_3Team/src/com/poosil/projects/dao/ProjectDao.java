package com.poosil.projects.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.poosil.projects.dto.ProjectDto;




public interface ProjectDao {
	public List<ProjectDto> selectList();
}
