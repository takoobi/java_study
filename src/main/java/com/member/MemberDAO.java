package com.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.MemberBean;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public void memberInsert(MemberBean bean){
		session.insert("insertMember", bean);
		session.commit();
		
	}
	
}
