<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq = (Integer)request.getAttribute("seq");
	if(seq>0){ //저장성공
%>
	 { "flag" : "저장성공" }

<%
	}else{ //저장실패
%>
	 { "flag" : "저장실패" }

<%
	}
%>