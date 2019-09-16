<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = (String)session.getAttribute("userid");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int su = 0;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "mirim3501";
		String pass = "3501";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "delete from users where userid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
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
			session.invalidate();
			out.println("<script>alert('회원탈퇴가 성공적으로 되었습니다!');");
			out.println("location.href = 'main.jsp';</script>");
		} else {
			out.println("<script>alert('회원탈퇴에 실패하였습니다....');");
			out.println("location.href = 'infoM.jsp';</script>");
		}
	}
%>