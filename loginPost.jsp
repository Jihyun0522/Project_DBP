<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String upassword = request.getParameter("upassword");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int su = 0;
	String str = "로그인에 실패했습니다..";
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "mirim3501";
		String pass = "3501";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "select * from users where userid = '" + userid + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String rPasswd = rs.getString("upassword");
			
			if(rPasswd.equals(upassword)){
				session.setAttribute("userid", userid);
				session.setAttribute("upassword", upassword);
				su = 1;
			}else {
				str = "비밀번호를 확인해주세요.";
			}
		}else {
			str = "아이디가 존재하지 않습니다.";
		}
	} catch (Exception e) {
		e.printStackTrace();
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
			out.println("<script>alert('로그인 되었습니다!');");
			out.println("location.href = 'main.jsp';</script>");
		} else {
			out.println("<script>alert('" + str + "');");
			out.println("location.href = 'login.jsp';</script>");
		}
	}
%>