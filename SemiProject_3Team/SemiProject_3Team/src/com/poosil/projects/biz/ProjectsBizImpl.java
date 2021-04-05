package com.poosil.projects.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.poosil.projects.dao.ProjectDao;
import com.poosil.projects.dao.ProjectDaoImpl;
import com.poosil.projects.dto.HashtagDto;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;

public class ProjectsBizImpl implements ProjectsBiz{

	ProjectDao dao = new ProjectDaoImpl();
	@Override
	public List<ProjectDto> selectList(String province, String sortOpt) {
		return dao.selectList(province, sortOpt);
	}
	@Override
	public Map<String, Integer>  insertProject(String userId, String projectMainTitle, String projectSubTitle, String thumbImage,
			String goalPrice, String projectCategory, String projectStartDate, String projectEndDate,
			String shippingStartDate, String detailDesc, String address,String latitude,String longitude,String province) {
		// TODO Auto-generated method stub
		return dao.insertProject(userId,projectMainTitle,projectSubTitle,thumbImage,goalPrice,projectCategory,projectStartDate,projectEndDate,shippingStartDate,detailDesc,address,latitude,longitude,province);
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

	// hashtag 넣느 로직 세우
	

	
	@Override
	public int insertHashtags(List<String> hashtags, int projectId) {
		// TODO Auto-generated method stub
		
		//Controller에서 날아온 해쉬태그들...
		List<String> existHashtags = dao.selectExistHashtags(hashtags);
		List<String> inputHashtags = new ArrayList<String>();
		
		System.out.println(" 유저로 부터 받아온 hashtag값  = " + hashtags);
		
		if(existHashtags.size() > 0) {
			for(String hashtag : hashtags) {
				
				if(!existHashtags.contains(hashtag)) {
					inputHashtags.add(hashtag);
				}
			}
		}else {
			inputHashtags = hashtags; 
		}
		
		List<HashtagDto> inputHashtagList = new ArrayList<HashtagDto> () ; 
		
		for(String str : inputHashtags ) {
			HashtagDto hashtag = new HashtagDto();
			hashtag.setHashtagSeq(0);
			hashtag.setHashtagName(str);
			inputHashtagList.add(hashtag);
		}
		
		int insertHashtagsRes = dao.insertHashtags(inputHashtagList);
		
		// =============== 해쉬태그테이블에 전체 삽입 완료 =============== //  
		
		int insertProjectHashtagRes = dao.insertProjectHashtags( hashtags, projectId );
		
		return insertProjectHashtagRes;
	}
	@Override
	public List<ProjectItemDto> selectProjectItems(int projectId) {
		return dao.selectProjectItems(projectId);
	}
	@Override
	public List<HashtagDto> selectProjectHashtags(int projectId) {
		return dao.selectProjectHashtag(projectId);
	}
	@Override
	public List<ProjectDto> selectProjectsWithHashtag(int hashtagseq) {
		// TODO Auto-generated method stub
		return dao.selectProjectsWithHashtag(hashtagseq);
	}
	
	
	// ================ 좋아요 ================//
	@Override
	public boolean isLiked(int projectId, String userId) {
		int result = dao.selectExistLike(projectId, userId);
		return result > 0 ;
	}
	@Override
	public int projectLike(int projectId, String userId, String isLiked) {
		int result = 0;
		int likeCountResult=0;
		if(isLiked.equals("false")) {
			result = dao.projectLike(projectId, userId);
			if(result>0) {
				likeCountResult = dao.projectAddLikeCount(projectId);
			}
		}else if(isLiked.equals("true")) {
			
			result = dao.projectUnlike(projectId, userId);
			if(result > 0) {
				likeCountResult = dao.projectRemoveLikeCount(projectId);
			}
		}
		
		return likeCountResult > 0 ? result : 0 ;
	}
	
	
	

}
