<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	//여기는 DB처리 하고(select,insert,delete,update) 응답메세지(결과)를 생성
	//응답메세지는 json배열로 한다
%>
<%--예 _ 여기에서는 member테이블에서 김은대를 select하고 정보를 json형식으로 생성해야 함
	"name":"<%=name%>"
--%>

[
	{
		"name":"김은대",
		"addr":"대전",
		"tel":"010-123-1234"
	},
	
	{
		"name":"미역은대",
		"addr":"대전",
		"tel":"010-222-1234"
	},
	
	{
		"name":"김금대",
		"addr":"충남",
		"tel":"010-111-1234"
	}

]
