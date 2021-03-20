package com.poosil.projects.biz;

import java.util.List;

import com.poosil.projects.dao.ProjectDao;
import com.poosil.projects.dao.ProjectDaoImpl;
import com.poosil.projects.dto.ProjectDto;

public class ProjectsBizImpl implements ProjectsBiz{

	ProjectDao dao = new ProjectDaoImpl();
	@Override
	public List<ProjectDto> selectList() {
		return dao.selectList();
	}

}
