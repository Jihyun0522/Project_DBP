<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String uname = request.getParameter("uname");
	String upassword = request.getParameter("upassword");
	String uaddress = request.getParameter("uaddress");
	String utelnum = request.getParameter("utelnum");
	String type = "member";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int su = 0;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "mirim3501";
		String pass = "3501";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "select * from users where userid = '" + userid + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
			
		if(rs.next() == false){
			sql = "insert into users values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, uname);
			pstmt.setString(3, upassword);
			pstmt.setString(4, uaddress);
			pstmt.setString(5, utelnum);
			pstmt.setString(6, type);
			su = pstmt.executeUpdate();
		}//rs == null
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
			out.println("<script>alert('회원가입이 성공적으로 되었습니다!');");
			out.println("location.href = 'login.jsp';</script>");
		} else {
			out.println("<script>alert('회원가입에 실패하였습니다....');");
			out.println("location.href = 'register.jsp';</script>");
		}
	}
%>