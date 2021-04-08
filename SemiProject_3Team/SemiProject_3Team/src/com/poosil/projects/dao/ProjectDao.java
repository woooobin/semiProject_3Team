package com.poosil.projects.dao;

import java.util.List;
import java.util.Map;

import com.poosil.projects.dto.HashtagDto;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;

public interface ProjectDao {
	public List<ProjectDto> selectList(String province, String sortOpt);
	public Map<String, Integer> insertProject(
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
			String address,String latitude,String longitude,String province
		);
	public int insertProjectItems(List<ProjectItemDto> list);
	public ProjectDto selectOne(int projectId);
	
	public List<String> selectExistHashtags (List<String> hashtags);
	public int insertHashtags (List<HashtagDto> hashtags);
	
	public int insertProjectHashtags (List<String> hashtagList, int projectId) ;
	
	public List<ProjectItemDto> selectProjectItems (int projectId);

	public List<HashtagDto> selectProjectHashtag ( int projectId ) ;
	
	public List<ProjectDto> selectProjectsWithHashtag(int hashtagseq);
	
	public int selectExistLike(int projectId, String userId);
	
	
	public int projectLike(int projectId, String userId);
	public int projectUnlike(int projectId, String userId);
	public int projectAddLikeCount(int projectId);
	public int projectRemoveLikeCount(int projectId);
	public List<ProjectDto> selectListByLikecount();
	public List<ProjectDto> selectListByCreatedAt();
}
