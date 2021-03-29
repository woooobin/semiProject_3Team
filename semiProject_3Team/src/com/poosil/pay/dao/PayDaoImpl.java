package com.poosil.pay.dao;

import java.util.ArrayList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.poosil.pay.dto.PayDto;
import com.poosil.pay.db.SqlMapConfig_Pay;

public class PayDaoImpl extends SqlMapConfig_Pay implements PayDao {
	private String namespace = "paymapper.";

	@Override
	public List<PayDto> adminPaymentList() {
		
		List<PayDto> list = new ArrayList<PayDto>();
		
		SqlSession session = null;
		
		try {
		session = getSqlSessionFactory().openSession(false);
		
		list = session.selectList(namespace+"adminPaymentList");
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			
			session.close();
		}
		return list;
	}

	@Override
	public int insertadminPayment(PayDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.insert(namespace + "insertadminPayment", dto);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<PayDto> customerPaymentList() {
		
		List<PayDto> list = new ArrayList<PayDto>();
		
		SqlSession session = null;
		
		try {
		session = getSqlSessionFactory().openSession(false);
		
		list = session.selectList(namespace+"cutomerPaymentList");
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	
	

}