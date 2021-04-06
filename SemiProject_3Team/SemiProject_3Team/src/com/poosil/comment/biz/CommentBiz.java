package com.poosil.comment.biz;

import java.util.List;

import com.poosil.comment.dto.CommentDto;



public interface CommentBiz {
	
	public List<CommentDto> selectList(int freeboardseq);
	public CommentDto selectOne(int commentno);
	public int insert(CommentDto cdto);
	public int update(CommentDto cdto);
	public int delete(int commentno);
	public int answerProc(CommentDto adto);
}
