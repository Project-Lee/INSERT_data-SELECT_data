<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member테이블의 레코드 삭제</title>
<style>
	.container { width: 500px; margin: 30px auto; color: firebrick;}
	.btn { text-align: center; background-color: gray; color:hotpink}
	.a {margin-left:200px; margin-top:20px;}
    h2 { text-align: center; color: grey;}
    label { width: 100px; display: inline-block; margin-left: 100px;}
    label, input { margin-bottom: 10px;}
</style>
</head>
<body>
	
	<h2>memeber 테이블의 삭제할 id/ps 입력</h2>
	<div class="container">
	<form method="post" action="deleteTestPro.jsp">
		<label for="id">아이디</label>
        <input type="text" name="id"><br>
        <label for="passwd">비밀번호</label>
        <input type="password" name="passwd"><br>
        <div class="a">
		<input type="submit" value="입력완료">
		</div>
	</form>
	</div>
</body>
</html>