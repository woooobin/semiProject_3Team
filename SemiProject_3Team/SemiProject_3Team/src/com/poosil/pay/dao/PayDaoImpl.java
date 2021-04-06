package com.poosil.pay.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.poosil.pay.dto.PayDto;
import com.poosil.projects.dto.ProjectItemDto;
import com.poosil.util.db.SqlMapConfig;


public class PayDaoImpl extends SqlMapConfig implements PayDao {
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
		
		/*
		System.out.println(dto.getQuantity());
		System.out.println(dto.getUserId());
		System.out.println(dto.getProjectItemSeq());
		System.out.println(dto.getAddress());
		System.out.println(dto.getPhone());
		System.out.println(dto.getTotalPrice());
		System.out.println(dto.getPrice());
		System.out.println(dto.getDeliveryFee());
		System.out.println(dto.getPurchasePrice());
		*/
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.insert(namespace + "insertadminPayment", dto);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public List<PayDto> customerPaymentList(String userId) {
		
		List<PayDto> list = new ArrayList<PayDto>();
		
		SqlSession session = null;
		
		try {
		session = getSqlSessionFactory().openSession(false);
		
		list = session.selectList(namespace+"customerPaymentList", userId);
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	@Override
	public ProjectItemDto selectProjectItem(int projectItemSeq) {
		SqlSession session = null;
		
		ProjectItemDto projectitemdto = new ProjectItemDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			
			projectitemdto = session.selectOne(namespace+"selectProjectItem", projectItemSeq);
			System.out.println("select projectitemdto =" + projectitemdto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return projectitemdto;
	}

	@Override
	public int updateTotalPrice(PayDto dto) {
		
		int updateres = 0;
		
		try{
			SqlSession session = getSqlSessionFactory().openSession(true);
			System.out.println("toalprice 1 = "+dto.getTotalPrice());
			System.out.println("price 1 = "+dto.getPrice());
			System.out.println("projectItemSeq 1  = "+dto.getProjectItemSeq());
			
			Map<String, String >param = new HashMap<String, String>();
			param.put("price", dto.getPurchasePrice()+"");
			param.put("projectItemSeq", dto.getProjectItemSeq()+"");
			
			updateres = session.update(namespace+"updateTotalPrice", dto);
			System.out.println("toalprice 2 = "+dto.getTotalPrice());
			System.out.println("price 2 = "+dto.getPrice());
			System.out.println("projectItemSeq 2 = "+dto.getProjectItemSeq());
			System.out.println("updateres = " + updateres);
	
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} 
		return updateres;
	}

	
	

}
