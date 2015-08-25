package com.model;

import java.util.Date;

public class ReplyBean {
	private int pk;
	private String email;
	private String description;
	private Date create_date;
	private int board_key;
	
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getBoard_key() {
		return board_key;
	}
	public void setBoard_key(int board_key) {
		this.board_key = board_key;
	}
}