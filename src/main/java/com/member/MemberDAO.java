package com.member;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.config.MybatisInit;
import com.model.MemberBean;

public class MemberDAO {

	private SqlSession session;
	
	public MemberDAO(MybatisInit mybatis) {
		this.session = mybatis.getSession();
	}

	//이메일중복확인
	public boolean emailCheck(String email) {
		int number = session.selectOne("member.emailCheck", email);
		return number==1?true:false;
	}

	//닉네임 중복확인
	boolean nicknameCheck(String nickname) {
		int number = session.selectOne("member.nicknameCheck",nickname);
		return number==1?true:false;
	}

	//회원추가하기
	public void insert(MemberBean bean) {
		session.insert("member.insert", bean);
		session.commit();
	}
	
	//닉네임 검색
	public List<String> nicknameSearch(String nickname){
		return session.selectList("member.nicknameSearch", nickname);
	}

	//이메일찾기
	public String find(String email) {
		int number = session.selectOne("member.find", email);
		
		return number==1?"존재":"무존재";
	}

	//회원탈퇴하기
	public int delete(String email, String pw) {
		String password = session.selectOne("member.loginCheck",email);
		int number=0;
		
		if(password.equals(pw)){
			session.delete("member.delete", email);
			number=1;
		} else{
			number=0;
		}
		
		return number;
	}

	//회원확인
	public int loginCheck(String email, String pw) {
		String password = session.selectOne("member.loginCheck", email);
		int number=0;
		
		if(password==null) number=-1;
		else if(password.equals(pw)) number=1;
		else number=0;
		
		return number;
	}

	//닉네임 가져오기
	public String getNickname(String email) {
		return session.selectOne("member.getNickname",email);
	}
	
	//포인트 가져오기
	public int getPoint(String nickname) {
		return session.selectOne("member.getPoint",nickname);
	}
		
	//PK 가져오기
	public int getPk(String email) {
		return session.selectOne("member.getPk",email);
	}

	//한 명의 데이터 가져오기
	public MemberBean getOneData(String email) {
		return session.selectOne("member.getOneData", email);
	}
	
	public MemberBean memberInfo(String pk){
		return session.selectOne("member.memberInfo", pk);
	}

	//회원정보수정하기
	public void update(MemberBean bean) {
		session.update("member.update2",bean);
	}
	
	public void updatePoint(String point, String nickname){
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("point", point);
		hashMap.put("nickname", nickname);
		session.update("member.updatePoint",hashMap);
		session.commit();
	}

	//임시비밀번호 설정
	public void temporaryPassword(String email, int temporaryPassword) {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("email", email);
		hashMap.put("temporaryPassword", String.valueOf(temporaryPassword));
		session.update("member.temporaryPassword", hashMap);
	}
	
}
