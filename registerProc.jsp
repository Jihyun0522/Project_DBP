<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "mirim3501";
		String pass = "3501";
		int su;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		DriverManager.getConnection(url, user, pass);
		out.println("연결성공");
	} catch(Exception e){
		out.println("연결실패");
	}
%>