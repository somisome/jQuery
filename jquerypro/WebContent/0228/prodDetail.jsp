<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.prod.service.ProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.ProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<% 
	String prod_id=request.getParameter("prod_id");
	application.log(prod_id+":prodid");
	ProdService service = ProdServiceImpl.getInstance();
	ProdVO vo = service.getProdDetail(prod_id);
%>

{		
	"id":"<%=vo.getProd_id()%>",
	"name":"<%=vo.getProd_name()%>",
	"lgu":"<%=vo.getProd_lgu()%>",
	"buyer":"<%=vo.getProd_buyer()%>",
	"cost":"<%=vo.getProd_cost()%>",
	"price":"<%=vo.getProd_price()%>",
	"sale":"<%=vo.getProd_sale()%>",
	"outline":"<%=vo.getProd_outline()%>",
	"detail":"<%=vo.getProd_detail()%>",
	"img":"<%=vo.getProd_img()%>",
	"totalstock":"<%=vo.getProd_totalstock()%>",
	"insdate":"<%=vo.getProd_insdate()%>",
	"properstock":"<%=vo.getProd_properstock()%>",
	"size":"<%=vo.getProd_size()%>",
	"color":"<%=vo.getProd_color()%>",
	"delivery":"<%=vo.getProd_delivery()%>",
	"unit":"<%=vo.getProd_unit()%>",
	"qtyin":"<%=vo.getProd_qtyin()%>",
	"qtysale":"<%=vo.getProd_qtysale()%>",
	"mileage":"<%=vo.getProd_mileage()%>"
}		

