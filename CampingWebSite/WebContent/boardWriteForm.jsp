<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면 페이지 - boardWriteForm.jsp </title>
</head>
<body>
	<h2 style="color:#967BDC" align="center">♦ 게시판 글 쓰기 화면 ♦</h2>
	<form action="boardWritePro.jsp" method="post">
	 	<table border="1" align="center" width="600" bgcolor="#e6e6fa">
	 		<tr height="50">
	 			<td align="center" width="100">작성자</td>
	 			<td align="center" width="100">
	 				<input type="text" name="writer" size="60" required="required"></td>
	 		</tr>
	 		<tr height="50">
	 			<td align="center" width="100">글제목</td>
	 			<td align="center" width="100">
	 				<input type="text" name="subject" size="60" required="required">
	 			</td>
	 		</tr>
	 		<tr height="50">
	 			<td align="center" width="100">전자우편</td>
	 			<td align="center" width="100">
	 				<input type="email" name="email" size="60" required="required">
	 			</td>
	 		</tr>
	 		<tr height="50">
	 			<td align="center" width="100">비밀번호</td>
	 			<td align="center" width="100">
	 				<input type="password" name="password" size="60" required="required">
	 			</td>
	 		</tr>
	 		<tr height="50">
	 			<td align="center" width="100">글 내용</td>
	 			<td align="center" width="100">
	 				<textarea rows="10" cols="60" name="content" required="required"></textarea>
	 			</td>
	 		</tr>
	 		<tr height="50">
	 			<td align="center" colspan="2">
	 				<input type="submit" value="글 쓰기">&nbsp;&nbsp;
	 				<input type="reset" value="재작성">&nbsp;&nbsp;
	 				<button onclick="location.href='boardList.jsp'">글 목록 보기</button>
	 			</td>
	 		</tr>	 		
	 	</table>	
	</form>
</body>
</html>