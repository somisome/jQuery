<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int res = (Integer) request.getAttribute("result");	
	
	if(res>0){
		//성공
%>
		{ "flag" : "삭제성공" }
<%		
	}else{
		//실패
%>
		{ "flag" : "삭제실패" }
<%		
	}
%>
