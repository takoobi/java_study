package com.board;

import org.apache.ibatis.session.SqlSession;

import com.config.MybatisInit;


public class BoardDAO {

	private SqlSession session;
	
	public BoardDAO(MybatisInit mybatis) {
		this.session = mybatis.getSession();
	}
	
	public void boardInsert(){
		System.out.println("확인");
		session.insert("insert");
	}
}