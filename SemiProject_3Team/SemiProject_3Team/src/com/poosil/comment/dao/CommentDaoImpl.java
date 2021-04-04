package com.poosil.comment.dao;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.poosil.comment.dto.CommentDto;
import com.poosil.util.db.SqlMapConfig;

public class CommentDaoImpl extends SqlMapConfig implements CommentDao {

	@Override
	public List<CommentDto> selectList(int freeboardseq) {
		SqlSession session = null;
		
		List<CommentDto> list = new ArrayList<CommentDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("commentboardmapper.selectList", freeboardseq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	@Override
	public CommentDto selectOne(int commentno) {
		
		SqlSession session = null;
		
		CommentDto dto = new CommentDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne("commentboardmapper.selectOne", commentno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return dto;
	}

	@Override
	public int insert(CommentDto cdto) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("commentboardmapper.insert", cdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(CommentDto cdto) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.update("commentboardmapper.update", cdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int commentno) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.delete("commentboardmapper.delete", commentno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
	}
	
	@Override
	public int answerUpdate(int parentcommentNo) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.delete("commentboardmapper.answerUpdate", parentcommentNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
	}
	
	@Override
	public int answerInsert(CommentDto adto) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("commentboardmapper.answerInsert", adto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
}
