<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>미산</title>
<link rel="stylesheet" type="text/css" href="../main.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
body {
	width: 100%;
	text-align: center;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
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
  background-color: #f1f1f1;
  text-align: center;
}

.content {
	width: 40%;
	margin: 0 auto;
	text-align: center;
}

section {
	text-align: center;
	vertical-align: middle;
	width: 100%;
	margin-top: 5%;
	margin-bottom: 15%;
}
</style>
<body>
	<div id="wapper">
		<header>
			<jsp:include page="top.jsp" flush="false" />
		</header>
		<section>
			<div class="content">
				<form action="registerProc.jsp">
					<div class="container">
						<h1>회원가입</h1>
						<p>등록된 개인정보는 회원님의 동의 없이 공개되지 않습니다.</p>
						<hr>
						
						<label for="uname"><b>이름</b></label> 
						<input type="text" placeholder="이름을 입력하세요." name="uname" required> 
						<label for="userid"><b>아이디</b></label> 
						<input type="text" placeholder="아이디를 입력하세요." name="userid" required> 
						<label for="psw"><b>비밀번호</b></label> 
						<input type="password" placeholder="비밀번호를 입력하세요." name="upassword" required> 
						<label for="psw-repeat"><b>비밀번호 확인</b></label> 
						<input type="password" placeholder="비밀번호를 다시 입력해주세요." name="psw-repeat" required>
						<label for="uaddress"><b>주소</b></label> 
						<input type="text" placeholder="주소를 입력하세요." name="uaddress" required> 
						<label for="utelnum"><b>전화번호</b></label> 
						<input type="text" placeholder="전화번호를 입력하세요." name="utelnum" required> 
						
						<hr>
						<button type="submit" class="registerbtn">Register</button>
					</div>

					<div class="container signin">
						<p>
							Already have an account? <a href="login.jsp">Sign in</a>.
						</p>
					</div>
				</form>
			</div>
		</section>
		<footer>
			<jsp:include page="footer.jsp" flush="false" />
		</footer>
	</div>
</body>