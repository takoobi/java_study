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
		System.out.println(bean);
		session.insert("insert", bean);
		session.commit();
	}
	
	public List<BoardBean> selectAll(){		
		return session.selectList("selectAll");
	}
	
	public List<BoardBean> boardList(int page){		
		return session.selectList("boardList", page);
	}
	
	public List selectTag(){
		return (List) session.selectList("selectTag");
	}
	
	public int listCount(){
		return session.selectOne("selectCount");
	}
}