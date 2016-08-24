package org.ksmart.franchise.head.delivery.service;

import java.util.List;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.util.Search;

public interface DeliveryService {
	
	//배송리스트를 조회하는 메서드
	List<Delivery> viewDeliveryListService(Search search);

	//배송 상세정보를 조회 하는 메서드
	Delivery getDeliveryDetailService(String deliveryCode);
	
	//배송을 요청하는 메서드
	void requestDeliveryService(String[] checkedOrders, String[] inteCode, int[] headSellQuantity,String headStaffId);
	
	//배송상태를 변경 하는 메서드
	void updateStatusService(String[] checked, String status, String headStaffId);
}
