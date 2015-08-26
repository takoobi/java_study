package com.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.config.YamlProcessor.ResolutionMethod;

import com.config.MybatisInit;
import com.model.BoardBean;
import com.model.Reply;
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
	
	public void replyInsert(Reply reply){
		session.insert("replyInsert", reply);
		session.commit();
	}
	
	public int getBoardPk(){
		return session.selectOne("getBoardPk");
	}
	public int getReplyPk(){
		return session.selectOne("getReplyPk");
	}
	
	public Reply getReplyOne(int pk){
		return session.selectOne("getReplyOne", pk);
	}
	public void goExile(int pk){
		session.update("goExile",pk);
		session.commit();
	}
	public List<BoardBean> selectAll(){		
		return session.selectList("selectAll");
	}
	
	public List<BoardBean> boardList(Map obj){		
		return session.selectList("boardList", obj);
	}
	public List<BoardBean> boardPkOfTag(Map obj){
		return session.selectList("boardPkOfTag", obj);
	}
	
	public List<BoardBean> recentBoard(String category){
		return session.selectList("recentBoard", category);
	}

	public BoardBean getBoard(int pk) {
		// TODO Auto-generated method stub
		return session.selectOne("getBoard", pk);
	}
	public void tagInsert(Tag tag){
		session.insert("tagInsert", tag);
		session.commit();
	}
	public List<String> getTagList(String category){
		//board.xml 에는 resultType을 list가 아닌 제너릭에 해당하는 자료형을 입력해주어야한다.
		return session.selectList("getTagList", category);
	}
	
	public List<String> getCategory(){
		return session.selectList("getCategory");
	}
	public void updateCount(int pk){
		session.update("updateCount",pk);
		session.commit();
	}
	public List<Object> getReply(int pk){
		return session.selectList("getReply", pk);
	}
	
	public void gbUpdate(Map<String, Object> map){
		session.update("gbUpdate",map);
		session.commit();
	}
	public void gbReply(Map<String, Object> map){
		session.update("gbReply",map);
		session.commit();
	}
	public void gbInsert(Map<String, Object> map){
		session.insert("gbInsert",map);
		session.commit();
	}
	
	public void badUpdate(Map<String, Object> map){
		session.update("badUpdate",map);
		session.commit();
	}
	public void goodUpdate(Map<String, Object> map){
		session.update("goodUpdate",map);
		session.commit();
	}
	public Object getMember_pkGB(Map<String, Object> map){
		return session.selectOne("getMember_pkGB", map);
	}
	
	public String gbCheck(Map<String, Object> map){
		return session.selectOne("gbCheck", map);
	}
	public List<String> getDetailTag(int board_pk){
		return session.selectList("getDetailTag", board_pk);
	}
	
}