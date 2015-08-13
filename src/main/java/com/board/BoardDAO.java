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

	//게시글 개수 가져오기
	public int totalCount(String category, String result) {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("category", category);
		
		hashMap.put("tagCount", "0");
		if(result!="") {
			hashMap.put("tagCount", "1");
			hashMap.put("0", result);
		}
		
		String[] tag =null;

		if(result.contains(",")){
			tag = result.split(",");
			for(int i=0; i<tag.length; i++){
				hashMap.put(String.valueOf(i), tag[i]);
			}	
			hashMap.put("tagCount", String.valueOf(tag.length));
		}
		
		return session.selectOne("board.totalCount", hashMap);
	}

	//페이징처리한 게시글 가져오기
	public List<BoardBean> pagingList(String category, String result, int startNum, int endNum) {
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("start", String.valueOf(startNum));
        hashMap.put("end", String.valueOf(endNum));
        hashMap.put("category", category);
        
		
		hashMap.put("tagCount", "0");
		if(result!="") {
			hashMap.put("tagCount", "1");
			hashMap.put("0", result);
		}
		
		String[] tag =null;

		if(result.contains(",")){
			tag = result.split(",");
			for(int i=0; i<tag.length; i++){
				hashMap.put(String.valueOf(i), tag[i]);
			}	
			hashMap.put("tagCount", String.valueOf(tag.length));
		}        
		return session.selectList("board.pagingList", hashMap);
	}
}