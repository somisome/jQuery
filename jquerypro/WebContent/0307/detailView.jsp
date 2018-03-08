<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");

%>

{
	"seq" : "<%= vo.getSeq() %>",
	"writer" : "<%= vo.getWriter() %>",
	"subject":"<%=vo.getSubject() %>",
	"mail":"<%=vo.getMail() %>",
	"content":"<%=vo.getContent() %>"

}