package com.model;

import java.util.Date;

public class Reply {
	private int board_pk,member_pk, good, bad; 
	private String content;
	private Date create_date;
	
	public int getBoard_pk() {
		return board_pk;
	}
	public void setBoard_pk(int board_pk) {
		this.board_pk = board_pk;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public int getGood() {
		return good;
	}
	@Override
	public String toString() {
		return "reply [board_pk=" + board_pk + ", member_pk=" + member_pk + ", good=" + good + ", bad=" + bad
				+ ", content=" + content + ", create_date=" + create_date + "]";
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
}
