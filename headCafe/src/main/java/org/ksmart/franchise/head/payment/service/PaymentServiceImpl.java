package org.ksmart.franchise.head.payment.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.payment.model.Payment;
import org.ksmart.franchise.head.payment.model.PaymentCommand;
import org.ksmart.franchise.head.payment.model.PaymentSearch;
import org.ksmart.franchise.head.payment.repository.PaymentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;
	Logger log = Logger.getLogger(this.getClass());

	@Override
	public List<Payment> viewPaymentListService(PaymentSearch search) {
		log.debug("PaymentServiceImpl의 viewPaymentListService메서드 호출");
		
		return paymentDao.viewPaymentList(search);
	}

	@Override
	public Payment getPaymentDetailService(String payMethodCode) {
		log.debug("PaymentServiceImpl의 getPaymentDetailService메서드 호출");
		
		return paymentDao.getPaymentDetail(payMethodCode);	
	}

	@Override
	//결제방식을 등록합니다
	public void addPaymentService(PaymentCommand paymentCommand) {
		log.debug("PaymentServiceImpl의 addPaymentService메서드 호출");		
		paymentDao.addPayment(paymentCommand);
	}

	@Override
	//결제방식을 수정합니다 (미적용으로 변경)
	public void modifyPaymentService(String payMethodCode) {
		log.debug("PaymentServiceImpl의 modifyPaymentService메서드 호출");		
		paymentDao.modifyPayment(payMethodCode);		
	}

}
