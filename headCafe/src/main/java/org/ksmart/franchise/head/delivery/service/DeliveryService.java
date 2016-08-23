package org.ksmart.franchise.head.delivery.service;

import java.util.List;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.Deliverysearch;

public interface DeliveryService {
	List<Delivery> viewDeliveryListService(Deliverysearch search);
	
	Delivery getDeliveryDetailService(String deliveryCode);
	
	void requestDeliveryService(String[] checkedOrders, String[] inteCode, int[] headSellQuantity);
	
	void updateStatusService(String[] checked, String status, String headStaffId);
}
