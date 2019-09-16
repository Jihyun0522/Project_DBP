<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = (String)session.getAttribute("userid");
	String uname = request.getParameter("uname");
	String upassword = request.getParameter("upassword");
	String uaddress = request.getParameter("uaddress");
	String utelnum = request.getParameter("utelnum");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int su = 0;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "mirim3501";
		String pass = "3501";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "update users set uname = ?, upassword = ?, uaddress = ?, utelnum = ? where userid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uname);
		pstmt.setString(2, upassword);
		pstmt.setString(3, uaddress);
		pstmt.setString(4, utelnum);
		pstmt.setString(5, userid);
		su = pstmt.executeUpdate();
		
	} catch(Exception e){
		e.printStackTrace();
		su = 0;
	} finally {		
		if(pstmt != null){
			try{ pstmt.close(); } catch(Exception e){ }
		}//if
		
		if(conn != null){
			try{ conn.close(); } catch(Exception e){ }
		}//if
		
		if(su == 1){
			out.println("<script>alert('회원정보 수정이 성공적으로 되었습니다!');");
		} else {
			out.println("<script>alert('회원정보 수정에 실패하였습니다....');");
		}
		out.println("location.href = 'infoM.jsp';</script>");
	}
%>