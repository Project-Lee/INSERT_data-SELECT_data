<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 추가</title>
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
	<h2>member테이블에 레코드 추가</h2>
			
	<div class="container">
	<form method="post" action="insertTestPro.jsp">
		<label for="id">아이디</label>
        <input type="text" name="id"><br>
        <label for="passwd">비밀번호</label>
        <input type="password" name="passwd"><br>
        <label for="name">이름</label>
        <input type="text" name="name"><br>
        <label for="age">나이</label>
        <input type="text" name="age"><br>
   		<div class="a">
		<input type="submit" value="입력완료">
		</div>
	</form>
	</div>
</body>
</html>

