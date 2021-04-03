package com.poosil.notice.noticedto;

import java.sql.Date;

public class NoticeDto {
	
	private int noticeseq;
	private String userid;
	private String noticetitle;
	private String noticecontent;
	private String userrole;
	private Date regdate;
	
	
	public NoticeDto() {
		
	}


	public NoticeDto(int noticeseq, String userid, String noticetitle, String noticecontent, String userrole,
			Date regdate) {
		super();
		this.noticeseq = noticeseq;
		this.userid = userid;
		this.noticetitle = noticetitle;
		this.noticecontent = noticecontent;
		this.userrole = userrole;
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


	public String getUserrole() {
		return userrole;
	}


	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	
}
