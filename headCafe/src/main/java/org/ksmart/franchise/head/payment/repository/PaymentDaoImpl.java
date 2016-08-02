package org.ksmart.franchise.head.payment.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.payment.model.Payment;
import org.ksmart.franchise.head.payment.model.PaymentSearch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
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

}
