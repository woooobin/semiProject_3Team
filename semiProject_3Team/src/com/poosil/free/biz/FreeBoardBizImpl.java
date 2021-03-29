package com.poosil.free.biz;

import java.util.List;

import com.poosil.free.dao.FreeBoardDao;
import com.poosil.free.dao.FreeBoardDaoImpl;
import com.poosil.free.dto.FreeBoardDto;

public class FreeBoardBizImpl implements FreeBoardBiz {
	
	FreeBoardDao dao = new FreeBoardDaoImpl();
	
	@Override
	public List<FreeBoardDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public FreeBoardDto selectOne(int freeboardseq) {
		// TODO Auto-generated method stub
		return dao.selectOne(freeboardseq);
	}

	@Override
	public int insert(FreeBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(FreeBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int freeboardseq) {
		// TODO Auto-generated method stub
		return dao.delete(freeboardseq);
	}

}
