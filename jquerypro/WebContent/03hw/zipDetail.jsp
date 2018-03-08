<%@page import="kr.or.ddit.vo.ZipVO"%>
<%@page import="kr.or.ddit.zip.service.ZipServiceImpl"%>
<%@page import="kr.or.ddit.zip.service.ZipService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 [   
<%
	String zipDetail = request.getParameter("zipCode");
	ZipService service = ZipServiceImpl.getInstance();
	
	List<ZipVO> list = service.zipDetail(zipDetail);
	
	for(int i=0; i<list.size(); i++){
		ZipVO vo = list.get(i);
		String bunji = vo.getBunji(); 
		if(bunji==null) bunji="";
		
		
		if(i>0) out.print(",");
%>
		{
			"zipcode" : "<%=vo.getZipcode() %>",
			"addr" : "<%=vo.getSido() %>  <%=vo.getGugun() %>  <%=vo.getDong() %>  <%=vo.getBunji() %>",
			"bunji" : "<%=bunji %>"
		}
<%		
	}
%>
]