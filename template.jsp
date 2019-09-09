<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contentPage = request.getParameter("CONTENTPAGE");
%>
<link rel="stylesheet" type="text/css" href="main.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<div id="wapper">
	<header>
		<jsp:include page="top.jsp" flush="false"/>
	</header>
	<section>
		<jsp:include page="<%=contentPage %>" flush="false" />
	</section>
	<footer>
		<jsp:include page="footer.jsp" flush="false"/>
	</footer>
</div>