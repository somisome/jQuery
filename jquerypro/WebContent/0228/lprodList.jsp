<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="kr.or.ddit.lprod.service.LprodServiceImpl"%>
<%@page import="kr.or.ddit.lprod.service.LprodService"%>
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
			"id":"<%=vo.getLprod_id()%>",
			"gu":"<%=vo.getLprod_gu()%>",
			"nm":"<%=vo.getLprod_nm()%>"
		}
<% 
	}
%>

]
