package org.ksmart.franchise.head.payment.service;

import java.util.List;

import org.ksmart.franchise.head.payment.model.Payment;
import org.ksmart.franchise.head.payment.model.PaymentCommand;
import org.ksmart.franchise.head.util.Search;
import org.springframework.stereotype.Service;

@Service
public interface PaymentService {
	// 결제방식 리스트를 보여줍니다
	public List<Payment> viewPaymentListService(Search search);
	// 결제방식 상세내용을 보여줍니다
	public Payment getPaymentDetailService(String payMethodCode);
	//결제방식을 등록합니다
	void addPaymentService(PaymentCommand paymentCommand);
	//결제방식을 수정합니다 (미적용으로 변경)
	void modifyPaymentService(String payMethodCode);
}
