package com.poosil.projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.poosil.projects.dto.Test;

public class TestDao {
	public List<Test> selectList(){
		
		
		List<Test> resultList= new ArrayList<Test>();
		Connection con = null;
		String url = "jdbc:oracle:thin:@192.168.10.3:1521:xe";
		String username = "kh";
		String password = "kh";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			psmt = con.prepareStatement(" SELECT SEQ, WRITER, TITLE, CONTENT, REGDATE FROM TEST ");
		
			rs = psmt.executeQuery();
			while(rs.next()) {
				Test item = new Test();
				item.setSeq(rs.getInt(1));
				item.setWriter(rs.getString(2));
				item.setTitle(rs.getString(3));
				item.setContent(rs.getString(3));
				item.setRegdate(rs.getDate(5));
				
				resultList.add(item);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				psmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return resultList;
		
		
	}
}
