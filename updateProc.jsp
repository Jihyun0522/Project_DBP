<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	String pname = request.getParameter("pname");
	int pPrice = Integer.parseInt(request.getParameter("pPrice"));
	int pamount = Integer.parseInt(request.getParameter("pamount"));
	int psum = Integer.parseInt(request.getParameter("psum"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int su = 0;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "mirim3501";
		String pass = "3501";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "update plant_admin set pname = ?, pPrice = ?, pamount = ?, psum = ? where pnum = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setInt(2, pPrice);
		pstmt.setInt(3, pamount);
		if (psum > 0) pstmt.setInt(4, psum);
		else pstmt.setInt(4, pPrice * pamount);
		pstmt.setInt(5, pnum);
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
			out.println("<script>alert('수정이 성공적으로 되었습니다!');");
		} else {
			out.println("<script>alert('수정에 실패하였습니다....');");
		}
		out.println("location.href = 'plant.jsp';</script>");
	}
%>