package com.poosil.projects.biz;

import java.util.List;
import java.util.Map;

import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;

public interface ProjectsBiz {
	public List<ProjectDto> selectList();
	
	public Map<String, Integer>  insertProject(
			String userId, 
			String projectMainTitle,
			String projectSubTitle, 
			String thumbImage, 
			String goalPrice, 
			String projectCategory,
			String projectStartDate,
			String projectEndDate,
			String shippingStartDate,
			String detailDesc
		);
	public int insertProjectItems(List<ProjectItemDto> list);
}
