package com.poosil.login.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.poosil.login.dto.loginDto;
import com.poosil.util.db.SqlMapConfig;


public class loginDao extends SqlMapConfig {

	/*
	 * 愿�由ъ옄(ADMIN) 湲곕뒫 1. �쉶�썝 �쟾泥� �젙蹂� �솗�씤 (�깉�눜�븳 �쉶�썝�룄 �솗�씤) 2. �쉶�썝 �쟾泥� �젙蹂� �솗�씤 (MYENABLED='Y'�씤 ->
	 * �깉�눜 �븞�븳 �쉶�썝�뱾�쓽 �젙蹂�) 3. �쉶�썝 �벑湲� 議곗젙 (ADMIN <-> USER)
	 */

	// 1. �쟾泥� �젙蹂�
	
	private String namespace ="com.poosil.login.mapper.";
	
	//愿�由ъ옄 �쑀��議고쉶
	public List<loginDto> selectAllUser() {
		
		List<loginDto> list = new ArrayList<loginDto>();
		SqlSession session =null;
				
				try {
					session = getSqlSessionFactory().openSession(false);
					list =session.selectList(namespace+"selectalluser");
				
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					session.close();
				}

		

		return list;
	}
	
	public loginDto selectMy(String userid){
		
		loginDto dto= new loginDto();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto=session.selectOne(namespace+"myinfo",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto ;
		
	}

	// 2. �쟾泥� �젙蹂�(�깉�눜 �븞�븳)(�궘�젣�삁�젙)
	public List<loginDto> selectEnabledUser() {
		return null;
//		Connection con = getConnection();
//		String sql = " SELECT MYNO, MYID, MYPW, MYNAME, MYADDR, MYPHONE, MYEMAIL, MYENABLED, MYROLE "
//				+ " FROM MYMEMBER " + " WHERE MYENABLED = 'Y' ";
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		List<loginDto> list = new ArrayList<loginDto>();
//
//		try {
//			pstm = con.prepareStatement(sql);
//			System.out.println("3. query 以�鍮� : " + sql);
//
//			rs = pstm.executeQuery();
//			System.out.println("4. qeury �떎�뻾 諛� 由ы꽩");
//			while (rs.next()) {
//				loginDto dto = new loginDto();
//				dto.setUserid(rs.getString(1));;
//				dto.setPassword(rs.getString(2));
//				dto.setUseremail(rs.getString(3));
//				dto.setUserphone(rs.getInt(4));
//				dto.setAddress(rs.getString(5));
//				dto.setAddresslatitude(rs.getString(6));
//				dto.setAddresslongitude(rs.getString(7));
//				dto.setUserrole(rs.getString(8));
//				dto.setIsseller(rs.getString(9));
//				dto.setSellersOpt(rs.getString(10));
//				dto.setAvatar(rs.getString(11));
//				dto.setUsername(rs.getString(12));
//
//				list.add(dto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs, pstm, con);
//			System.out.println("5. db 醫낅즺");
//		}
//
//		return list;
	}

	// 3. �쉶�썝 �벑湲� 議곗젙(�궘�젣�삁�젙)
	public int updateRole(String userid , String userole) {
		
				
		return 0;
	

	}
	//1.濡쒓렇�씤
	public loginDto login(String userid ,String password ) {
		
		SqlSession session =null;
		
		loginDto dto = new loginDto();
		
		Map<String, String> param = new HashMap<String, String>();
		
		param.put("userid", userid);
		param.put("password", password);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"login",param);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println("db醫낅즺");
				
		return dto;
	

	}


	// 2. 以묐났泥댄겕
	public int idCheck(String userid) {
		
		SqlSession session = null;
		
		int result =0;
		try {
			session = getSqlSessionFactory().openSession(false);
			result = session.selectOne(namespace+"idcheck",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return  result ;
		
		

	}

	// 3. �쉶�썝媛��엯
	public int insertUser(loginDto dto) {
		
		int res =0;
		try{
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace+"signup",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
	}

	// 4. �젙蹂� 議고쉶(�닔�젙�쟾)
	public loginDto selectUser(String userid) {
		
		return null;
	}

	// 5. �젙蹂� �닔�젙(�닔�젙�쟾)
	public int updateUser(loginDto dto) {
		
		
		return 0;
	}
//		Connection con = getConnection();
//		String sql = " UPDATE MYMEMBER " 
//				   + " SET MYNAME = ?, MYADDR = ?, MYPHONE = ?, MYEMAIL = ? " 
//				   + " WHERE MYNO = ? ";
//		PreparedStatement pstm = null;
//		int res = 0;
//
//		try {
//			pstm = con.prepareStatement(sql);
//			pstm.setString(1, dto.getMyname());
//			pstm.setString(2, dto.getMyaddr());
//			pstm.setString(3, dto.getMyphone());
//			pstm.setString(4, dto.getMyemail());
//			pstm.setInt(5, dto.getMyno());
//			System.out.println("3. query 以�鍮� : " + sql);
//
//			res = pstm.executeUpdate();
//			System.out.println("4. query �떎�뻾 諛� 由ы꽩");
//			if (res > 0) {
//				commit(con);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstm, con);
//			System.out.println("5. db 醫낅즺");
//		}

//		return res;
//	}

	// 6. �쉶�썝 �깉�눜 (update)
	public loginDto deleteUser(String userid) {
		
		return null;
	}
		
	
//		Connection con = getConnection();
//		String sql = " UPDATE MYMEMBER SET MYENABLED = ? WHERE MYNO = ? ";
//		PreparedStatement pstm = null;
//		int res = 0;
//		
//		try {
//			pstm = con.prepareStatement(sql);
//			
//			System.out.println("3. query 以�鍮� : " + sql);
//			
//			res = pstm.executeUpdate();
//			System.out.println("4. query �떎�뻾 諛� 由ы꽩");
//			if (res > 0) {
//				commit(con);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstm, con);
//		}
//		
//		return res;
//	}
	
	
	
}





































