<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	//여기는 DB처리 하고(select,insert,delete,update) 응답메세지(결과)를 생성
	//응답메세지는 json배열로 한다
%>
<%--예 _ 여기에서는 member테이블에서 김은대를 select하고 정보를 json형식으로 생성해야 함
	"name":"<%=name%>"
--%>
<% 
	String name ="김은대";
	String addr = "대전";
	String tel = "010-1111-2345";
%>

{
	"name":"<%=name%>",
	"addr":"<%=addr%>",
	"tel":"<%=tel%>"
}