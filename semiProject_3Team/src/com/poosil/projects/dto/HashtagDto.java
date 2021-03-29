package com.poosil.projects.dto;

public class HashtagDto {
	private int hashtagSeq;
	private String hashtagName;

	public HashtagDto() {
	}

	public HashtagDto(int hashtagSeq, String hashtagName) {
		super();
		this.hashtagSeq = hashtagSeq;
		this.hashtagName = hashtagName;
	}

	public int getHashtagSeq() {
		return hashtagSeq;
	}

	public void setHashtagSeq(int hashtagSeq) {
		this.hashtagSeq = hashtagSeq;
	}

	public String getHashtagName() {
		return hashtagName;
	}

	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
	}

}
