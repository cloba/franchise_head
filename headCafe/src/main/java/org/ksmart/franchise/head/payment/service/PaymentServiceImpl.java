package org.ksmart.franchise.head.payment.service;

import java.util.List;

import org.ksmart.franchise.head.payment.model.Payment;
import org.ksmart.franchise.head.payment.model.PaymentSearch;
import org.ksmart.franchise.head.payment.repository.PaymentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;

	@Override
	public List<Payment> viewPaymentListService(PaymentSearch search) {
		System.out.println("PaymentServiceImpl의 viewPaymentListService메서드 호출");
		
		return paymentDao.viewPaymentList(search);
	}

}
