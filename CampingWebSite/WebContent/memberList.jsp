<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="model.memberDAO"%>
<%@ page import ="model.memberBean"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 목록 보기</title>
</head>

<%

   // 데이터 베이스에서 모든 회원 정보를 가져오기
   memberDAO mdao = new memberDAO(); // 객체 생성
   
   // 가변길이 자료 구조인 벡터를 사용합니다.
   Vector<memberBean> vec = mdao.allSelectMember();

%>

<body>

	<h2 align="center">회원 정보 보기</h2>

	<table border="1" width="950" align="center">
      
      <tr height = "50">
         <th align="center" width = "100">아이디</th>
         <th align="center" width = "120">이메일</th>
         <th align="center" width = "120">전화번호</th>
         <th align="center" width = "270">취미</th>
         <th align="center" width = "110">직업</th>
         <th align="center" width = "100">연령</th>
         <th align="center" width = "130">하고 싶은 말</th>
      </tr>
      
      
      <%
         for(int i =0; i < vec.size(); i++){
			memberBean mBean = vec.get(i);      
      
      %>
      
      
	<tr height = "50">   
        <td align="center" width = "120">
        	<a href="memberInfo.jsp?id=<%=mBean.getId()%>"><%=mBean.getId()%></a>
        </td>
        <td align="center" width = "120"><%=mBean.getEmail() %></td>
        <td align="center" width = "120"><%=mBean.getTel() %></td>
        <td align="center" width = "120"><%=mBean.getHobby() %></td>
        <td align="center" width = "120"><%=mBean.getJob() %></td>
        <td align="center" width = "120"><%=mBean.getAge() %></td>
        <td align="center" width = "120"><%=mBean.getInfo() %></td>
	</tr>   
      
      <%
         }
      %>
   </table>
   
   <br>
   
   <form action="memberJoin.jsp" method="post" align="center">
		<input type="submit" value="회원가입">
   </form>
   
</body>
</html>