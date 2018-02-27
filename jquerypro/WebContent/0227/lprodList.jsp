<%@page import="kr.or.ddit.lprod.service.LprodServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.lprod.service.LprodService"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[    

<% 
	LprodService service = LprodServiceImpl.getInstance();
	List<LprodVO> list = service.getLprodList();
%>

<%	
	for(int i=0; i<list.size(); i++){
		LprodVO vo = list.get(i);
		if(i>0)out.print(",");
%>
		{		
			"gu":"<%=vo.getLprod_id()%>",
			"id":"<%=vo.getLprod_gu()%>",
			"nm":"<%=vo.getLprod_nm()%>"
		}
<% 
	}
%>

]
