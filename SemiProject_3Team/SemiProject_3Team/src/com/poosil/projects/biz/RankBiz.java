package com.poosil.projects.biz;

import java.util.List;

import com.poosil.projects.dto.ProjectDto;

public interface RankBiz {
	public List<ProjectDto> selectTopLike();
	public List<ProjectDto> selectTopPrice();
	public List<Integer> selectTopCategoryCount();
	public List<String> selectTopCategoryName();
}
