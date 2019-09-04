<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	System.out.println(userid);
	String uname = request.getParameter("uname");
	System.out.println(uname);
	String upassword = request.getParameter("upassword");
	System.out.println(upassword);
	String uaddress = request.getParameter("uaddress");
	String utelnum = request.getParameter("utelnum");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int su = 0;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "mirim3501";
		String pass = "3501";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		DriverManager.getConnection(url, user, pass);
		
		String sql = "select userid from users";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs == null){
			sql = "insert into users values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println("1");
			pstmt.setString(1, userid);
			pstmt.setString(2, uname);
			pstmt.setString(3, upassword);
			pstmt.setString(4, uaddress);
			pstmt.setString(5, utelnum);
			pstmt.setString(6, "member");
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
			out.println("<script>alert('회원가입이 성공적으로 되었습니다!');</script>");
			out.println("<script>location.href = 'login.jsp';</script>");
		} else {
			out.println("<script>alert('회원가입에 실패하였습니다....');</script>");
			out.println("<script>location.href = 'register.jsp';</script>");
		}
	}
%>