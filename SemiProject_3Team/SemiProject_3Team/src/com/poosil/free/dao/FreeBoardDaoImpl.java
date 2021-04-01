package com.poosil.free.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.poosil.free.dto.FreeBoardDto;
import com.poosil.util.db.SqlMapConfig;

public class FreeBoardDaoImpl extends SqlMapConfig implements FreeBoardDao {
	
	@Override
	public List<FreeBoardDto> selectList() {
		SqlSession session = null;
		
		List<FreeBoardDto> list = new ArrayList<FreeBoardDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			list = session.selectList("freeboardmapper.selectList");
			
			for(FreeBoardDto dto : list) {
				System.out.println("dto : " + dto.getUserid());
				System.out.println("dto2 : " + dto.getRegdate());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public FreeBoardDto selectOne(int freeboardseq) {
		SqlSession session = null;
		
		FreeBoardDto dto = new FreeBoardDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne("freeboardmapper.selectOne", freeboardseq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}

	@Override
	public int insert(FreeBoardDto dto) {
		int res = 0;
		
		try {
			
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("freeboardmapper.insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return res;
	}

	@Override
	public int update(FreeBoardDto dto) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.update("freeboardmapper.update", dto);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int readcount(int freeboardseq) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.update("freeboardmapper.readcount", freeboardseq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int freeboardseq) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.delete("freeboardmapper.delete", freeboardseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
