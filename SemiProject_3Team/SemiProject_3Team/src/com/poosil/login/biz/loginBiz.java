package com.poosil.login.biz;

import java.util.List;

import com.poosil.login.dao.loginDao;
import com.poosil.login.dto.loginDto;

public class loginBiz {

	// 원래 원칙은 객체 생성해서 필드 만들어서 해야 한다.
	loginDao dao = new loginDao();

	public List<loginDto> selectAllUser() {
		return dao.selectAllUser();
	}

	public loginDto selectMy(String userid) {
		return dao.selectMy(userid);
	}

	public List<loginDto> selectEnabledUser() {
		return dao.selectEnabledUser();
	}

	public int updateRole(String userid, String userrole) {
		return dao.updateRole(userid, userrole);
	}

	public loginDto login(String userid, String password) {
		return dao.login(userid, password);
	}

	public int idCheck(String userid) {
		return dao.idCheck(userid);
	}

	public int emailCheck(String useremail) {

		return dao.emailCheck(useremail);
	}

	public int insertUser(loginDto dto) {
		return dao.insertUser(dto);
	}

	

	public int updateUser(loginDto dto) {
		return dao.updateUser(dto);
	}

	public int deleteUser(String userid) {
		return dao.deleteUser(userid);
	}

	public int enabledout(String userenabled) {
		return dao.enabledout(userenabled);
	}

	public int snslogin(String useremail) {

		return dao.snslogin(useremail);
	}

	public loginDto snslogin2(String useremail) {

		return dao.snslogin2(useremail);
	}
}
