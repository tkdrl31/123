<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.boardDAO" %>
<%@ page import = "model.boardBean" %>  
<%@ page import = "java.util.Vector" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 보기 화면 구현 페이지 - boardList.jsp</title>
</head>
<body>
<%
	/* ----------게시글 보기 카운터링을 설정하는 변수 선언--------*/
	
	//한 페이지당 글의 숫자 
	int pageSize = 10;
	
	//현재 카운터를 클릭한 번호 값을 읽어옵니다.
	String pageNum = request.getParameter("pageNum");
	
	//만약에 처음으로 boardList.jsp를 클릭하거나, 수정이나 삭제 등 다른 페이지에서
	//넘어온다면 pageNum의 값이 없기 때문에 , 1로 처리를 해줍니다.
	if(pageNum == null) {
		pageNum = "1";
	}

	int count = 0; //전체글의 갯수를 저장하는 용도의 변수
	int number = 0; //페이지 넘버링 용도의 변수
	
	//현재 페이지 저장
	int currentPage = Integer.parseInt(pageNum);
	
	boardDAO bdao = new boardDAO();
	count = bdao.getAllCount();
	
	//현재 페이지에 보여줄 시작 번호를 설정 = 데이터베이스에서 불러올 시작번호
	int startRow = (currentPage - 1) * pageSize + 1; //1
	int endRow = currentPage * pageSize; // 1 * 10 = 10
	
	//최신글 10개를 기준으로 게시글을 반환해주는 메소드 호출
	Vector<boardBean> vec= bdao.getAllBoard(startRow, endRow);
	
	//테이블에 표시할 번호를 지정
	number = count - (currentPage - 1) * pageSize;
	
%>
	<h2 style="color:#967BDC" align="center">게시판 글 목록 보기 화면</h2>
	<table border="1" align="center" width="600" bgcolor="#e6e6fa">
		<tr height="50"> 
			<td align="center" width="50">번호</td>
			<td align="center" width="250">제목</td>
			<td align="center" width="100">글쓴이</td>			
			<td align="center" width="130">작성일</td>
			<td align="center" width="70">조회수</td>		
		</tr>
		<%
			for(int i=0; i < vec.size(); i++){
				boardBean bean = vec.get(i);
					
		%>
		<tr height="50">
			<td align="center" width="50"><%=number--%></td>
			<td align="left" width="250">
				<a href="boardInfo.jsp?num=<%=bean.getNum() %>" style="text-decoration: none">
				<!-- 답변글 들여쓰기 적용 -->
				<%
					if(bean.getRe_step() > 1){
						for(int j=0; j < (bean.getRe_step() - 1) * 3; j++){
				%>&nbsp;
				<%		
						}
					}				
				%>				
				
				<%=bean.getSubject() %></a></td>	
			<td align="center" width="100"><%=bean.getWriter() %></td>					
			<td align="center" width="150"><%=bean.getReg_date() %></td>
			<td align="center" width="50"><%=bean.getReadcount() %></td>		
		</tr>
		<%
			}
		%>	
		<tr height="50">
			<td align="center" colspan="5">
				<input type="button" value="글 쓰기" onclick="location.href='boardWriteForm.jsp'">
			</td>
		</tr>
	</table>
	<p>
	<!-- 페이지 카운터링 작성 부분 -->
	<%
		if(count > 0) {
			//카운터링 숫자를 얼마까지 보여줄 것인지를 결정하는 부분
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			
			int startPage = 1; //시작 페이지
			
			//시작 페이지의 숫자를 설정하는 부분
			if(currentPage % 10 != 0) {
				startPage = (currentPage / 10) * 10 + 1;
			} else {
				startPage = (currentPage / 10) * 10 - 9;
			}
			
			int pageBlock = 10; //카운터링 숫자 10개씩 처리
			
			//화면에 보여지는 페이지의 마지막 숫자 구하기
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount)
				endPage = pageCount;
			
			if(startPage > 10) {
	%>
				<center><a href="boardList.jsp?pageNum=<%=startPage - 10%>">[이전]</a></center>
	<%
			}
			
			for(int i = startPage; i <= endPage; i++) {
	%>
				<left><a href="boardList.jsp?pageNum=<%=i%>">[<%=i%>]</a></left>
	<%		
			}
			
			if(endPage > pageCount) {
	%>
				<center><a href="boardList.jsp?pageNum=<%=startPage + 10%>">[다음]</a></center>
	<%
			}
			
		}
	
	%>
</body>
</html>