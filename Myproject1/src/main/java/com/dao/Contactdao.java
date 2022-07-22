package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.Contact;
import com.utill.Projectutill;

public class Contactdao {
   public static void addContact(Contact c )
   {
	   try {
		Connection conn = Projectutill.createConnection();
		String sql ="insert into contact(name,email,subject,message)values(?,?,?,?)";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1,c.getName() );
		pst.setString(2,c.getEmail() );
		pst.setString(3,c.getSubject() );
		pst.setString(4,c.getMessage() );
		pst.executeUpdate();
	} catch (Exception e) {

	e.printStackTrace();
	}
   }
}
