package com.poosil.comment.dao;

import java.util.List;

import com.poosil.comment.dto.CommentDto;

public interface CommentDao {
	
	public List<CommentDto> selectList();
	public CommentDto selectOne(int commentno);
	public int insert(CommentDto cdto);
	public int update(CommentDto cdto);
	public int delete(int commentno);
	public int answerUpdate(int parentcommentNo);
	public int answerInsert(CommentDto adto);
}
