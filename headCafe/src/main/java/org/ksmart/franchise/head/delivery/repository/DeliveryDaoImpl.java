package org.ksmart.franchise.head.delivery.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.Deliverysearch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDaoImpl implements DeliveryDao {

	private final String NS = "org.ksmart.franchise.head.delivery.repository.DeliveryMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionDelivery;
	
	@Override
	public List<Delivery> viewDeliveryList(Deliverysearch search) {
		System.out.println("DeliveryDaoImpl의 viewDeliveryList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionDelivery.selectList(NS+".selectDelivery", map);
	}

	@Override
	public Delivery getDeliveryDetail(String deliveryCode) {
		System.out.println("DeliveryDaoImpl의 getDeliveryDetail 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deliveryCode", deliveryCode);
		
		return sqlSessionDelivery.selectOne(NS+".selectOneDelivery", map);
	}

}
