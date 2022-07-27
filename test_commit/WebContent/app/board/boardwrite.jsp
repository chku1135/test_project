<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{ background-color:#fff; }
	table{
		border:0px;
		width:900px;
	}
	#wrap{
		width:1000px;
		margin:0 auto;
	}
	.title h3{
		font-size: 1.5em;
		color:rgb(0,200,80);
		text-shadow: 0 0 4px deepskyblue;
	}
	a{
		display:inline-block;
		border-radius: 3px;
		background-color: rgb(0,200,80);		
		color:#fff;
		font-weight: bold;
		text-decoration: none;
	}
	.header_area a{
		width:100px;
		padding:10px;
		text-align: center;
	}
	.header_area span{ font-weight: bold; }
	.btn_area a{
		text-align: center;
		padding:10px;
		width:100px;	
	}
	img.thumbnail{
		display:block;
		clear:both;
		width:100px;
	}
	#boardForm tr:nth-child(n+4) {
		height:50px;
	}
	#boardForm a{
		padding:5px 10px;
	}
	input[type="text"], textarea{
		border:none;
		padding:5px;
		outline:none;
	}
</style>
</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath }"/>
	<c:if test="${loginUser == null }">
		<script>
			let cp = "${pageContext.request.contextPath}";
			alert("로그인 후 이용하세요!");
			location.replace(cp+"/user/userlogin.us");
		</script>
	</c:if>
	<div id="wrap">
		<table class="header_area">
			<tr align="right" valign="middle">
				<td>
					<span>${loginUser}님 환영합니다.</span>&nbsp;&nbsp;
					<a href="${cp}/user/userlogout.us">로그아웃</a>
				</td>
			</tr>
		</table>
		<table class="title">
			<tr align="center" valign="middle">
				<td><h3>MVC 게시판</h3></td>
			</tr>
		</table>
		<form id="boardForm" method="post" name="boardForm" action="${cp}/board/boardwriteok.bo" enctype="multipart/form-data">
			<table border="1" style="border-collapse: collapse;">
				<tr height="30px">
					<th align="center" width="150px">제 목</th>
					<td>
						<input type="text" name="boardtitle" size="50" maxlength="50" placeholder="제목을 입력하세요">
					</td>
				</tr>
				<tr height="30px">
					<th align="center" width="150px">작성자</th>
					<td>
						<input type="text" name="userid" size="50" maxlength="50" value="${loginUser}" readonly>
					</td>
				</tr>
				<tr height="300px">
					<th align="center" width="150px">내 용</th>
					<td>
						<textarea name="boardcontents" style="width:700px;height:290px; resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<th>파일 첨부1</th>
					<td class="file1_cont">
						<div style="float:left;">
							<input type="file" name="file1" id="file1" style="display:none;">
							<span id="file1name">선택된 파일 없음</span>
						</div>
						<div style="float:right; margin-right:100px;">
							<a href="javascript:upload('file1')">파일 선택</a>
							<a href="javascript:cancelFile('file1')">첨부 삭제</a>
						</div>
					</td>
				</tr>
				<tr>
					<th>파일 첨부2</th>
					<td class="file2_cont">
						<div style="float:left;">
							<input type="file" id="file2" name="file2" style="display:none;">
							<span id="file2name">선택된 파일 없음</span>
						</div>
						<div style="float:right; margin-right:100px;">
							<a href="javascript:upload('file2')">파일 선택</a>
							<a href="javascript:cancelFile('file2')">첨부 삭제</a>
						</div>
					</td>
				</tr>
			</table>
			<br>
		</form>
		<table class="btn_area">
			<tr align="right" valign="middle">
				<td>
					<a href="javascript:sendit()">등록</a>&nbsp;&nbsp;
					<a href="${cp}/board/boardlist.bo?page=${param.page}">목록</a>
				</td>
			</tr>
		</table>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery에 주요 업데이트가 있을 경우 콘솔에 경고 표시, 해결할 수 있는 문제들은 스스로 해결 -->
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
	function upload(name){
		$("#"+name).click();
	}
	//$(제이쿼리선택자).change(함수) : 해당 선택자의 요소에 변화가 일어난다면 넘겨주는 함수 호출
	$("[type='file']").change(function(e){
		//e : 파일이 업로드된 상황 자체를 담고있는 객체
		//e.target : 파일이 업로드가 된 input[type=file] 객체(태그객체)
		//e.target.files : 파일태그에 업로드를 한 파일 객체들의 배열
		let file = e.target.files[0];
		
		if(file == undefined){
			//$("#file1name")
			$("#"+e.target.id+"name").text("선택된 파일 없음");
			$("."+e.target.id+"_cont .thumbnail").remove();
		}
		else{
			$("#"+e.target.id+"name").text(file.name);
			
			//["QR","png"]
			let ext = file.name.split(".").pop();
			if(ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif' || ext == 'webp'){
				$("."+e.target.id+"_cont .thumbnail").remove();
				const reader = new FileReader();
				
				reader.onload = function(ie){
					const img = document.createElement("img");
					img.setAttribute("src",ie.target.result)
					img.setAttribute("class",'thumbnail');//<img src="???/QR.png" class="thumbnail">
					document.querySelector("."+e.target.id+"_cont").appendChild(img);
				}
				
				reader.readAsDataURL(file);
			}
			
		}
	});
	function cancelFile(name){
		if($.browser.msie){
			$("input[name="+name+"]").replaceWith( $("input[name="+name+"]").clone(true) );
		}
		else{
			$("input[name="+name+"]").val("");
		}
		$("#"+name+"name").text("선택된 파일 없음");
		$("."+name+"_cont .thumbnail").remove();
	}
	function sendit(){
		const boardForm = document.boardForm;
		
		const boardtitle = boardForm.boardtitle;
		if(boardtitle.value == ""){
			alert("제목을 입력하세요!");
			boardtitle.focus();
			return false;
		}
		
		const boardcontents = boardForm.boardcontents;
		if(boardcontents.value == ""){
			alert("내용을 입력하세요!");
			boardcontents.focus();
			return false;
		}
		
		boardForm.submit();
	}
</script>
</html>










