<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 쓰기 화면 구현 페이지</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
%>

	<h2 style="color:#967BDC" align="center">게시판 댓글 쓰기 화면</h2>
	<form action="boardReWritePro.jsp" method="post">
	
		<table border="1" align="center" width="600" bgcolor="#e6e6fa">
			<tr height="50">
				<td align="center" width="100">작성자</td>
				<td align="center" width="450">
					<input type="text" name="writer" size="60"></td>			
			</tr>
			<tr height="50">
				<td align="center" width="100">제목</td>
				<td align="center" width="450">
					<input type="text" name="subject" value="[답변]" size="60"></td>			
			</tr>
			<tr height="50">
				<td align="center" width="100">전자우편</td>
				<td align="center" width="450">
					<input type="email" name="email" size="60"></td>			
			</tr>
			<tr height="50">
				<td align="center" width="100">비밀번호</td>
				<td align="center" width="450">
					<input type="password" name="password" size="60"></td>			
			</tr>
			<tr height="50">
				<td align="center" width="100">글 내용</td>
				<td align="center" width="450">
					<textarea rows="10" cols="60" name="content"></textarea></td>			
			</tr>
			
			<!-- button 만들기 -->
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="ref" value="<%=ref %>">
					<input type="hidden" name="re_step" value="<%=re_step %>">
					<input type="hidden" name="re_level" value="<%=re_level %>">
					<input type="submit" value="답변글쓰기">
					<input type="reset" value="답변글취소">
					<input type="button" value="전체글목록보기" onclick="location.href='boardList.jsp'">
			</tr>
		</table>
	</form>
</body>
</html>