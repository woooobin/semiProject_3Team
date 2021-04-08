package com.poosil.projects.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.poosil.projects.dto.HashtagDto;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;
import com.poosil.util.db.SqlMapConfig;

public class ProjectDaoImpl extends SqlMapConfig implements ProjectDao {
	public List<ProjectDto> selectList(String province, String sortOpt) {

		SqlSession session = null;
		System.out.println("============================dao = ");
		System.out.println(sortOpt);
		System.out.println(province);
		

		List<ProjectDto> list = new ArrayList<ProjectDto>();
		Map<String, String> param = new HashMap<String, String>();
		param.put("sortOpt", sortOpt);
		param.put("province", province);
		try {
			session = getSqlSessionFactory().openSession(true);
			
			list = session.selectList("projects-mapper.selectList", param);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return list;
	}

	@Override
	public Map<String, Integer> insertProject(String userId, String projectMainTitle, String projectSubTitle,
			String thumbImage, String goalPrice, String projectCategory, String projectStartDate, String projectEndDate,
			String shippingStartDate, String detailDesc, String address, String latitude, String longitude,
			String province) {

		SqlSession session = null;
		Map<String, Integer> resultMap = new HashMap<String, Integer>();

		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("projectMainTitle", projectMainTitle);
		param.put("projectSubTitle", projectSubTitle);
		param.put("thumbImage", thumbImage);
		param.put("goalPrice", goalPrice);
		param.put("projectCategory", projectCategory);
		param.put("projectStartDate", projectStartDate);
		param.put("projectEndDate", projectEndDate);
		param.put("shippingStartDate", shippingStartDate);
		param.put("detailDesc", detailDesc);
		param.put("address", address);
		param.put("latitude", latitude);
		param.put("longitude", longitude);
		param.put("province", province);

		try {
			session = getSqlSessionFactory().openSession(true);
			int result = session.insert("projects-mapper.insertProject", param);

			System.out.println("hreer" + result);

			resultMap.put("result", result);
			resultMap.put("projectId", (Integer) param.get("projectId"));

			System.out.println(param.get("projectId"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return resultMap;
	}

	@Override
	public int insertProjectItems(List<ProjectItemDto> list) {
		// TODO Auto-generated method stub
		SqlSession session = null;
		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);

			for (ProjectItemDto dto : list) {
				Map<String, String> param = new HashMap<String, String>();

				param.put("projectItemName", dto.getProjectItemName());
				param.put("projectItemDesc", dto.getProjectItemDesc());
				param.put("shippingFee", dto.getShippingFee() + "");
				param.put("quantity", dto.getQuantity() + "");
				param.put("projectId", dto.getProjectId() + "");
				param.put("price", dto.getPrice() + "");

				result += session.insert("projects-mapper.insertProjectItems", param);
			}

			System.out.println("insert project items succeed" + result);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return result;
	}

	@Override
	public ProjectDto selectOne(int projectId) {
		SqlSession session = null;

		ProjectDto dto = new ProjectDto();
		try {
			session = getSqlSessionFactory().openSession(true);

			dto = session.selectOne("projects-mapper.selectOne", projectId);

			System.out.println("select project items succeed" + dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return dto;
	}

	@Override
	public int insertHashtags(List<HashtagDto> list) {

		SqlSession session = null;

		int result = 0;

		try {
			session = getSqlSessionFactory().openSession(true);

			for (HashtagDto dto : list) {
				result += session.insert("projects-mapper.insertHashtags", dto.getHashtagName());
			}

			System.out.println(" insertHashtags succeed " + result);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return result;
	}

	@Override
	public List<String> selectExistHashtags(List<String> hashtags) {
		SqlSession session = null;
		List<String> resultList = new ArrayList<String>();

		try {
			session = getSqlSessionFactory().openSession(true);

			for (String item : hashtags) {
				String result = session.selectOne("projects-mapper.selectExistHashtags", item);

				if (result != null) {
					resultList.add(result);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return resultList;
	}

	@Override
	public int insertProjectHashtags(List<String> hashtagList, int projectId) {

		SqlSession session = null;

		int result = 0;

		try {
			session = getSqlSessionFactory().openSession(true);

			for (String str : hashtagList) {
				Map<String, String> param = new HashMap<String, String>();

				param.put("hashtagName", str);
				param.put("projectId", projectId + "");

				System.out.println(str + "projectId = " + projectId);

				result += session.insert("projects-mapper.insertProjectHashtags", param);
			}

			System.out.println(" insertHashtags succeed " + result);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return result;
	}

	@Override
	public List<ProjectItemDto> selectProjectItems(int projectId) {

		SqlSession session = null;

		List<ProjectItemDto> projectItems = new ArrayList<ProjectItemDto>();

		try {
			session = getSqlSessionFactory().openSession(true);

			System.out.print("projectId = " + projectId);

			projectItems = session.selectList("projects-mapper.selectProjectItems", projectId);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return projectItems;
	}

	public List<HashtagDto> selectProjectHashtag(int projectId) {
		SqlSession session = null;

		List<HashtagDto> projectHashtags = new ArrayList<HashtagDto>();
		try {
			session = getSqlSessionFactory().openSession(true);

			projectHashtags = session.selectList("projects-mapper.selectProjectHashtags", projectId);

			System.out.println(" selectProjectHashtags succeed " + projectHashtags);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();

		return projectHashtags;

	}

	@Override
	public List<ProjectDto> selectProjectsWithHashtag(int hashtagseq) {
		SqlSession session = null;

		List<ProjectDto> projects = new ArrayList<ProjectDto>();

		try {
			session = getSqlSessionFactory().openSession(true);

			System.out.print("hashtagseq = " + hashtagseq);
			projects = session.selectList("projects-mapper.selectProjectsWHashtags", hashtagseq);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return projects;
	}

	@Override
	public int selectExistLike(int projectId, String userId) {
		SqlSession session = null;

		Map<String, String> param = new HashMap<String, String>();

		System.out.println("selectExistLike " + projectId + userId);

		param.put("projectId", projectId + "");
		param.put("userId", userId);

		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);

			result = session.selectOne("projects-mapper.selectExistLike", param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return result;
	}

	@Override
	public int projectLike(int projectId, String userId) {
		SqlSession session = null;

		List<ProjectDto> projects = new ArrayList<ProjectDto>();
		Map<String, String> param = new HashMap<String, String>();
		param.put("projectId", projectId + "");
		param.put("userId", userId);

		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);

			result = session.insert("projects-mapper.insertProjectLike", param);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return result;
	}

	@Override
	public int projectUnlike(int projectId, String userId) {
		SqlSession session = null;

		Map<String, String> param = new HashMap<String, String>();

		param.put("projectId", projectId + "");
		param.put("userId", userId);

		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);

			result = session.insert("projects-mapper.deleteProjectLike", param);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return result;
	}

	@Override
	public int projectAddLikeCount(int projectId) {
		SqlSession session = null;

		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);

			result = session.update("projects-mapper.addLikeCount", projectId);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return result;
	}

	@Override
	public int projectRemoveLikeCount(int projectId) {
		SqlSession session = null;

		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);

			result = session.update("projects-mapper.removeLikeCount", projectId);

		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return result;
	}
	
	// 인기 프로젝트 순
	@Override
	public List<ProjectDto> selectListByLikecount() {
		SqlSession session = null;
		
		List<ProjectDto> list = new ArrayList<ProjectDto>();
		
		session = getSqlSessionFactory().openSession(true);
		list = session.selectList("projects-mapper.projectByLikeCount");
		
		session.close();
		
		return list;
	}

	// 신규 프로젝트 순
	@Override
	public List<ProjectDto> selectListByCreatedAt() {
SqlSession session = null;
		
		List<ProjectDto> list = new ArrayList<ProjectDto>();
		
		session = getSqlSessionFactory().openSession(true);
		list = session.selectList("projects-mapper.selectListByCreatedAt");
		
		session.close();
		
		return list;
	}

}
