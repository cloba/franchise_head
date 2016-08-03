package org.ksmart.franchise.head.delivery.service;

import java.util.List;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.Deliverysearch;

public interface DeliveryService {
	public List<Delivery> viewDeliveryListService(Deliverysearch search);
	
	public Delivery getDeliveryDetailService(String deliveryCode);
}
