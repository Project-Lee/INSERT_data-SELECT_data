<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String username = "hr";
		String password = "orcl";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, username, password);
		
		String sql = "select id, passwd from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if(id.equals(rId) && passwd.equals(rPasswd)) {
				sql = "update member set name = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,name);
				pstmt.setString(2,id);
				pstmt.executeUpdate();
			} else {
				out.println("패스워드 틀림");
			} 
		} else {
			out.println("아이디 틀림");
				
		} 
	} catch(Exception e) {
			e.printStackTrace();
			System.out.println("실패!!");
			
	} finally {
		if(rs != null) {
			try { rs.close();} catch(SQLException e) { }
		}
		if(pstmt != null) {
			try{ pstmt.close(); } catch(SQLException e) { }
		}
		if(conn != null) {
			try { conn.close(); } catch(SQLException e) {}
		}
	}
%>       
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member 레코드 수정</title>
<style>
	h2 {color : red;}
</style>
</head>
<body>
	<h2>member 테이블의 레코드를 수정했습니다</h2>
</body>
</html>