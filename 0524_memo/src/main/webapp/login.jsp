<%@page import="mybatis.vo.MemVO"%>
<%@page import="mybatis.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //사용자가 입력한 아이디와 비밀번호를 파라미터를 받는다.
   String s_id = request.getParameter("u_id");
   String s_pw = request.getParameter("u_pw");
   
   HashMap<String, String> map = new HashMap<>();
   map.put("mid", s_id);
   map.put("mpw", s_pw);
   
   //팩토리를 통해 SqlSession 얻기
   SqlSession ss = FactoryService.getFactory().openSession();
   
   //SqlSession을 통해 원하는 매퍼를 호출한다,
   MemVO mvo = ss.selectOne("member.login", map);
   //아이디와 비밀번호가 틀리면 mvo는 null을 가진다.
   
   //index.jsp로 돌아갈 때 현재 로그인 상태를  mode라는 변수로 판단하기로 했다.
   int mode = 0;
   
   if(mvo != null){
      //세션에 mvo 저장
      session.setAttribute("mvo", mvo);
      mode = 1;
   }
   
   //바로 index.jsp로 이동
   response.sendRedirect("index.jsp?mode="+mode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>