<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String inputid=request.getParameter("id");
	MemberService service = MemberServiceImpl.getInstance();
	MemberVO vo = service.idCheck(inputid);
	
	//입력한 id가 db에서 select되었다면 이미 db에 저장되어있는 id이다. - 사용불가능한 id
	//입력한 id를 검색하지못했다면 사용가능한 id가 된다.
	if(vo==null){
		//db에 없는 경우
	%>
	{ "flag":"ok"}	
<%-- 	<%=inputid %>는 사용가능한 id입니다.	 --%>
		
	<%
	}else{
		//db에 이미 저장되어 있는 경우
	%>
	{ "flag":"no"}	
	
<%-- 	<%=inputid %>는 사용할 수 없는 id입니다.	 --%>
		
	<%
		
	}
%>