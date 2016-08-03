package org.ksmart.franchise.head.delivery.service;

import java.util.List;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.Deliverysearch;
import org.ksmart.franchise.head.delivery.repository.DeliveryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("deliveryService")
public class DeliveryServiceImpl implements DeliveryService {
	
	@Autowired
	private DeliveryDao deliveryDao;

	@Override
	public List<Delivery> viewDeliveryListService(Deliverysearch search) {
		System.out.println("DeliveryServiceImpl의 viewDeliveryListService메서드 호출");
		
		return deliveryDao.viewDeliveryList(search);
	}

	@Override
	public Delivery getDeliveryDetailService(String deliveryCode) {
		System.out.println("DeliveryServiceImpl의 getDeliveryDetailService메서드 호출");
		
		return deliveryDao.getDeliveryDetail(deliveryCode);	
	}

}
