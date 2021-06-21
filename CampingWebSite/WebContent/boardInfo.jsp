<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.boardDAO" %>
<%@ page import = "model.boardBean" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 처리</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
 
	boardDAO bdao = new boardDAO();
	boardBean bean = bdao.getOneBoard(num);
%>

<h2 style="color:#967BDC" align="center">게시판 글 상세 보기 화면</h2>
	<table border="1" align="center" width="600" bgcolor="#e6e6fa">
		<tr height="50">
			<td align="center" width="120">번호</td>
			<td align="center" width="180"><%=bean.getNum() %></td>
			<td align="center" width="120">조회수</td>		
			<td align="center" width="180"><%=bean.getReadcount() %></td>
		</tr>
			<tr height="50">
			<td align="center" width="120">작성자</td>
			<td align="center" width="180"><%=bean.getWriter() %></td>
			<td align="center" width="120">작성일자</td>		
			<td align="center" width="180"><%=bean.getReg_date() %></td>
		</tr>
			<tr height="50">
			<td align="center" width="120">전자우편</td>
			<td align="center" width="180"><%=bean.getEmail() %></td>
			<td align="center" width="120">제목</td>		
			<td align="center" width="180"><%=bean.getSubject() %></td>
		</tr>
		</tr>
			<tr height="50">
			<td align="center" width="120">내용</td>
			<td align="center" colspan="3"><%=bean.getContent() %></td>
		</tr>
		
		<!-- button 만들기 -->
		<tr height="50">
			<td align="center" colspan="4">
				<input type="button" value="댓글쓰기" onclick="location.href='boardReWriteForm.jsp?num=<%=bean.getNum() %>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">
				<input type="button" value="수정하기" onclick="location.href='boardUpdate.jsp?num=<%=bean.getNum() %>'">
				<input type="button" value="삭제하기" onclick="location.href='boardDelete.jsp?num=<%=bean.getNum() %>'">
				<input type="button" value="목록보기" onclick="location.href='boardList.jsp'">
		</tr>
	</table>

</body>
</html>