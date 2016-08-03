package org.ksmart.franchise.head.delivery.repository;

import java.util.List;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.Deliverysearch;

public interface DeliveryDao {
	//배송리스트를 불러오는 메서드입니다
	public List<Delivery> viewDeliveryList(Deliverysearch search);
	//배송 상세 데이터를 불러오는 메서드입니다
	public Delivery getDeliveryDetail(String deliveryCode);
}
