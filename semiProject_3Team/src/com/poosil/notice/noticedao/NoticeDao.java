package com.poosil.notice.noticedao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.poosil.notice.noticedb.sqlMapConfig;
import com.poosil.notice.noticedto.NoticeDto;

public class NoticeDao extends sqlMapConfig {
	
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
