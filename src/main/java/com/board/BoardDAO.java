package com.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.BoardBean;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	//글 추가하기
	public void insert(BoardBean bean){
		
		session.insert("board.insert", bean);
	}

	//전체글 불러오기
	public List<BoardBean> list(String category) {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("category", category);
		
		List<BoardBean> list = session.selectList("board.list", hashMap);
		return list;
	}
}