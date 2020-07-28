<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.jy.web.Dao" %>

<% request.setCharacterEncoding("utf-8"); %>

<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
%>
<%
	Dao dao = new Dao();

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	
	try {
		conn = dao.getCon();
		
		String sql = " select id,passwd from member where id = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if(id.equals(rId) && passwd.equals(rPasswd)) {
				sql= " delete from member where id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.executeUpdate();
				str = "member테이블의 값 삭제 완료!";
		
	
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 삭제</title>
</head>
<body>
	<%=str %>
	<%
			} else 
				out.println("패스워드가 틀렸습니다");
		} else 
			out.println("아이디가 틀렸습니다");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null) 
			try{rs.close();} catch(SQLException sqle) {}
		if(pstmt != null)
			try{pstmt.close();} catch(SQLException sqle) {}
		if(conn != null)
			try{conn.close();} catch(SQLException sqle) {}
	}
	%>
	
</body>
</html>