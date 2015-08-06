package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAO(){
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/two");
		} catch (NamingException e) {
			e.printStackTrace();
			System.out.println("db�� ������ �����߽��ϴ�." + e);
			return;
		}
	}
	
	//ȸ�� ���
	public boolean memberInsert(MemberBean member){
		String sql="insert into member (email,pw,nickname,image,description,gender)"
				+"values(?,?,?,?,?,?)";
		int result=0;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getNickname());
			pstmt.setString(4, member.getImage());
			pstmt.setString(5, member.getDescription());
			pstmt.setString(6, member.getGender());
			
			result=pstmt.executeUpdate();
			if(result==0)return false;
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("memberInsert ����"+e);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}

	//�г��� ��������
	public String getNickname(String email){
		String sql="select nickname from member where email=?";
		String nickname=null;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) nickname=rs.getString("nickname");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		return nickname;
	}
	//�� ���� ȸ������ ��������
	public MemberBean getOneMemberData(String email) {
		String sql ="select * from member where email=?";
		MemberBean one_member_data = null;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				one_member_data = new MemberBean(); 
				one_member_data.setEmail(rs.getString("email"));
				one_member_data.setNickname(rs.getString("nickname"));
				one_member_data.setImage(rs.getString("image"));
				one_member_data.setDescription(rs.getString("description"));
				one_member_data.setGender(rs.getString("gender"));
				one_member_data.setCreate_date(rs.getDate("create_date"));
			}
			return one_member_data;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("ȸ������ �������� ���� : "+e);
		}finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		return null;
	}
	
	//�α��� üũ
	public int memberCheck(String email, String pw) {
		String sql="select pw from member where email=?";
		int x=-1;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String pw_check=rs.getString("pw");
				if(pw_check.equals(pw)){
					x=1;
				}else{
					x=0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		return x;
	}
	
	//ȸ�� �����ϱ�
	public int memberDelete(String email, String pw) {
		String sql="select pw from member where email=?";
		int x=-1;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String pw_check=rs.getString("pw");
				if(pw_check.equals(pw)){
					sql="delete from member where email=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, email);
					pstmt.executeUpdate();
					x=1;
				}else{
					x=0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		return x;
	}

	//ȸ����������
	public void memberUpdate(MemberBean memberbean) {
		String sql="update member set pw=?, nickname=?, image=?, description=?, gender=? where email=?";
				
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberbean.getPw());
			pstmt.setString(2, memberbean.getNickname());
			pstmt.setString(3, memberbean.getImage());
			pstmt.setString(4, memberbean.getDescription());
			pstmt.setString(5, memberbean.getGender());
			pstmt.setString(6, memberbean.getEmail());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
	}

	//��й�ȣã��
	public String memberFind(String email) {
		String sql="select pw from member where email=?";

		String result=null;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				result=rs.getString("pw");
			}else{
				result="������";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		return result;
	}
	
	//�г��� �ߺ� Ȯ��
	public boolean memberNicknameCheck(String nickname){
		String sql = "select * from member where nickname=?";
		boolean result=false;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				result=true;
			}else{
				result=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		
		return result;
	}

	//���̵� �ߺ� Ȯ��
	public boolean memberEmailCheck(String email) {
		
		String sql = "select * from member where email=?";
		boolean result=false;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				result=true;
			}else{
				result=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		
		return result;
	}
	
}