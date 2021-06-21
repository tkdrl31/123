package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class memberDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getConnection() throws NamingException, SQLException {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();
	}
	
	//							class	object
	public void insertMember(memberBean mBean) throws NamingException, SQLException {
		getConnection(); //DB 연결 메소드
		
		try { 
			String sql = "insert into Campingmember values(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mBean.getId());
			pstmt.setString(2, mBean.getPass1());
			pstmt.setString(3, mBean.getEmail());
			pstmt.setString(4, mBean.getTel());
			pstmt.setString(5, mBean.getHobby());
			pstmt.setString(6, mBean.getJob());
			pstmt.setString(7, mBean.getAge());
			pstmt.setString(8, mBean.getInfo());
			
			pstmt.executeUpdate();	//insert, update, delete에 사용
			
			conn.commit();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public Vector<memberBean> allSelectMember() throws NamingException, SQLException {
		
		getConnection();
		
		Vector<memberBean> v = new Vector<memberBean>();
		
		try { 
			String sql = "select * from Campingmember";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberBean mBean = new memberBean();
				
				mBean.setId(rs.getString(1));
				mBean.setPass1(rs.getString(2));
				mBean.setEmail(rs.getString(3));
				mBean.setTel(rs.getString(4));
				mBean.setHobby(rs.getString(5));
				mBean.setJob(rs.getString(6));
				mBean.setAge(rs.getString(7));
				mBean.setInfo(rs.getString(8));
				
				v.add(mBean);
			}
			
			conn.commit();
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	//상세 정보 보기: 해당 아이디의 정보를 반환해주는 역할을 하는 메소드
	public memberBean oneSelectMember(String id) throws SQLException, NamingException {
		getConnection(); //DB 연결
		
		String sql = "select * from Campingmember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		memberBean mBean = new memberBean();
		
		if(rs.next()) {
			
			mBean.setId(rs.getString(1));
			mBean.setPass1(rs.getString(2));
			mBean.setEmail(rs.getString(3));
			mBean.setTel(rs.getString(4));
			mBean.setHobby(rs.getString(5));
			mBean.setJob(rs.getString(6));
			mBean.setAge(rs.getString(7));
			mBean.setInfo(rs.getString(8));
		}
		rs.close();
		pstmt.close();
		conn.commit();
		conn.close();
		
		return mBean;
	}
	
	// 해당 아이디의 패스워드 값을 반환해주는 메소드 역할
	public String getPass(String id) throws SQLException, NamingException {
		
		String pass = "";
		
		getConnection();
		
		String sql = "select pass1 from Campingmember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			pass = rs.getString(1);
		}
		
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
		
		return pass;
	}
	
	//해당 아이디의 정보를 수정합니다.
	public void updateCampingmember(memberBean mBean) throws SQLException, NamingException {
		
		getConnection();
		
		String sql = "update Campingmember set email=?, tel=?, info=? where id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mBean.getEmail());
		pstmt.setString(2, mBean.getTel());
		pstmt.setString(3, mBean.getInfo());
		pstmt.setString(4, mBean.getId());
		
		pstmt.executeUpdate();
		
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
	
	//아이디에 해당하는 정보를 삭제합니다.
	public void deleteCampingmember(String id) throws SQLException, NamingException {
		getConnection();
		
		String sql = "delete from Campingmember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
}