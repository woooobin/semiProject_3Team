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
	 * 관리자(ADMIN) 기능 1. 회원 전체 정보 확인 (탈퇴한 회원도 확인) 2. 회원 전체 정보 확인 (MYENABLED='Y'인 ->
	 * 탈퇴 안한 회원들의 정보) 3. 회원 등급 조정 (ADMIN <-> USER)
	 */

	// 1. 전체 정보

	private String namespace = "com.poosil.login.mapper.";

	// 관리자 유저조회
	public List<loginDto> selectAllUser() {

		List<loginDto> list = new ArrayList<loginDto>();
		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectalluser");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}

	public loginDto selectMy(String userid) {

		loginDto dto = new loginDto();

		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(namespace + "myinfo", userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;

	}

	// 2. 전체 정보(탈퇴 안한)(삭제예정)
	public List<loginDto> selectEnabledUser() {
		return null;
		// Connection con = getConnection();
		// String sql = " SELECT MYNO, MYID, MYPW, MYNAME, MYADDR, MYPHONE, MYEMAIL,
		// MYENABLED, MYROLE "
		// + " FROM MYMEMBER " + " WHERE MYENABLED = 'Y' ";
		// PreparedStatement pstm = null;
		// ResultSet rs = null;
		// List<loginDto> list = new ArrayList<loginDto>();
		//
		// try {
		// pstm = con.prepareStatement(sql);
		// System.out.println("3. query 준비 : " + sql);
		//
		// rs = pstm.executeQuery();
		// System.out.println("4. qeury 실행 및 리턴");
		// while (rs.next()) {
		// loginDto dto = new loginDto();
		// dto.setUserid(rs.getString(1));;
		// dto.setPassword(rs.getString(2));
		// dto.setUseremail(rs.getString(3));
		// dto.setUserphone(rs.getInt(4));
		// dto.setAddress(rs.getString(5));
		// dto.setAddresslatitude(rs.getString(6));
		// dto.setAddresslongitude(rs.getString(7));
		// dto.setUserrole(rs.getString(8));
		// dto.setIsseller(rs.getString(9));
		// dto.setSellersOpt(rs.getString(10));
		// dto.setAvatar(rs.getString(11));
		// dto.setUsername(rs.getString(12));
		//
		// list.add(dto);
		// }
		// } catch (SQLException e) {
		// e.printStackTrace();
		// } finally {
		// close(rs, pstm, con);
		// System.out.println("5. db 종료");
		// }
		//
		// return list;
	}

	// 3. 회원 등급 조정(삭제예정)
	public int updateRole(String userid, String userole) {

		return 0;

	}

	// 1.로그인
	public loginDto login(String userid, String password) {

		SqlSession session = null;

		loginDto dto = new loginDto();

		Map<String, String> param = new HashMap<String, String>();

		param.put("userid", userid);
		param.put("password", password);

		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "login", param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		System.out.println("db종료");

		return dto;

	}

	// 2. id중복체크
	public int idCheck(String userid) {

		SqlSession session = null;

		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			result = session.selectOne(namespace + "idcheck", userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;

	}

	// 2.1email 중복체크
	public int emailCheck(String useremail) {

		SqlSession session = null;

		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			result = session.selectOne(namespace + "emailcheck", useremail);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;

	}

	// 3. 회원가입
	public int insertUser(loginDto dto) {

		int res = 0;
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace + "signup", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;

	}

	// 5. 정보 수정
	public int updateUser(loginDto dto) {
		SqlSession session = null;
		
		int res = 0;
		try {
			session= getSqlSessionFactory().openSession(true);
			res =session.update(namespace+"userupdate",dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}
	// Connection con = getConnection();
	// String sql = " UPDATE MYMEMBER "
	// + " SET MYNAME = ?, MYADDR = ?, MYPHONE = ?, MYEMAIL = ? "
	// + " WHERE MYNO = ? ";
	// PreparedStatement pstm = null;
	// int res = 0;
	//
	// try {
	// pstm = con.prepareStatement(sql);
	// pstm.setString(1, dto.getMyname());
	// pstm.setString(2, dto.getMyaddr());
	// pstm.setString(3, dto.getMyphone());
	// pstm.setString(4, dto.getMyemail());
	// pstm.setInt(5, dto.getMyno());
	// System.out.println("3. query 준비 : " + sql);
	//
	// res = pstm.executeUpdate();
	// System.out.println("4. query 실행 및 리턴");
	// if (res > 0) {
	// commit(con);
	// }
	// } catch (SQLException e) {
	// e.printStackTrace();
	// } finally {
	// close(pstm, con);
	// System.out.println("5. db 종료");
	// }

	// return res;
	// }

	// 6. 회원 탈퇴 (update)
	public int deleteUser(String userid) {

		int res = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "userdelete", userid);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public int enabledout(String userenabled) {
		int res = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "enabledout", userenabled);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;

	}
	public int snslogin(String useremail) {

		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace + "snscheck", useremail);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;

	}
	public loginDto snslogin2(String useremail) {

		loginDto dto = new loginDto();

		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(namespace + "snslogin2", useremail);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;

	}

	
	


}
