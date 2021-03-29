package com.poosil.pay.biz;

import java.util.List;

import com.poosil.pay.dao.PayDao;
import com.poosil.pay.dao.PayDaoImpl;
import com.poosil.pay.dto.PayDto;

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
	public List<PayDto> customerPaymentList() {
		
		return dao.customerPaymentList();
	}
	
	

}
