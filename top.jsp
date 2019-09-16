<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="top.css"/>
<style>
</style>
<%
	request.setCharacterEncoding("UTF-8");
	String utype = (String)session.getAttribute("utype");
	String uname = (String)session.getAttribute("uname");
	System.out.println(utype);
	String type = "member";
%>
<ul class="top_ul">
	<li class="toplogo"><a href="main.jsp">美山</a></li>
	<li class="topli"><a href="object.jsp">PRODUCT</a></li>
	<!-- <li class="topli"><a href="*">second</a></li>
	<li class="topli"><a href="*">third</a></li> -->
	<%
		if(utype == null){
	%>
		<li class="topli_right"><a href="login.jsp">LOGIN</a></li>
	<% } else if(utype.equalsIgnoreCase("member")){ %>
		<li class="topli_right"><a href="logout.jsp">LOGOUT</a></li>
		<li class="topli_right"><a href="buyM.jsp">BUY</a></li>
		<li class="topli_right"><a href="infoM.jsp">INFO</a></li>
		<li class="topli_right" style="margin-top: 24px;"><%=uname %>님</li>
	<% } else {%>
		<li class="topli_right"><a href="logout.jsp">LOGOUT</a></li>
		<li class="topli_right"><a href="buyA.jsp">BUY</a></li>
		<li class="topli_right"><a href="plant.jsp">PLANT</a></li>
		<li class="topli_right"><a href="infoA.jsp">INFO</a></li>
		<li class="topli_right" style="margin-top: 24px;"><%=uname %>님</li>
	<% } %>
</ul>