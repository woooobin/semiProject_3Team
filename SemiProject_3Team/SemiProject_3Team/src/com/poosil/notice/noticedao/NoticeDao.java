package com.poosil.notice.noticedao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;

import com.poosil.notice.noticedto.NoticeDto;
import com.poosil.util.db.SqlMapConfig;

public class NoticeDao extends SqlMapConfig {
	
	public List<NoticeDto> selectList(){
		
		SqlSession session = null;
		
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			list = session.selectList("noticemapper.selectList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public NoticeDto selectOne(int noticeseq) {
		
		SqlSession session = null;
		
		NoticeDto dto = new NoticeDto();
			
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne("noticemapper.selectOne", noticeseq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public int insert(NoticeDto dto) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("noticemapper.insert", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return res;
	}
	
	public int update(NoticeDto dto) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.update("noticemapper.update", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int delete(int noticeseq) {
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.delete("noticemapper.delete", noticeseq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int multiDelete(String[] seqs) {
		int count = 0;
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("seqs", seqs);
		
		try(SqlSession session = getSqlSessionFactory().openSession(false);) {
			count = session.delete("noticemapper.multiDelete", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	
	public int getTotalCount() {
		int total = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(false);
			//total = session.selectList(arg0, arg1, arg2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return total;
	}
	
}
