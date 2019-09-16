<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("num"));
	int bamount = Integer.parseInt(request.getParameter("amount"));
	int pPrice = Integer.parseInt(request.getParameter("price"));
	String userid = (String)session.getAttribute("userid");
	String utype = (String)session.getAttribute("utype");
	
	if(userid != null){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int su = 0;
		
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			String user = "mirim3501";
			String pass = "3501";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			
			String sql = "update plant_admin set pamount = pamount - ?, psum = psum - ? * ? where pnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bamount);
			pstmt.setInt(2, pPrice);
			pstmt.setInt(3, bamount);
			pstmt.setInt(4, pnum);
			su = pstmt.executeUpdate();
			
			sql = "insert into buy (userid, Pnum, Pprice, Bamount, BSUM) values (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, pnum);
			pstmt.setInt(3, pPrice);
			pstmt.setInt(4, bamount);
			pstmt.setInt(5, pPrice * bamount);
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
				out.println("<script>alert('구매 되었습니다! 구매목록 페이지로 넘어갑니다.');");
				if(utype.equals("member")) out.println("location.href = 'buyM.jsp';</script>");
				else out.println("location.href = 'buyA.jsp';</script>");
			} else {
				out.println("<script>alert('구매에 실패하였습니다....');");
				out.println("location.href = 'object.jsp';</script>");
			}
		}
	} else {
		out.println("<script>alert('로그인 되지 않았습니다.....');");
		out.println("location.href = 'login.jsp';</script>");
	}
%>