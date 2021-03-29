package com.poosil.free.biz;

import java.util.List;

import com.poosil.free.dto.FreeBoardDto;

public interface FreeBoardBiz {
	
	public List<FreeBoardDto> selectList();
	public FreeBoardDto selectOne(int freeboardseq);
	public int insert(FreeBoardDto dto);
	public int update(FreeBoardDto dto);
	public int delete(int freeboardseq);
	
}
