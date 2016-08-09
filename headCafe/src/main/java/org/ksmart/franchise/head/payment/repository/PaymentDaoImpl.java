package org.ksmart.franchise.head.payment.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.payment.model.Payment;
import org.ksmart.franchise.head.payment.model.PaymentCommand;
import org.ksmart.franchise.head.payment.model.PaymentSearch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("paymentDao")
public class PaymentDaoImpl implements PaymentDao {
	
	private final String NS = "org.ksmart.franchise.head.payment.repository.PaymentMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionPayment;

	@Override
	public List<Payment> viewPaymentList(PaymentSearch search) {
		System.out.println("PaymentDaoImpl의 viewPaymentList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionPayment.selectList(NS+".selectPayment", map);
	}

	@Override
	public Payment getPaymentDetail(String payMethodCode) {
		System.out.println("PaymentDaoImpl의 getPaymentDetail 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payMethodCode", payMethodCode);
		
		return sqlSessionPayment.selectOne(NS+".selectOnePayment", map);
	}

	@Override
	//결제방식을 등록합니다
	public void addPayment(PaymentCommand paymentCommand) {
		System.out.println("PaymentDaoImpl의 addPayment 메서드 호출");		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pay", paymentCommand);
		
		sqlSessionPayment.insert(NS+".insertPayment", map);
	}

	@Override
	//결제방식을 수정합니다 (미적용으로 변경)
	public void modifyPayment(String payMethodCode) {
		System.out.println("PaymentDaoImpl의 modifyPayment 메서드 호출");		
		
		sqlSessionPayment.update(NS+".updatePayment", payMethodCode);
	}

}
