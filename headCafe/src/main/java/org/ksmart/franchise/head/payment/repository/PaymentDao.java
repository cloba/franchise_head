package org.ksmart.franchise.head.payment.repository;

import java.util.List;

import org.ksmart.franchise.head.payment.model.Payment;
import org.ksmart.franchise.head.payment.model.PaymentSearch;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentDao {
	// 결제방식 리스트를 불러오는 메서드입니다
	public List<Payment> viewPaymentList(PaymentSearch search);
	// 결제방식 상세 데이터를 불러오는 메서드입니다
	public Payment getPaymentDetail(String payMethodCode);
}
