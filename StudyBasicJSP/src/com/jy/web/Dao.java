package com.jy.web;
import java.sql.*;

public class Dao {
	Connection conn = null;

	public Connection getCon() throws Exception{
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userName = "hr";
		String userPassword = "orcl";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, userName, userPassword);
		System.out.println("Sever login!!");

		return conn;
	}

}
