<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="top.css"/>
<style>
</style>
<%
	request.setCharacterEncoding("UTF-8");
	String utype = (String)session.getAttribute("utype");
	String uname = (String)session.getAttribute("uname");
%>
<ul class="top_ul">
	<li class="toplogo"><a href="main.jsp">美山</a></li>
	<li class="topli"><a href="object.jsp">PLANT</a></li>
	<!-- <li class="topli"><a href="*">second</a></li>
	<li class="topli"><a href="*">third</a></li> -->
	<%
		if(utype == null){
	%>
		<li class="topli_right"><a href="login.jsp">LOGIN</a></li>
	<% } else if(utype.equals("member")){ %>
		<li class="topli_right"><a href="logout.jsp">LOGOUT</a></li>
		<li class="topli_right"><a href="membuy.jsp">BUY</a></li>
		<li class="topli_right"><a href="meminfo.jsp">INFO</a></li>
		<li class="topli_right" style="margin-top: 24px;"><%=uname %>님</li>
	<% } else {%>
		<li class="topli_right"><a href="logout.jsp">LOGOUT</a></li>
		<li class="topli_right"><a href="adminbuy.jsp">BUY</a></li>
		<li class="topli_right"><a href="adminadd.jsp">ADD</a></li>
		<li class="topli_right"><a href="admininfo.jsp">INFO</a></li>
		<li class="topli_right" style="margin-top: 24px;"><%=uname %>님</li>
	<% } %>
</ul>