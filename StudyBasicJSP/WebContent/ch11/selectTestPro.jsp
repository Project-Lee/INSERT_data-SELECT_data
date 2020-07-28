<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ page import="java.util.*" %>	
<%@ page import="com.jy.web.BoardVO" %> 



<%!

	public Connection getCon() throws Exception {
		String url ="jdbc:oracle:thin:@localhost:1521:orcl"; // 포트번호
		String username = "hr";
		String password = "orcl";  
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 어떤 드라이브 연결할지
		Connection con = DriverManager.getConnection(url,username,password);
		System.out.println("접속 성공!");	
		return con;
}
	
%>

<%	


	List<BoardVO> boardList = new ArrayList(); //BoardVO 객체를 여러개 담을수 있는 리스트 
	
	Connection con = null; 
	PreparedStatement ps = null; 
	ResultSet rs = null; // SELECT 사용할때 필요한 클래스
	
	String sql = "SELECT id, passwd, name, age "
			+ " FROM member";
	
	try {
		con = getCon();
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		
		while(rs.next()) {
			String id = rs.getNString("id");
			String passwd = rs.getNString("passwd");
			String name = rs.getNString("name");
			int age = rs.getInt("age");
			
			
			BoardVO vo = new BoardVO();
			vo.setId(id);
			vo.setPasswd(passwd);
			vo.setName(name);
			vo.setAge(age);
			
			
			boardList.add(vo);
		}
		
	} catch(Exception e) {
		System.out.println("접속 실패 !!");
		e.printStackTrace();
		
		
	} finally {
		
		if(rs != null) {try {rs.close();} catch(Exception e) {} } // SELECT 사용할때 필요
		if(ps != null) {try {ps.close();} catch(Exception e) {} }
		if(con != null) {try {con.close();} catch(Exception e) {} }
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<style>
        table { width: 300px; border: 1px solid black; border-collapse: collapse; margin-left:650px;
       	margin-top: 30px;}
        td { border: 1px solid black; text-align:center;}
        tr { height: 60px;}
        #f { text-align: center; color: red;} 
</style>
<body>
	<div id="f"><h2>아이디 목록</h2></div>	
	
	<table>
		<tr>
			<th>id</th>
			<th>passwd</th>
			<th>name</th>
			<th>age</th>
		</tr>
		
		<% for(BoardVO vo : boardList) { %>
		<tr>
			<td><%=vo.getId() %></td>
			<td><%=vo.getPasswd() %></td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getAge() %></td>
		</tr>
		<% } %>
		
	</table>	
</body>
</html>