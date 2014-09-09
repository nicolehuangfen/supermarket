package com.DBConn;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DBAccess {
	private String drv = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/supermarket";
	private String usr = "root";
	private String pwd = "123456";
	private Connection conn = null;
	private Statement stm = null;
	private ResultSet rs = null;
	public String getDrv() {
		return drv;
	}
	public void setDrv(String drv) {
		this.drv = drv;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsr() {
		return usr;
	}
	public void setUsr(String usr) {
		this.usr = usr;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	public Statement getStm() {
		return stm;
	}
	public void setStm(Statement stm) {
		this.stm = stm;
	}
	public ResultSet getRs() {
		return rs;
	}
	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
	public boolean createConn(){
		boolean b = false;
		try{
			Class.forName(drv).newInstance();
			conn = (Connection) DriverManager.getConnection(url,usr,pwd);
			b = true;
		}catch(SQLException e){
			
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	public boolean update(String sql){
		boolean b = false;
		try {
			stm = (Statement) conn.createStatement();
			stm.execute(sql);
			b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	public void query(String sql){
		try {
			stm = (Statement) conn.createStatement();
			rs = stm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean next(){
		boolean b = false;
		try {
			if(rs.next())
				b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	public String getValue(String field){
		String value = null;
		if(rs != null)
			try {
				value = rs.getString(field);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return value;
	}
	
	public void closeDB(){
		if(rs != null)
			try {
				rs.close();
				if(stm != null)
					stm.close();
				if(conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
