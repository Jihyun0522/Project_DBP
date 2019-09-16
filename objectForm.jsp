<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function buy(value){
    var f = document.paging; //폼 name
    f.value = value;
    f.action="objBuy.jsp";//이동할 페이지
    f.method="post";//POST방식
    f.submit();
}
</script>
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
				
				String sql = "select count(*) from plant_view";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					total = rs.getInt(1);
				}
				
				sql = "select * from plant_view";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
			<h2>식물</h2>
			<table style="margin-left: auto; margin-right: auto; text-align: center;">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>가격</th>
					<th>수량</th>
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
						
						if(rs.getInt(4) > 0) {
							out.print("<td>" + "<form method='post' action='objBuy.jsp'><input type='hidden' name='num' value='" + 
								rs.getInt(1) +"'><input type='submit' value='구매' class='btn'></form>" + "</td>");
						} else {
							out.print("<td>" + "수량없음" + "</td>");
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
				
				/* if(su == 1){
					out.println("<script>alert('회원가입이 성공적으로 되었습니다!');");
					out.println("location.href = 'login.jsp';</script>");
				} else {
					out.println("<script>alert('회원가입에 실패하였습니다....');");
					out.println("location.href = 'register.jsp';</script>");
				} */
			}
		%>
	</div>
</body>
</html>