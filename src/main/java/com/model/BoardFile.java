package com.model;

public class BoardFile {
	private long size;	
	private String name;
	private String path;
	private String message;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
