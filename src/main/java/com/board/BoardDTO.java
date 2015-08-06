package com.board;

import java.util.Date;

public class BoardDTO {
	private int pk;
	private String title;
	private String description;
	private String image;
	private int like;
	private int hate;
	private int count;
	private String nickname;
	private String tag;
	private String email;
	private int reply;
	private Date create_date;
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getEmpathy() {
		return empathy;
	}
	public void setEmpathy(int empathy) {
		this.empathy = empathy;
	}
	public int getNotempathy() {
		return notempathy;
	}
	public void setNotempathy(int notempathy) {
		this.notempathy = notempathy;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
}
