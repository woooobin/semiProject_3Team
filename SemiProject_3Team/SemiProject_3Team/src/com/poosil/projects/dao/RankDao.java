package com.poosil.projects.dao;

import java.util.List;

import com.poosil.projects.dto.ProjectDto;

public interface RankDao {
	public List<ProjectDto> selectTopLike();
	public List<ProjectDto> selectTopPrice();
	public List<Integer> selectTopCategoryCount();
	public List<String> selectTopCategoryName();
}
