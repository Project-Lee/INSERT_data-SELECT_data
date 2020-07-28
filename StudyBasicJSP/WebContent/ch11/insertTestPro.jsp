<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.jy.web.BoardVO" %> 


<%request.setCharacterEncoding("utf-8"); %>

<%
	BoardVO vo = new BoardVO();

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try {
		String url ="jdbc:oracle:thin:@localhost:1521:orcl"; // 포트번호
		String username = "hr";
		String password = "orcl";
		
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn = DriverManager.getConnection(url,username,password);
		
		String sql = "insert into member values(?,?,?,?)"; // 순차적으로 들어오는 3개의 값을 넣겠다
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setString(4,age);
		pstmt.executeUpdate();
		
						
		str=" member테이블에 새로운 레코드 추가";
		
	} catch(Exception e) {
		e.printStackTrace();
		str= "member 테이블에 레코드 추가 실패";
				
	} finally {
		if(pstmt != null)
			try{pstmt.close();} catch(SQLException e) {}
		if(conn != null)
			try{conn.close();} catch(SQLException e) {}
	}	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=str %></h1>
</body>
</html>