<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background:url('img/cactus4.jpg') center center/cover no-repeat;
}

table, td, th {
  border: 1px solid black;
  height: 30px;
  background-color: rgba( 255, 255, 255, 0.8);
}

table {
  border-collapse: collapse;
  width: 60%;
}

th {
  height: 40px;
  background-color: rgba( 163, 163, 163, 0.5);
}

.btn {
  background-color: white; 
  color: black;
  padding: 2px 5px;
  text-align: center;
  text-decoration: none; 
  border: 2px solid #008CBA;
  height: 28px;
  width: 40px;
}

.btn:hover {
  background-color: #008CBA;
  color: white;
}
</style>
</head>
<body>
	<div class="content" style="text-align: center; margin-top:3%;">
		<%
			request.setCharacterEncoding("UTF-8");
			String utype = (String)session.getAttribute("utype");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int su = 0;
			int total = 0;
			
			try {
				String url = "jdbc:oracle:thin:@localhost:1521:XE";
				String user = "mirim3501";
				String pass = "3501";
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pass);
				
				String sql = "select count(*) from users";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					total = rs.getInt(1);
				}
				
				sql = "select * from users";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
			<h2>회원정보</h2>
			<table style="margin-left: auto; margin-right: auto; text-align: center;">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>비밀번호</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>회원유형</th>
				</tr>
				<%if(total == 0) { %>
				<tr><td>회원이 존재하지 않습니다.</td></tr>
				<%} else { 
					while(rs.next()){
						out.print("<tr>");
						out.print("<td>" + rs.getString(1) + "</td>");
						out.print("<td>" + rs.getString(2) + "</td>");
						out.print("<td>" + rs.getString(3) + "</td>");
						out.print("<td>" + rs.getString(4) + "</td>");
						out.print("<td>" + rs.getString(5) + "</td>");
						out.print("<td>" + rs.getString(6) + "</td>");
						String type = rs.getString(6);
						
						if(type.equalsIgnoreCase("member")) {
							if(type.trim().equals("admin")){
								out.print("<td>" + "<form method='post' action='grant.jsp'>"
										+ "<input type='hidden' name='userid' value='" + rs.getString(1) + "'>"
										+ "<input type='submit' value='권한부여' class='btn'></form>" + "</td>");
							}
							out.print("<td>" + "<form method='post' action='Mdelete.jsp'>"
									+ "<input type='hidden' name='userid' value='" + rs.getString(1) + "'>"
									+ "<input type='submit' value='삭제' class='btn'></form>" + "</td>");
							
						} else if (rs.getString(6).equals("Smem")){
							if(type.equals("admin")){
								out.print("<td>" + "<form method='post' action='revoke.jsp'>"
										+ "<input type='hidden' name='userid' value='" + rs.getString(1) + "'>"
										+ "<input type='submit' value='권한회수' class='btn'></form>" + "</td>");
							}
							out.print("<td>" + "<form method='post' action='Mdelete.jsp'>"
									+ "<input type='hidden' name='userid' value='" + rs.getString(1) + "'>"
									+ "<input type='submit' value='삭제' class='btn'></form>" + "</td>");
						} else {
							out.print("<td>" + "관계없음." + "</td>");
						}
						out.print("</tr>");
					}
				}
				%>
			</table>
		
		<%	} catch(Exception e){
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
			}
		%>
	</div>
</body>
</html>