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

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.registerbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #4f8be0;
}

.container {
	padding: 16px;
}

.content {
	width: 30%;
	margin: 0 auto;
	text-align: center;
}

section {
	text-align: center;
	vertical-align: middle;
	height: 75%;
	width: 100%;
	margin-top: 15%;
}

.content form {
	border: 3px solid #f1f1f1;
	text-align: center;
	vertical-align: middle;
}
</style>
<body>
	<div id="wapper">
		<header>
			<jsp:include page="top.jsp" flush="false" />
		</header>
		<section>
			<div class="content">
				<form action="loginPost.jsp" method="post" >
					<div class="container">
						<label for="userid"><b>아이디</b></label> 
						<input type="text" placeholder="아이디를 입력하세요." name="userid" required> 
						<label for="psw"><b>비밀번호</b></label> 
						<input type="password" placeholder="비밀번호를 입력하세요." name="upassword" required>

						<button type="submit">로그인</button>
					</div>

					<div class="container" style="background-color: #f1f1f1">
						<button type="button" class="registerbtn" onclick = "location.href ='register.jsp'">회원가입</button>
						<button type="reset" class="cancelbtn">취소</button>
					</div>
				</form>
			</div>
		</section>
		<footer>
			<jsp:include page="footer.jsp" flush="false" />
		</footer>
	</div>
</body>