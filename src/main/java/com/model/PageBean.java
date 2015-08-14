package com.model;

import java.util.ArrayList;
import java.util.List;

public class PageBean {
	private int page;
	private int maxpage;
	private int startpage;
	private int endpage;
	private int listcount;
	private List<BoardBean> boardlist;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxpage() {
		return maxpage;
	}
	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getListcount() {
		return listcount;
	}
	public void setListcount(int listcount) {
		this.listcount = listcount;
	}
	public List<BoardBean> getBoardlist() {
		return boardlist;
	}
	public void setBoardlist(List<BoardBean> boardlist) {
		this.boardlist = boardlist;
	}
}
