<%@page import="kr.or.ddit.vo.ZipVO"%>
<%@page import="kr.or.ddit.zip.service.ZipService"%>
<%@page import="kr.or.ddit.zip.service.ZipServiceImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%
	ZipService service = ZipServiceImpl.getInstance();
	
	String dong = request.getParameter("gu");
	
	List<ZipVO> zipList = service.zipDong(dong);
	
	for(int i=0; i<zipList.size(); i++){
		ZipVO vo = zipList.get(i);
		if(i>0) out.println(",");
%>

		{
			"dong":"<%=vo.getDong()%>"
		}
<%
		
	}
%>
]