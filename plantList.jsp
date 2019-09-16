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
  height: 25px;
  background-color: rgba( 255, 255, 255, 0.8);
}

table {
  border-collapse: collapse;
  width: 60%;
  text-align: center;
  margin:auto;
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
  margin-top:8px;
}

.btn:hover {
  background-color: #008CBA;
  color: white;
}

button {
  background-color: white; 
  color: black;
  padding: 2px 5px;
  text-align: center;
  text-decoration: none; 
  height: 28px;
  width: 100px;
  border: 2px solid #4CAF50;
}

button:hover {
  background-color: #4CAF50;
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
				
				String sql = "select count(*) from plant_admin";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					total = rs.getInt(1);
				}
				
				sql = "select pnum, pname, pPrice, pamount, psum from plant_admin";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
			<h2>식물</h2>
			<table style="margin-left: auto; margin-right: auto; text-align: center;">
				<tr>
					<th>번호</th>
					<th>식물이름</th>
					<th>개당 가격</th>
					<th>개수</th>
					<th>합계</th>
					<th colspan="2"><button type="button" class="registerbtn" onclick = "location.href ='add.jsp'">식물추가</button></th>
				</tr>
				<%if(total == 0) { %>
				<tr><td>식물이 존재하지 않습니다.</td></tr>
				<%} else { 
					while(rs.next()){
						out.print("<tr>");
						out.print("<td>" + rs.getInt(1) + "</td>");
						out.print("<td>" + rs.getString(2) + "</td>");
						out.print("<td>" + rs.getInt(3) + "</td>");
						out.print("<td>" + rs.getInt(4) + "</td>");
						out.print("<td>" + rs.getInt(5) + "</td>");
						
						out.print("<td>" + "<form method='post' action='update.jsp'>"
								+ "<input type='hidden' name='pnum' value='" + rs.getInt(1) + "'>"
								+ "<input type='submit' value='수정' class='btn'></form>" + "</td>");
						out.print("<td>" + "<form method='post' action='Pdelete.jsp'>"
									+ "<input type='hidden' name='pnum' value='" + rs.getInt(1) + "'>"
									+ "<input type='submit' value='삭제' class='btn'></form>" + "</td>");
							
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