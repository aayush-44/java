package com.utill;

import java.sql.Connection;
import java.sql.DriverManager;

public class Projectutill {
 public static Connection createConnection()
 {
	 Connection conn= null;
	 try {
		Class.forName("com.mysql.jdbc.Driver");
		 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvccrud","root",""); 
		 System.out.println(conn);
	} catch (Exception e) {

	e.printStackTrace();
	}
	 return conn;
 }
}
