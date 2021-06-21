<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "model.memberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 저장 및 보기</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String hobby[] = request.getParameterValues("hobby");
	String texthobby = "";
	
	for(int i=0; i<hobby.length; i++) {
		texthobby += hobby[i] + " ";
	}
	
%>
	<jsp:useBean id="mBean" class="model.memberBean">
		<jsp:setProperty name="mBean" property="*"/>
	</jsp:useBean>
<%	
	
	mBean.setHobby(texthobby); 
	
	//데이터베이스 클래스에 대한 객체 생성
	memberDAO mdao = new memberDAO();
	mdao.insertMember(mBean);
	
	//회원정보 목록 페이지로 이동
	response.sendRedirect("memberList.jsp");
	
/* 
	String id = "kayeon";
	String pass = "1234";
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try { 
		Class.forName(driver);
		
		conn = DriverManager.getConnection(url, id, pass);
		
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
		
		pstmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
*/	

%>
	<!-- 
		mBean 객체는 데이터를 저장하거나 불러옵니다.
		
		위의 명령 문장으로 데이터가 저장됩니다. 
	
	
	<table border="1" align="center" width="500">
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td align="center" width="350"><%=mBean.getId()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">패스워드1</td>
		 	<td align="center" width="350"><%=mBean.getPass1()%></td>
		 </tr>
		 <tr height="50">
			<td align="center" width="150">패스워드2</td>
			<td align="center" width="350"><%=mBean.getPass2()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">전자우편</td>
			<td align="center" width="350"><%=mBean.getEmail()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">전화번호</td>
			<td align="center" width="350"><%=mBean.getTel()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">관심분야</td> 
			<td align="center" width="350"><%=mBean.getHobby() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">직업</td>
			<td align="center" width="350"><%=mBean.getJob()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">연령대</td>
			<td align="center" width="350"><%=mBean.getAge()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">하고 싶은 말</td>
			<td align="center" width="350"><%=mBean.getInfo()%></td>
		</tr>
	</table>
	-->
	
</body>
</html>