<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.memberDAO" %>    
<%@ page import = "model.memberBean" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo.jsp - 상세보기 페이지</title>
</head>
<body>
<%
   String id = request.getParameter("id");//hyun2

   //데이터 베이스에서 모든 회원 정보를 가져오기
      memberDAO mdao = new memberDAO();

   //가변길이 자료구조인 벡터를 사용합니다.
   memberBean mBean = mdao.oneSelectMember(id);//hyun2
%>
   <h2 align="center">회원 정보 상세 보기</h2>
   <table border="1" width="500" align="center">
      <tr height="30">
         <td align="center" width="50">아이디</td>
         <td align="center" width="100"><%=mBean.getId() %></td>
      </tr>
      <tr height="30">
         <td align="center" width="50">이메일</td>
         <td align="center" width="100"><%=mBean.getEmail() %></td>         
      </tr>   
      <tr height="30">   
         <td align="center" width="50">전화번호</td>
         <td align="center" width="100"><%=mBean.getTel() %></td>
      </tr>
      <tr height="30">   
         <td align="center" width="50">취미</td>
         <td align="center" width="100"><%=mBean.getHobby() %></td>
      </tr>
      <tr height="30">   
         <td align="center" width="50">직업</td>
         <td align="center" width="100"><%=mBean.getJob() %></td>
      </tr>
      <tr height="30">   
         <td align="center" width="50">연령</td>
         <td align="center" width="100"><%=mBean.getAge() %></td>
      </tr>
      <tr height="30">   
         <td align="center" width="50">하고싶은말</td>
         <td align="center" width="100"><%=mBean.getInfo() %></td>   
      </tr>
      <tr>
      	<td align="center" colspan="2">
      		<button onclick="location.href='memberUpdate.jsp?id=<%=mBean.getId()%>'">수정</button>&nbsp;&nbsp;
      		<button onclick="location.href='memberDelete.jsp?id=<%=mBean.getId()%>'">삭제</button>&nbsp;&nbsp;
      		<button onclick="location.href='memberList.jsp?'">목록보기</button>&nbsp;&nbsp;
      		<button onclick="location.href='memberJoin.jsp'">회원가입</button>
      	</td>
      </tr>
   </table>   
</body>
</html>