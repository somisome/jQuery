<%@page import="kr.or.ddit.vo.ZipVO"%>
<%@page import="kr.or.ddit.zip.service.ZipService"%>
<%@page import="kr.or.ddit.zip.service.ZipServiceImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
[
<%
	ZipService service = ZipServiceImpl.getInstance();

	List<ZipVO> list = service.zipSido();
	
	for(int i=0; i<list.size(); i++){
		ZipVO vo = list.get(i);
		if(i>0) out.println(",");
%>		
		{
			"SIDO":"<%=vo.getSido()%>"
		}
<%		
	}
%>
]

