<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.prod.service.ProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.ProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

[    

<% 
	String prod_gu=request.getParameter("prod_gu");
	ProdService service = ProdServiceImpl.getInstance();
	List<ProdVO> list = service.getProdList(prod_gu);
%>

<%	
	for(int i=0; i<list.size(); i++){
		ProdVO vo = list.get(i);
		if(i>0)out.print(",");
%>
		{		
			"id":"<%=vo.getProd_id()%>",
			"name":"<%=vo.getProd_name()%>"
		}
<% 
	}
%>

]
