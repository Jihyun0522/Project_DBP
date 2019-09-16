<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pnum = request.getParameter("pnum");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int su = 0;
	int bnum = 0;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "mirim3501";
		String pass = "3501";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "select bnum from buy where pnum = " + pnum;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			bnum = rs.getInt(1);
		}
		
		sql = "delete from buy where bnum = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bnum);
		su = pstmt.executeUpdate();
		
		sql = "delete from plant_admin where pnum = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pnum);
		su = pstmt.executeUpdate();
		
	} catch(Exception e){
		e.printStackTrace();
		su = 0;
	} finally {		
		if(rs != null){
			try{ rs.close(); } catch(Exception e){ }
		}//if
		
		if(pstmt != null){
			try{ pstmt.close(); } catch(Exception e){ }
		}//if
		
		if(conn != null){
			try{ conn.close(); } catch(Exception e){ }
		}//if
		
		if(su == 1){
			out.println("<script>alert('식물삭제가 성공적으로 되었습니다!');");
		} else {
			out.println("<script>alert('식물삭제에 실패하였습니다....');");
		}
		out.println("location.href = ' plant.jsp';</script>");
	}
%>