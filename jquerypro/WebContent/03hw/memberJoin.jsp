<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.MemberService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
// 	String id = request.getParameter("mem_id");
// 	String name = request.getParameter("mem_name");
// 	String pass = request.getParameter("mem_pass");
// 	String mail = request.getParameter("mem_mail");
// 	String add1= request.getParameter("mem_add1");
// 	String add2= request.getParameter("mem_add2");
// 	String hp= request.getParameter("mem_hp");
// 	String zip= request.getParameter("mem_zip");
	
	MemberVO vo = new MemberVO();
// 	vo.setMem_id(id);
// 	vo.setMem_name(name);
// 	vo.setMem_pass(pass);
// 	vo.setMem_mail(mail);
// 	vo.setMem_add1(add1);
// 	vo.setMem_add2(add2);
// 	vo.setMem_hp(hp);
// 	vo.setMem_zip(zip);
	
	BeanUtils.populate(vo, request.getParameterMap());
	
	MemberService service = MemberServiceImpl.getInstance();
	
	String name = service.insertMember(vo);
	
	if(name!=null){
%>		
		{
			"flag" : "OK",
			"name" : "<%=vo.getMem_name() %>"
		} 
<%		
	} else {
%>		
		{
			"flag" : "NO",
			"name" : "<%=vo.getMem_name() %>"
		}
<%		
	}
%>