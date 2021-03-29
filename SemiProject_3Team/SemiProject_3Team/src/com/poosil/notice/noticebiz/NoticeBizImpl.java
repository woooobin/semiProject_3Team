package com.poosil.notice.noticebiz;

import java.util.List;

import com.poosil.notice.noticedao.NoticeDao;
import com.poosil.notice.noticedto.NoticeDto;

public class NoticeBizImpl implements NoticeBiz {
	
	NoticeDao dao = new NoticeDao();

	@Override
	public List<NoticeDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public NoticeDto selectOne(int noticeseq) {
		// TODO Auto-generated method stub
		return dao.selectOne(noticeseq);
	}

	@Override
	public int insert(NoticeDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(NoticeDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int noticeseq) {
		// TODO Auto-generated method stub
		return dao.delete(noticeseq);
	}

	@Override
	public int multiDelete(String[] seqs) {
		// TODO Auto-generated method stub
		return dao.multiDelete(seqs);
	}

}
