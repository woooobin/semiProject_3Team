package com.poosil.notice.noticedto;

import java.sql.Date;

public class NoticeDto {
	
	private int noticeseq;
	private String userid;
	private String noticetitle;
	private String noticecontent;
	private Date regdate;
	
	public NoticeDto() {
		
	}

	public NoticeDto(int noticeseq, String userid, String noticetitle, String noticecontent, Date regdate) {
		super();
		this.noticeseq = noticeseq;
		this.userid = userid;
		this.noticetitle = noticetitle;
		this.noticecontent = noticecontent;
		this.regdate = regdate;
	}

	public int getNoticeseq() {
		return noticeseq;
	}

	public void setNoticeseq(int noticeseq) {
		this.noticeseq = noticeseq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getNoticecontent() {
		return noticecontent;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
}
