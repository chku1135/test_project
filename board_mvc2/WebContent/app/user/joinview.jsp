<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<style>
	#wrap{
		width:1000px;
		margin:0 auto;
	}
	body{ background-color:rgb(245,246,247); }
	input{
		box-sizing: border-box;
		cursor:pointer;
	}
	table{ border-collapse: collapse; }
	th{ text-align: left; }
	th::after{
		content:"";
		display: inline-block;
		box-sizing: border-box;
		width:1px;
		height:14px;
	}
	th, td{ padding: 5px; }
	td{
		padding-left: 20px;
		width:400px;
	}
	input[type=text], input[type=password]{
		padding:10px 15px 10px 10px;
		border:1px solid #ccc;
		width:250px;
		border-radius: 5px;
	}
	input:focus{
		outline: none;
		border:1px solid rgb(0,200,80);
	}
	td > input[type=text] + input[type=button]{
		margin-left:10px;
		padding:8px 10px;
		background-color: rgb(0,200,80);
		color:#fff;
		font-size: 14px;
		font-weight: bold;
		border:none;
		border-radius: 5px;
		width:80px;
	}
	.gender_area > td{ font-size:16px; }
	.zipcode_area > td > input[type=text]{ width:200px; }
	.zipcode_area > td > input[type=button]{ width:130px !important; }
	.addr_area > td > input[type=text],
	.addr_area + tr > td > input[type=text],
	.addr_area + tr + tr > td > input[type=text]{
		width:340px;
	}
	.hobby_area > td > div{
		display:flex;
		width:360px;
		flex-wrap:wrap;
	}
	.hobby_area > td > div > div{
		padding:10px;
		flex: 1 1 40%;
	}
	.hobby_area > td > div > div:nth-child(odd){
		margin-right:10px;
	}
	.hobby_area > td > div > div:nth-child(2n){
		border-left:1px solid #ccc;
		padding-left:30px;
	}
	.hobby_area + tr > th{ text-align:center; }
	input[type=submit]{
		padding:10px 10px;
		background-color:rgb(0,200,80);
		color:#fff;
		font-size:20px;
		font-weight: bold;
		border:none;
		border-radius:5px;
		width:300px;
	}	
</style>
</head>
<body>
	<div id="wrap">
		<form name="joinForm" method="post" action="${cp}/user/userjoinok.us"
			onsubmit="return sendit()">
			<table>
				<tr>
					<td id="result" colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<th><label for="userid">아이디</label></th>
					<td><input type="text" name="userid" id="userid"><input
						type="button" value="중복검사" onclick="checkId()"></td>
				</tr>
				<tr>
					<th><label for="userpw">비밀번호</label></th>
					<td><input type="password" name="userpw" id="userpw"></td>
				</tr>
				<tr>
					<th><label for="userpw_re">비밀번호 확인</label></th>
					<td><input type="password" name="userpw_re" id="userpw_re"></td>
				</tr>
				<tr>
					<th><label for="username">이름</label></th>
					<td><input type="text" name="username" id="username"></td>
				</tr>
				<tr class="gender_area">
					<th>성별</th>
					<td><label>남자 <input checked type="radio"
							name="usergender" value="M"></label> <label>여자 <input
							type="radio" name="usergender" value="W"></label></td>
				</tr>
				<tr class="zipcode_area">
					<th>우편번호</th>
					<td><input readonly name="zipcode" type="text"
						id="sample6_postcode" placeholder="우편번호"><input
						type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr class="addr_area">
					<th>주소</th>
					<td><input readonly name="addr" type="text"
						id="sample6_address" placeholder="주소"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input name="addrdetail" type="text"
						id="sample6_detailAddress" placeholder="상세주소"></td>
				</tr>
				<tr>
					<th>참고항목</th>
					<td><input readonly name="addretc" type="text"
						id="sample6_extraAddress" placeholder="참고항목"></td>
				</tr>
				<tr class="hobby_area">
					<th>취미</th>
					<td>
						<div>
							<div>
								<label><input type="checkbox" name="userhobby"
									value="게임"> 게임하기</label>
							</div>
							<div>
								<label><input type="checkbox" name="userhobby"
									value="그림"> 그림그리기</label>
							</div>
							<div>
								<label><input type="checkbox" name="userhobby"
									value="영화"> 영화보기</label><br>
							</div>
							<div>
								<label><input type="checkbox" name="userhobby"
									value="운동"> 운동하기</label>
							</div>
							<div>
								<label><input type="checkbox" name="userhobby"
									value="노래"> 노래부르기</label>
							</div>
							<div>
								<label><input type="checkbox" name="userhobby"
									value="코딩"> 코딩하기</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="가입 완료"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	const cp = "${cp}";
</script>
<script src="${cp}/app/user/user.js"></script>
</html>
















