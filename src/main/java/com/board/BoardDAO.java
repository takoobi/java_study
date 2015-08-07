package com.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public void boardInsert(){
		System.out.println("확인");
		session.insert("insert");
	}
}