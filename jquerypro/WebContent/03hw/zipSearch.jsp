<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%
	request.setCharacterEncoding("UTF-8");
	String	dongValue = request.getParameter("dong");

	MemberService service = MemberServiceImpl.getInstance();
	
	List<ZipVO> list = service.zipSearch(dongValue);

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