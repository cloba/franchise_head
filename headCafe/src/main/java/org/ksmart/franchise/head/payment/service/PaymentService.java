package org.ksmart.franchise.head.payment.service;

import java.util.List;

import org.ksmart.franchise.head.payment.model.Payment;
import org.ksmart.franchise.head.payment.model.PaymentSearch;
import org.springframework.stereotype.Service;

@Service
public interface PaymentService {
	// 결제방식 리스트를 보여줍니다
	public List<Payment> viewPaymentListService(PaymentSearch search);
	// 결제방식 상세내용을 보여줍니다
	public Payment getPaymentDetailService(String payMethodCode);
}
