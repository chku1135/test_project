<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	#wrap{
		width:600px;
		margin:0 auto;
	}
	body{ background-color: rgb(245,246,247); }
	input{
		box-sizing: border-box;
		cursor: pointer;
	}
	table{ border-collapse: collapse; }
	tr, td{ padding: 10px; }
	input[type=text], input[type=password]{
		padding:10px;
		width:200px;
		margin-left:20px;
		border:1px solid #ccc;
		border-radius: 5px;
		outline: none;
	}
	input[type=text]:focus, input[type=password]:focus{
		border:1px solid rgb(0,200,80);
	}
	input[type=submit]{
		margin-top:30px;
		padding:10px 20px;
		width:100px;
		border:none;
		background-color:rgb(0,200,80);
		border-radius: 5px;
		color:#fff;
		font-weight: bold;
		font-size: 18px;
	}
</style>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
	<div id="wrap">
		<!--
			로그인 성공시 세션( req.getSession() )세팅 후 alert() 띄우면서 main.jsp로 이동(forward)
			로그인 실패시 index.jsp로 이동(forward)
		-->
		<form name="loginForm" action="${cp}/user/userloginok.us" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="userid">
					</td>
				</tr>			
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="userpw">
					</td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="로그인"></th>
				</tr>
			</table>
			<a href="${cp }/user/userjoin.us">회원가입</a>
		</form>
	</div>
</body>
</html>