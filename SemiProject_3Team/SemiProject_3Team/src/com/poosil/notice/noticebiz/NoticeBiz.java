package com.poosil.notice.noticebiz;

import java.util.List;

import com.poosil.notice.noticedto.NoticeDto;

public interface NoticeBiz {
	
	public List<NoticeDto> selectList();
	public NoticeDto selectOne(int noticeseq);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int noticeseq);
	public int multiDelete(String[] seqs);

}
