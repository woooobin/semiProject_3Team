package com.poosil.comment.biz;

import java.util.List;

import com.poosil.comment.dao.CommentDao;
import com.poosil.comment.dao.CommentDaoImpl;
import com.poosil.comment.dto.CommentDto;

public class CommentBizImpl implements CommentBiz {
	
	CommentDao dao = new CommentDaoImpl();
	
	@Override
	public List<CommentDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}
	
	@Override
	public CommentDto selectOne(int commentno) {
		
		return dao.selectOne(commentno);
	}

	@Override
	public int insert(CommentDto cdto) {
		// TODO Auto-generated method stub
		return dao.insert(cdto);
	}

	@Override
	public int update(CommentDto cdto) {
		// TODO Auto-generated method stub
		return dao.update(cdto);
	}

	@Override
	public int delete(int commentno) {
		// TODO Auto-generated method stub
		return dao.delete(commentno);
	}
	
	@Override
	public int answerProc(CommentDto adto) {
		
		int update = dao.answerUpdate(adto.getCommentno());
		int insert = dao.answerInsert(adto);
		
		return update + insert;
	}

}
