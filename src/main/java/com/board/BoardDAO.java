package com.board;

import org.mybatis.spring.SqlSessionTemplate;

import com.board.model.BoardBean;

public class BoardDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	
	public void boardInsert(BoardBean bean){
		//sqlSessionTemplate.insert("board.insert");
		System.out.println("뭐가 문제냐");
	}
}
