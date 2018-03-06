<%@page import="kr.or.ddit.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[

<%
	request.setCharacterEncoding("UTF-8");
	String dong=request.getParameter("dong");
	MemberService service = MemberServiceImpl.getInstance();
	List<ZipVO> list = service.zipSearch(dong);
%>

<%
	for(int i=0; i<list.size();i++){
		ZipVO zip = list.get(i);
		if(i>0) out.print(",");
		String bunji = zip.getBunji();
		if(bunji==null){ bunji="";}
		
%>
		{
			"addr":"<%=zip.getSido() %> <%=zip.getGugun() %> <%=zip.getDong() %>" ,
			"bunji" : "<%=bunji %>",
			"zipcode":"<%=zip.getZipcode() %>"
		}	

	<%}%>
	
]