<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contentPage = request.getParameter("CONTENTPAGE");
%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
/* section {
	position: relative;
	height: auto;
}

.content {
	position: absolute;
	top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
} */
#wapper {
	min-height: 100%;
}
</style>
<div id="wapper">
	<header>
		<jsp:include page="top.jsp" flush="false"/>
	</header>
	<section>
		<div class="content">
			<jsp:include page="<%=contentPage %>" flush="false" />
		</div>
	</section>
	<footer>
	</footer>
</div>