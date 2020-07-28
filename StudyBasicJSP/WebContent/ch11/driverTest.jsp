<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h2>JDBC 드라이버 테스트</h2>

<%
		Connection conn = null;

	try {
		
		String url ="jdbc:oracle:thin:@localhost:1521:orcl"; // 포트번호
		String username = "hr";
		String password = "orcl"; 
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,username,password);
		out.println("제대로 연결되었습니다.");
	} catch(Exception e) {
		e.printStackTrace();
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	
</body>
</html>