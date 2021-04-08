package com.poosil.projects.biz;

import java.util.List;
import java.util.Map;

import com.poosil.projects.dto.HashtagDto;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;


public interface ProjectsBiz {
	public List<ProjectDto> selectList(String province, String sortOpt);
	
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
			String detailDesc,
			String address,
			String latitude,
			String longitude,
			String province
		);
	public int insertProjectItems(List<ProjectItemDto> list);
	public ProjectDto selectOne(int projectId);
	
	
	public int insertHashtags (List<String> hashtags, int projectId);
	
	public List<ProjectItemDto> selectProjectItems (int projectId);
	public List<HashtagDto> selectProjectHashtags(int projectId);
	public List<ProjectDto> selectProjectsWithHashtag(int hashtagseq);
	
	public boolean isLiked(int projectId, String userId);
	public int projectLike(int projectId, String userId, String isLiked);
	
	public List<ProjectDto> selectListByLikecount();
	public List<ProjectDto> selectListByCreatedAt();
}
