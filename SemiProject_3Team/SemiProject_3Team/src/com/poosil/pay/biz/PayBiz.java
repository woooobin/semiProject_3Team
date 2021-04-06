package com.poosil.pay.biz;

import java.util.List;

import com.poosil.pay.dto.PayDto;
import com.poosil.projects.dto.ProjectDto;
import com.poosil.projects.dto.ProjectItemDto;

public interface PayBiz {

	public List <PayDto> adminPaymentList();
	public int insertadminPayment(PayDto dto);
	public List<PayDto> customerPaymentList(String userId);
	public ProjectItemDto selectProjectItem(int projectItemSeq);
	public int updateTotalPrice(PayDto dto);
}
