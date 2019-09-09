<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="login.css"/>
<body>
	<div class="content">
		<form action="loginPost.jsp" method="post" >
			<div class="container">
				<label for="userid"><b>아이디</b></label> 
				<input type="text" placeholder="아이디를 입력하세요." name="userid" required><br> 
				<label for="psw"><b>비밀번호</b></label> 
				<input type="password" placeholder="비밀번호를 입력하세요." name="upassword" required>

				<button type="submit">로그인</button>
			</div>

			<div class="container" style="background-color: rgba(173, 173, 173, 0.5);">
				<button type="button" class="registerbtn" onclick = "location.href ='register.jsp'">회원가입</button>
				<button type="reset" class="cancelbtn">취소</button>
			</div>
		</form>
	</div>
</body>