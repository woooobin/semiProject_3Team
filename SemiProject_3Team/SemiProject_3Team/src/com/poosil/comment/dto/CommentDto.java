package com.poosil.comment.dto;

import java.sql.Date;

public class CommentDto {
	
	private int commentno;
	private int groupno;
	private int groupseq;
	private int titletab;
	private int freeboardseq;
	private String userid;
	private String commentcontent;
	private Date regdate;
	
	public CommentDto() {
		
	}

	public CommentDto(int commentno, int groupno, int groupseq, int titletab, int freeboardseq, String userid,
			String commentcontent, Date regdate) {
		super();
		this.commentno = commentno;
		this.groupno = groupno;
		this.groupseq = groupseq;
		this.titletab = titletab;
		this.freeboardseq = freeboardseq;
		this.userid = userid;
		this.commentcontent = commentcontent;
		this.regdate = regdate;
	}

	public int getCommentno() {
		return commentno;
	}

	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public int getGroupseq() {
		return groupseq;
	}

	public void setGroupseq(int groupseq) {
		this.groupseq = groupseq;
	}

	public int getTitletab() {
		return titletab;
	}

	public void setTitletab(int titletab) {
		this.titletab = titletab;
	}

	public int getFreeboardseq() {
		return freeboardseq;
	}

	public void setFreeboardseq(int freeboardseq) {
		this.freeboardseq = freeboardseq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCommentcontent() {
		return commentcontent;
	}

	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}