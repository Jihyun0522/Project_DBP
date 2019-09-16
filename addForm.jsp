<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
	background:url('img/cactus1.jpg') center center/cover no-repeat;
}

/* Add padding to containers */
.container {
  padding: 20px;
  background-color: rgba( 255, 255, 255, 0.5);
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
	background-color: rgba(173, 173, 173, 0.5);
  	text-align: center;
}

.content {
	width: 65%;
	margin: 0 auto;
	text-align: center;
	position: relative;
}

form {
	border: 3px solid #f1f1f1;
	text-align: center;
	vertical-align: middle;
	background-color: rgba( 255, 255, 255, 0.5);
}

.labelText {
	text-align: left; 
	margin-left: 3%;
}

.alert {
	padding: 5px;
	margin: 5px 20px;
	border-radius: 5px;
}

.alert-success {
	background: #a5e8ba;
}

.alert-danger {
	background: #ffabab;
}
</style>
<body>
	<div class="content">
		<form action="addProc.jsp" method="post">
			<div class="container">
				<h1>식물추가</h1>
				<hr>
				<div class="labelText">
					<label for="pname"><b>식물이름</b></label>
				</div> 
				<input type="text" name="pname" required> 
				
				<div class="labelText">
					<label for="pPrice"><b>개당 가격</b></label>
				</div> 
				<input type="text" name="pPrice" required> 
				
				<div class="labelText">
					<label for="pamount"><b>개수</b></label>
				</div> 
				<input type="text" name="pamount" required> 
				
				<hr>
				<button type="submit" class="registerbtn" id="submit">수정하기</button>
			</div>
	
			<div class="container signin">
				<p><a href="plant.jsp">돌아가기</a></p>
			</div>
		</form>
	</div>
</body>