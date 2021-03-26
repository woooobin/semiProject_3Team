package com.poosil.notice.noticedao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.poosil.notice.noticedto.NoticeDto;
import com.poosil.util.db.SqlMapConfig;

public class NoticeDao extends SqlMapConfig {
	
	public List<NoticeDto> selectList(){
		
		SqlSession session = null;
		
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			
			list = session.selectList("noticemapper.selectList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		session.close();
		
		return list;
	}
	
}
