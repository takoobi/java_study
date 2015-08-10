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
	
	public void boardInsert(BoardBean bean){
		
		session.insert("insert", bean);
	}

	public List<BoardBean> boardList(String category) {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("category", category);
		
		List<BoardBean> list = session.selectList("list", hashMap);
		return list;
	}
}