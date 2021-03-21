package com.poosil.projects.biz;

import java.util.List;
import java.util.Map;

import com.poosil.projects.dao.ProjectDao;
import com.poosil.projects.dao.ProjectDaoImpl;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;

public class ProjectsBizImpl implements ProjectsBiz{

	ProjectDao dao = new ProjectDaoImpl();
	@Override
	public List<ProjectDto> selectList() {
		return dao.selectList();
	}
	@Override
	public Map<String, Integer>  insertProject(String userId, String projectMainTitle, String projectSubTitle, String thumbImage,
			String goalPrice, String projectCategory, String projectStartDate, String projectEndDate,
			String shippingStartDate, String detailDesc) {
		// TODO Auto-generated method stub
		return dao.insertProject(userId,projectMainTitle,projectSubTitle,thumbImage,goalPrice,projectCategory,projectStartDate,projectEndDate,shippingStartDate,detailDesc);
	}
	@Override
	public int insertProjectItems(List<ProjectItemDto> list) {
		// TODO Auto-generated method stub
		return dao.insertProjectItems(list);
	}
	@Override
	public ProjectDto selectOne(int projectId) {
		// TODO Auto-generated method stub
		return dao.selectOne(projectId);
	}
	
	

}
