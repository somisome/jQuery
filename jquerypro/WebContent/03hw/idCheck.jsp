<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String inputId = request.getParameter("id");

	MemberService service = MemberServiceImpl.getInstance();
	
	MemberVO vo = service.idCheck(inputId);
	
	//입력한 id가 DB에서 select되었다면 이미 DB에 저장되어 있는 id이다.
	//입력한 id를 검색되지 못했다면 사용가능한 id가 된다.
	if(vo==null){
		//db에 없는 경우
%>
	{
		"flag" : "OK"
	}
<%-- 	<%=inputId%>는 사용 가능한 id입니다. --%>

<%	} else {
	//db에 이미 저장되어 있는 경우
%>
<%-- 	<%=inputId%>는 사용 불가능한 id입니다. --%>
	{
		"flag" : "NOT"
	}
<%
	}
%>