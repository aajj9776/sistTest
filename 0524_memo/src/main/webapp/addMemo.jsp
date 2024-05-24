<%@page import="mybatis.vo.MemoVO"%>
<%@page import="mybatis.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String ip = request.getParameter("ip");
	
	Map<String, String> map = new HashMap<>();
	map.put("writer", writer);
	map.put("content", content);
	map.put("ip", ip);
	
	SqlSession ss = FactoryService.getFactory().openSession();
	
	int memo = ss.insert("memo.memoInsert", map);
	
	if( memo > 0){
		ss.commit();
		response.sendRedirect("memoList.jsp");
	} else {
		ss.rollback();
%>
	<h1>저장안됨</h1>
<%
	response.sendRedirect("memoList.jsp");

	}

%>

</body>
</html>