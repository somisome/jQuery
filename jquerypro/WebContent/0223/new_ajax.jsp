<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String age=request.getParameter("age");
%>
{"<%=name %>님의 나이는 <%=age %>입니다."}
