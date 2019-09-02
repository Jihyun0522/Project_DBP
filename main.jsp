<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>식물</title>
<%
	request.setCharacterEncoding("utf-8");
	String contentPage = request.getParameter("CONTENTPAGE");
%>
<link rel="stylesheet" type="text/css" href="main.css"/>
<body>
	<div id="wapper">
		<header>
			<jsp:include page="top.jsp" flush="false"/>
		</header>
		<section>
			<div class="content">
				
			</div>
		</section>
		<footer>
			<jsp:include page="footer.jsp" flush="false"/>
		</footer>
	</div>
</body>