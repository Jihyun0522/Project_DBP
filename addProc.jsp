<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pname = request.getParameter("pname");
	int pPrice = Integer.parseInt(request.getParameter("pPrice"));
	int pamount = Integer.parseInt(request.getParameter("pamount"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int su = 0;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "mirim3501";
		String pass = "3501";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "insert INTO PLANT_ADMIN (PNAME, PPRICE, PAMOUNT, PSUM) VALUES (?, ?, ?, num_sump(?, ?))";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setInt(2, pPrice);
		pstmt.setInt(3, pamount);
		pstmt.setInt(4, pPrice);
		pstmt.setInt(5, pamount);
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
			out.println("<script>alert('추가가 성공적으로 되었습니다!');");
		} else {
			out.println("<script>alert('추가에 실패하였습니다....');");
		}
		out.println("location.href = 'plant.jsp';</script>");
	}
%>