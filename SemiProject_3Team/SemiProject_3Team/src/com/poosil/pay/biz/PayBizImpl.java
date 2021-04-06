package com.poosil.pay.biz;

import java.util.List;

import com.poosil.pay.dao.PayDao;
import com.poosil.pay.dao.PayDaoImpl;
import com.poosil.pay.dto.PayDto;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;

public class PayBizImpl implements PayBiz {

	PayDao dao = new PayDaoImpl();
	@Override
	public List<PayDto> adminPaymentList() {
		
		return dao.adminPaymentList();
	}

	@Override
	public int insertadminPayment(PayDto dto) {
		
		return dao.insertadminPayment(dto);
	}
	
	
	@Override
	public List<PayDto> customerPaymentList(String userId) {
		
		return dao.customerPaymentList(userId);
	}
	
	@Override
	public ProjectItemDto selectProjectItem(int projectItemSeq) {
		
		return dao.selectProjectItem(projectItemSeq);
	}
	
	@Override
	public int updateTotalPrice(String projectId , int price) {
		// TODO Auto-generated method stub
		return dao.updateTotalPrice(projectId,price);
	}
	

}
