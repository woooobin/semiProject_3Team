package com.poosil.pay.dao;

import java.util.List;

import com.poosil.pay.dto.PayDto;

public interface PayDao {
	
	String ADMIN_PAYMENT_LIST_SQL = " SELECT ORDERSEQ, USERID, PROJECTITEMSEQ, QUANTITY, PRICE, TOTALPRICE, ORDERDATE "
								  + " FROM ORDERPAGE "
								  + " ORDER BY ORDERSEQ DESC ";
	
	String INSERT_ADMIN_PAYMENT_SQL = " INSERT INTO ORDERPAGE "
									+ " VALUES(ORDERSEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE) ";
	
	String CUSTOMER_PAYMENT_LIST_SQL = " SELECT USERID, PROJECTITEMSEQ, QUANTITY, PRICE, TOTALPRICE, ORDERDATE "
									 + " FROM ORDERPAGE "
									 + " WHERE USERID = ? " 
									 + " ORDER BY ORDERDATE DESC ";

public List<PayDto> adminPaymentList();
public int insertadminPayment(PayDto dto);
public List<PayDto> customerPaymentList();

}
