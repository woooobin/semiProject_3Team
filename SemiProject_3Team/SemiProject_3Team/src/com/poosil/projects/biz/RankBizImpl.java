package com.poosil.projects.biz;

import java.util.List;

import com.poosil.projects.dao.RankDao;
import com.poosil.projects.dao.RankDaoImpl;
import com.poosil.projects.dto.ProjectDto;

public class RankBizImpl implements RankBiz{

	RankDao dao = new RankDaoImpl();
	@Override
	public List<ProjectDto> selectTopLike() {
		return dao.selectTopLike();
	}

	@Override
	public List<ProjectDto> selectTopPrice() {
		return dao.selectTopPrice();
	}

	@Override
	public List<Integer> selectTopCategoryCount() {
		return dao.selectTopCategoryCount();
	}

	@Override
	public List<String> selectTopCategoryName() {
		// TODO Auto-generated method stub
		return dao.selectTopCategoryName();
	}

}
