package com.model;

import java.sql.Date;

public class BoardBean {
	private int pk;
	private String title;
	private String description;
	private String image;
	private int good;
	private int bad;
	private int hit; 
	private Date create_date;
	private int member_pk;
	private String category;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	@Override
	public String toString() {
		return "BoardBean [pk=" + pk + ", title=" + title + ", description=" + description + ", image=" + image
				+ ", good=" + good + ", bad=" + bad + ", hit=" + hit + ", create_date=" + create_date + ", member_pk="
				+ member_pk + ", category=" + category + "]";
	}
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
	public int getGood() {
		return good;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	
}
