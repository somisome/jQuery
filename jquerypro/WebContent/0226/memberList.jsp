<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[    

<% 
	MemberService service = MemberServiceImpl.getInstance();
	List<MemberVO> list = service.getMemberList();
%>

<%	
	
	for(int i=0; i<list.size(); i++){
		MemberVO vo = list.get(i);
		if(i>0)out.print(",");
%>
		{		
			"name":"<%=vo.getMem_name()%>",
			"addr":"<%=vo.getMem_add1()%>",
			"tel" :"<%=vo.getMem_hometel()%>"
		}
<% 
	}
%>


]
