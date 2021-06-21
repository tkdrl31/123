<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.memberDAO" %>    
<%@ page import = "model.memberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지 - memberUpdate.jsp </title>
</head>
<body>
<%
	String id = request.getParameter("id");//hyun2

	//데이터 베이스에서 모든 회원 정보를 가져오기
	memberDAO mdao = new memberDAO();
	
	//가변길이 자료구조인 벡터를 사용합니다.
	memberBean mBean = mdao.oneSelectMember(id);//hyun2
%>
	<h2 align="center">회원 정보 상세 보기 수정 화면 페이지</h2>
	<form action="memberUpdatePro.jsp" method="post">
		<table border="1" width="500" align="center">
			<tr height="30">
				<td align="center" width="50">아이디</td>
				<td align="center" width="100"><%=mBean.getId() %></td>
			</tr>
			<tr height="30">
				<td align="center" width="50">이메일</td>
				<td align="center" width="100">
					<input type="text" name="email" value="<%=mBean.getEmail() %>">
				</td>         
			</tr>   
			<tr height="30">   
				<td align="center" width="50">전화번호</td>
				<td align="center" width="100">
					<input type="text" name="tel" value="<%=mBean.getTel() %>">
				</td>
			</tr>
			<tr height="30">   
				<td align="center" width="50">하고싶은말</td>
				<td align="center" width="100">
					<textarea rows="7" cols="60" name="info"></textarea>
				</td>   
			</tr>
			<tr height="30">   	
				<td align="center" width="50">패스워드</td>
				<td align="center" width="100">
					<input type="password" name="pass1">
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
		      		<input type="hidden" name="id" value="<%=mBean.getId()%>">
		      		<input type="submit" value="회원정보 수정">&nbsp;&nbsp;
		      		<input type="button" value="회원 목록 보기" onclick="location.href='memberList.jsp'">&nbsp;&nbsp;
				</td>
			</tr>
		</table>  
	</form> 
</body>
</html>