package com.poosil.free.dao;

import java.util.List;

import com.poosil.free.dto.FreeBoardDto;

public interface FreeBoardDao {
	
	public List<FreeBoardDto> selectList();
	public FreeBoardDto selectOne(int freeboardseq);
	public int insert(FreeBoardDto dto);
	public int update(FreeBoardDto dto);
	public int readcount(int freeboardseq);
	public int delete(int freeboardseq);
	
}
