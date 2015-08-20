package com.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.config.MybatisInit;
import com.model.BoardBean;
import com.model.Tag;


public class BoardDAO {

	private SqlSession session;
	
	public BoardDAO(MybatisInit mybatis) {
		this.session = mybatis.getSession();
	}
	
	public void boardInsert(BoardBean bean){
		session.insert("insertBoard", bean);
		session.commit();
	}
	public int getBoardPk(){
		return session.selectOne("getBoardPk");
	}
	
	public List<BoardBean> selectAll(){		
		return session.selectList("selectAll");
	}
	
	public List<BoardBean> boardList(Map obj){		
		return session.selectList("boardList", obj);
	}
	public List<BoardBean> BoardPkOfTag(Map obj){
		return session.selectList("BoardPkOfTag", obj);
	}

	public BoardBean getBoard(Map map) {
		// TODO Auto-generated method stub
		return session.selectOne("getBoard", map);
	}
	public void tagInsert(Tag tag){
		session.insert("tagInsert", tag);
		session.commit();
	}
	public List<String> getTagList(String category){
		//board.xml 에는 resultType을 list가 아닌 제너릭에 해당하는 자료형을 입력해주어야한다.
		return session.selectList("getTagList", category);
	}
}