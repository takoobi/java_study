package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public BoardDAO() {
		try {
			Context init = new InitialContext();
			ds=(DataSource) init.lookup("java:comp/env/two");
		} catch (NamingException e) {
			e.printStackTrace();
			System.out.println("db에 연결을 실패했습니다." + e);
			return;
		}
	}

	//글쓰기
	public boolean boardInsert(BoardBean boardbean, String category) {
		String sql="insert into board_"+category+"(pk,email, nickname, title, description, tag, image) values (board_seq.nextval,?,?,?,?,?,?)";
		int result=0;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boardbean.getEmail());
			pstmt.setString(2, boardbean.getNickname());
			pstmt.setString(3, boardbean.getTitle());
			pstmt.setString(4, boardbean.getDescription());
			pstmt.setString(5, boardbean.getTag());
			pstmt.setString(6, boardbean.getImage());
			
			result=pstmt.executeUpdate();
			if(result==0)return false;
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close();
		}
		return false;
	}
	
	public void close(){	
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
