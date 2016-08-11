package org.ksmart.franchise.head.delivery.repository;

import java.util.List;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.DeliveryCommand;
import org.ksmart.franchise.head.delivery.model.Deliverysearch;

public interface DeliveryDao {
	//배송리스트를 불러오는 메서드입니다
	List<Delivery> viewDeliveryList(Deliverysearch search);
	//배송 상세 데이터를 불러오는 메서드입니다
	Delivery getDeliveryDetail(String deliveryCode);
	//배송을 요청하는 메서드입니다 (배송 테이블에 insert)
	int requestDelivery(DeliveryCommand deliveryCommand);
	//요청한 배송을 취소합니다
	void deleteDelivery(String deliveryCode);
	//배송상태를 변경하는 메서드입니다
	void updateStatus(DeliveryCommand deliveryCommand);
	//판매내역의 배송요청여부를 변경하는 메서드입니다
	int updateSellDelivery(String headSellCode, String status);
	//배송된 상품만큼 재고에서 차감하는 메서드입니다
	int updateStock(String stockPK);
	//재고차감을 취소합니다
	void cancelUpdateStock(String stockPK);
	//재고 테이블에서 임의의 PK값을 뽑습니다
	String randomPKFromStock(String inteCode);
	
}
