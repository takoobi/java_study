package com.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.BoardBean;
import com.model.ReplyBean;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	HashMap<String, String> hashMap = new HashMap<String, String>();
	String result=null;
	
	//글 추가하기
	public void insert(BoardBean bean){
		session.insert("board.insert", bean);
	}

	//게시글 개수 가져오기
	public int totalCount(String category, String result) {
		this.result=result;
		hashMap.put("category", category);
		
		tag_divide();
		
		return session.selectOne("board.totalCount", hashMap);
	}

	//페이징처리한 게시글 가져오기
	public List<BoardBean> pagingList(String category, String result, int startNum, int endNum) {
		this.result=result;        
        hashMap.put("start", String.valueOf(startNum));
        hashMap.put("end", String.valueOf(endNum));
        hashMap.put("category", category);
        
        tag_divide();
        
		return session.selectList("board.pagingList", hashMap);
	}
	
	//태그 나누기
	public void tag_divide(){
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
	}
	
	//하나의 게시글 가져오기
	public BoardBean one_board(String category, int pk){
		hashMap.put("category", category);
		hashMap.put("pk", String.valueOf(pk));
		
		session.update("board.hit_add",hashMap);
		return session.selectOne("board.one_board",hashMap);
	}
	
	//공감, 공감취소, 비공감, 비공감취소
	public void emotion(String category, int number, int pk, String id){
		hashMap.put("category", category);
		hashMap.put("number", String.valueOf(number));
		hashMap.put("pk", String.valueOf(pk));
		session.update("board.emotion", hashMap);

		String id_add = session.selectOne("board.emotion_id_get", hashMap);

		if(number==1 || number==3){
			if(id_add==null) id_add=","+id;
			else id_add+=","+id;		
		}
		if(number==2 || number==4){
			id_add=id_add.replace(","+id,"");
		}
		hashMap.put("id_add", id_add);
		session.update("board.emotion_id_add", hashMap);	
	}
	
	//공감, 비공감 개수, id 가져오기
	public Map<String, Object> emotion_count_get(String category, int pk) {
		hashMap.put("category", category);
		hashMap.put("pk", String.valueOf(pk));
		return session.selectOne("board.emotion_count_get", hashMap);
	}

	//댓글 추가하기
	public void reply_insert(String description, String board_key, String email) {
		hashMap.put("description", description);
		hashMap.put("board_key", board_key);
		hashMap.put("email", email);
		
		session.insert("board.reply_insert",hashMap);
	}

	//댓글 가져오기
	public List<ReplyBean> reply_getData(String board_key) {
		return session.selectList("board.reply_getData", board_key);
	}

	//지정한 개수의 게시글 가져오기
	public List<BoardBean> get_setCount_board(String category){
		hashMap.put("category", category);
		return session.selectList("board.get_setCount_board", hashMap);
	}
}