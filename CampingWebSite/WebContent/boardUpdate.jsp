<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.boardBean" %>
<%@ page import = "model.boardDAO" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 수정 - boardUpdate.jsp</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
		
	boardDAO bdao = new boardDAO();	
	boardBean bean = bdao.getUpdateBoard(num);
%>
	<h2 style="color:#967BDC" align="center">게시판 수정용 게시글 보기 화면</h2>

	<form action = "boardUpdatePro.jsp" method = "post" > 
		<table border="1" width="600" align="center" bgcolor="#e6e6fa">
			<tr height = "50">	
				<th align="center" width = "80">작성자</th>
				<td align="center" width = "100"><%=bean.getWriter() %></td>
				<th align="center" width = "80">작성일자</th>
				<td align="center" width = "100"><%=bean.getReg_date() %></td>
			</tr>
			<tr height = "50">		
				<th align="center" width = "80">제목</th>
				<td align="center" width = "100" colspan="3">
					<input type = "text" name = "subject" size ="60" value="<%=bean.getSubject()%>"/>
				</td>
			</tr>
			<tr height = "50">	
				<th align="center" width = "80">전자우편</th>
				<td align="center" width = "100" colspan="3">
					<input type = "email" name = "email" size ="60" value="<%=bean.getEmail()%>" />
				</td>	
			</tr>
			<tr height = "50">	
				<th align="center" width = "80">비밀번호</th>
				<td align="center" width = "100" colspan="3">
					<input type = "password" name = "password" size ="60" />
				</td>	
			</tr>
			<tr height = "50">
				<th align="center" width = "80">내용</th>
			 	<td align="center" width = "100" colspan="4">
			 		<textarea rows="6" cols="70" name="content"></textarea>
			 	</td>
			</tr>
			<tr height = "50">
				<td align="center" colspan="4">
					<input type = "hidden"  name = "num" value="<%=bean.getNum() %>" />
					<input type = "submit" value ="글 수정하기" />&nbsp;&nbsp;
					<input type= "button" value = "전체글목록보기" onclick = "location.href='boardList.jsp'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>