package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class boardDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//connection Pool 방식의 데이터베이스 연동 방법
	public void getConnection() throws SQLException  {				
		
			try {
				Context initctx;
				
				initctx = new InitialContext();
				DataSource ds = (DataSource) initctx.lookup("java:comp/env/jdbc/OracleDB");
				
				conn = ds.getConnection(); 	
				System.out.println("Connection Pool2 연결이 잘되었습니다.");
			} catch (NamingException e) {
				e.printStackTrace();
			}
	}
	
	//
	public void insertBoard(boardBean bBean) throws SQLException{
		
		getConnection();
		
		int ref = 0; 
		int re_step = 1; // 새 글일 경우  = 부모 글이기 때문에
		int re_level = 1;
		
		String refsql = "select max(ref) from smartBoard";
		pstmt = conn.prepareStatement(refsql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			ref = rs.getInt(1) + 1;//글 그룹: 가장 큰 ref 값을 가정하고, +1을 합니다.
		}
		
		String sql = "insert into smartBoard values(smartBoard_seq.nextval, ?,?,?,?, sysdate, ?,?,?, 0, ?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, bBean.getWriter());
		pstmt.setString(2, bBean.getEmail()); 
		pstmt.setString(3, bBean.getSubject());
		pstmt.setString(4, bBean.getPassword());
		pstmt.setInt(5, ref);
		pstmt.setInt(6, re_step);
		pstmt.setInt(7, re_level);
		pstmt.setString(8, bBean.getContent()); 	
		
		pstmt.executeUpdate();
		
		if(pstmt != null) {
			if(conn != null) {
				pstmt.close();
				conn.commit();
				conn.close();
			}
		}
		
	}
	
	//모든 게시글을 반환해주는 메소드 호출
	public Vector<boardBean> getAllBoard(int start, int end) throws SQLException {
		getConnection(); 
		
		 Vector<boardBean> vec = new  Vector<boardBean>();
		
		 try {
			 // 가장 최신글의 스텝
			 // ref 글 그룹의 기준으로 최신 글이 가장 위로 올라오고
			 // re_step 으로 답변글을 쓴다면, 오름차순으로 하라고 해주고,
			 // 이것을 우리는 통상적으로 A라는 별칭으로 사용합니다.
			 // Rownum 기준으로 Rnum 이라는 별칭을 사용하여 Rnum이 startRow보다 크고,
			 // endRow보다 작은 경우에 해당하는 모든 레코드를 가져오라는 의미의 명령을 줍니다.
			 // 즉, 최신글과 답변글까지 포함하여 10개씩 가져옵니다.
			 
				String sql  = "select * from (select A.*, Rownum Rnum from (select * from smartBoard order by ref desc, re_step asc)A) where Rnum >= ? and Rnum <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					boardBean bean = new boardBean();
					
					bean.setNum(rs.getInt(1));
					bean.setWriter(rs.getString(2));
					bean.setEmail(rs.getString(3));
					bean.setSubject(rs.getString(4));
					bean.setPassword(rs.getString(5));
					bean.setReg_date(rs.getString(6));
					bean.setRef(rs.getInt(7));
					bean.setRe_step(rs.getInt(8));
					bean.setRe_level(rs.getInt(9));
					bean.setReadcount(rs.getInt(10));
					bean.setContent(rs.getString(11));
					
					vec.add(bean);			
				}
		if(pstmt != null) {
			if(conn != null) {
				pstmt.close();
				conn.commit();
				conn.close();
				}
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vec;	
	}
	
	//num에 해당하는 게시글을 읽어오는 메소드 호출
	public boardBean getOneBoard(int num) throws SQLException{ 
		boardBean bean = new boardBean();
		
		getConnection();
		
		try {
				//count : 조회수 증가 
				String readsql = "update smartBoard set readcount = readcount + 1 where num = ?";
				pstmt = conn.prepareStatement(readsql);
				pstmt.setInt(1, num); 
				pstmt.executeUpdate();			
			
				String sql = "select * from smartBoard where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num); 
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {			
					bean.setNum(rs.getInt(1));
					bean.setWriter(rs.getString(2));
					bean.setEmail(rs.getString(3));
					bean.setSubject(rs.getString(4));
					bean.setPassword(rs.getString(5));
					bean.setReg_date(rs.getString(6));
					bean.setRef(rs.getInt(7));
					bean.setRe_step(rs.getInt(8));
					bean.setRe_level(rs.getInt(9));
					bean.setReadcount(rs.getInt(10));
					bean.setContent(rs.getString(11));					
				}
				if(pstmt != null) {
					if(conn != null) {
						pstmt.close();
						conn.commit();
						conn.close();
					}
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bean;	// Pointer 역할 (C언어처럼)
	}
	
	//답변글이 저장되는 메소드 호출
	public void reWriteBoard(boardBean bBean) throws SQLException{ 
		
		getConnection();
		
		try {
				int ref = bBean.getRef();
				int re_step = bBean.getRe_step();
				int re_level = bBean.getRe_level();
				
				//부모글보다 더 큰 re_level의 값을 모두 1증가 합니다.
				String levelsql = "update smartBoard set re_level = re_level + 1 where ref=? and re_level > ?";
				pstmt = conn.prepareStatement(levelsql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_level);
				pstmt.executeUpdate();
				
				//답변글 데이터 저장
				String sql = "insert into smartBoard values(smartBoard_seq.nextval, ?,?,?,?, sysdate,?,?,?, 0,?)";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, bBean.getWriter());
				pstmt.setString(2, bBean.getEmail()); 
				pstmt.setString(3, bBean.getSubject());
				pstmt.setString(4, bBean.getPassword());
				pstmt.setInt(5, ref);
				pstmt.setInt(6, re_step + 1);
				pstmt.setInt(7, re_level + 1);
				pstmt.setString(8, bBean.getContent()); 	
				
				pstmt.executeUpdate();
				
				if(pstmt != null) {
					if(conn != null) {
						pstmt.close();
						conn.commit();
						conn.close();
					}
				}
		
		}catch(Exception e) {
			e.printStackTrace();
			}
		}
	
		// 게시글 수정 반환 메소드 호출
	   public boardBean getUpdateBoard(int num) throws SQLException{
	      getConnection();
	      
	      boardBean bean = new boardBean();
	      try {
		      String sql ="select * from smartBoard where num = ?";
		      
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setInt(1, num);
		      
		      rs = pstmt.executeQuery();
		      
		      if(rs.next()) {
		         bean.setNum(rs.getInt(1));
		         bean.setWriter(rs.getString(2));
		         bean.setEmail(rs.getString(3));
		         bean.setSubject(rs.getString(4));
		         bean.setPassword(rs.getString(5));
		         bean.setReg_date(rs.getString(6));
		         bean.setRef(rs.getInt(7));
		         bean.setRe_step(rs.getInt(8));
		         bean.setRe_level(rs.getInt(9));
		         bean.setReadcount(rs.getInt(10));
		         bean.setContent(rs.getString(11));
		      	}
		      
		      if(pstmt != null) {
		    	  if(conn != null) {
		    		  pstmt.close();
		    		  conn.commit();
		    		  conn.close();
		    	  	}
		      	}
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         return bean;
	      }
	   
	   //update, delete를 할 때 패스워드 값 반환해주는 메소드 호출
	   public String getPass(int num) throws SQLException {
		   getConnection();
		   
		   String pass = null;
		   
		   try {
			   String sql = "select password from smartBoard where num = ?";
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, num);
			   
			   rs = pstmt.executeQuery();
			   
			   if(rs.next()) {
				   pass = rs.getString(1);
			   }
		   }catch(Exception e) {
		         e.printStackTrace();
		      }

		   return pass;
	   }
	   
	   
	   //
	   public void updateboard(boardBean bean) throws SQLException {
	      getConnection();
	      
	      String sql = "update smartBoard set subject = ?, email = ?, content = ? where num = ?";
	      
	      pstmt=conn.prepareStatement(sql);
	      pstmt.setString(1, bean.getSubject());
	      pstmt.setString(2, bean.getEmail());
	      pstmt.setString(3, bean.getContent());
	      pstmt.setInt(4, bean.getNum());
	      
	      pstmt.executeUpdate();
	      
	      if(pstmt != null) {
	         if (conn != null) {
	            pstmt.close();
	            conn.commit();
	            conn.close();
	         }
	      }
	   }

	   
	public void deleteBoard(int num) throws NamingException, SQLException {
		getConnection();
		
		String sql = "delete from smartboard where num=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.commit();
			conn.close();
	}
	
	//전체 글의 갯수를 반환해주는 메소드
	public int getAllCount() throws SQLException {
		getConnection();
		
		int count = 0;
		
		String sql = "select count(*) from smartBoard"; // ex)124개
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			count = rs.getInt(1);
		}
		
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.commit();
			conn.close();
		
		return count;
	}
}