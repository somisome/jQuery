<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="kr.or.ddit.buyer.service.BuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.BuyerService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 

<% 
	String buyer_id = request.getParameter("buyer_id");
	BuyerService service = BuyerServiceImpl.getInstance();
	BuyerVO buyer = service.getBuyer(buyer_id);
%>

	{		
		"id":"<%=buyer.getBuyer_id()%>",
		"name":"<%=buyer.getBuyer_name()%>",
		"lgu":"<%=buyer.getBuyer_lgu()%>",
		"bank":"<%=buyer.getBuyer_bank()%>",
		"bankno":"<%=buyer.getBuyer_bankno()%>",
		"bankname":"<%=buyer.getBuyer_bankname()%>",
		"zip":"<%=buyer.getBuyer_zip()%>",
		"add1":"<%=buyer.getBuyer_add1()%>",
		"add2":"<%=buyer.getBuyer_add2()%>",
		"comtel":"<%=buyer.getBuyer_comtel()%>",
		"fax":"<%=buyer.getBuyer_fax()%>",
		"mail":"<%=buyer.getBuyer_mail()%>",
		"charger":"<%=buyer.getBuyer_charger()%>",
		"telext":"<%=buyer.getBuyer_telext()%>"
	}


