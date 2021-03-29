package com.poosil.pay.biz;

import java.util.List;

import com.poosil.pay.dto.PayDto;

public interface PayBiz {

	public List <PayDto> adminPaymentList();
	public int insertadminPayment(PayDto dto);
	public List<PayDto> customerPaymentList();
	
}
