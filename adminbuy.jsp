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
		<h2>구매 목록</h2>
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
				
				if(total != 0){
					sql = "select sum(bsum) from buy";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						out.print("<h3>총 " + rs.getInt(1) + "원입니다.</h3>");
					}
				}
				
				sql = "select buy.userid, plant_view.pname, buy.pprice, buy.bamount, buy.bsum from buy, plant_view where plant_view.pnum = buy.pnum";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
			<table style="margin-left: auto; margin-right: auto; text-align: center;">
				<tr>
					<th>구매자</th>
					<th>식물이름</th>
					<th>개당 가격</th>
					<th>구매한 수량</th>
					<th>합계</th>
				</tr>
				<%if(total == 0) { %>
				<tr><td>구매 내역이 존재하지 않습니다.</td></tr>
				<%} else { 
					while(rs.next()){
						out.print("<tr>");
						out.print("<td>" + rs.getString(1) + "</td>");
						out.print("<td>" + rs.getString(2) + "</td>");
						out.print("<td>" + rs.getInt(3) + "</td>");
						out.print("<td>" + rs.getInt(4) + "</td>");
						out.print("<td>" + rs.getInt(5) + "</td>");
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