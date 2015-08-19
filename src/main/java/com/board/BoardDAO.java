package com.board;

import org.apache.ibatis.session.SqlSession;

import com.config.MybatisInit;
import com.model.BoardBean;
import com.model.Tag;

import java.util.List;


public class BoardDAO {

	private SqlSession session;
	
	public BoardDAO(MybatisInit mybatis) {
		this.session = mybatis.getSession();
	}
	
	public void boardInsert(BoardBean bean){
		System.out.println("확인");
		System.out.println(bean);
		session.insert("insertBoard", bean);
		session.commit();
	}
	public int getBoardPk(){
		return session.selectOne("getBoardPk");
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

	public BoardBean getBoard(int id) {
		// TODO Auto-generated method stub
		return session.selectOne("getBoard", id);
	}
	public void tagInsert(Tag tag){
		session.insert("tagInsert", tag);
		session.commit();
	}
}