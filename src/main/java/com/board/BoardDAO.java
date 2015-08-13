package com.board;

import org.apache.ibatis.session.SqlSession;

import com.config.MybatisInit;
import com.model.BoardBean;

import java.util.List;


public class BoardDAO {

	private SqlSession session;
	
	public BoardDAO(MybatisInit mybatis) {
		this.session = mybatis.getSession();
	}
	
	public void boardInsert(BoardBean bean){
		System.out.println("확인");
		session.insert("insert", bean);
		session.commit();
	}
	
	public List<BoardBean> selectAll(){		
		return session.selectList("selectAll");
	}
	
	public List selectTag(){
		return (List) session.selectList("selectTag");
	}
}