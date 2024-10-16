package com.sonu.DBcon;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

	private static Connection con;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			DBconnection.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmyticket", "root",
					"Subh123@");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}
