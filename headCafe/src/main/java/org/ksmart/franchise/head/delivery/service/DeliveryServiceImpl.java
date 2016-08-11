package org.ksmart.franchise.head.delivery.service;

import java.util.List;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.DeliveryCommand;
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

	@Override
	//배송을 요청하는 메서드입니다
	public void requestDeliveryService(String[] checkedOrders, String[] inteCode, int headSellQuantity) {
		System.out.println("DeliveryServiceImpl의 requestDeliveryService메서드 호출");
		DeliveryCommand deliveryCommand = new DeliveryCommand();
		String orderCode = null;
		
		try{
			for(int i = 0; i<checkedOrders.length; i++){
				orderCode = checkedOrders[i];
			//	System.out.println(orderCode+" <==== orderCode");
				deliveryCommand.setReceivedOrderCode(orderCode);
				//배송 테이블에 새로운 row를 추가함
				int result1 = deliveryDao.requestDelivery(deliveryCommand);	
				System.out.println("result1 ===> "+result1);
				if( result1 != 1 ){
					System.out.println("result1 ===> "+result1);
					System.out.println("deliveryCommand ===> "+deliveryCommand.getDeliveryCode());
					deliveryDao.deleteDelivery(deliveryCommand.getDeliveryCode());
				}else{
					//해당 판매 내역의 배송여부 컬럼을 수정함
					int result2 = deliveryDao.updateSellDelivery(orderCode, "Y");
					if( result2 != 1 ){
						System.out.println("result2 ===> "+result2);
						deliveryDao.deleteDelivery(deliveryCommand.getDeliveryCode());
						deliveryDao.updateSellDelivery(orderCode, "N");
					System.out.println("result2 오류");
					deliveryDao.deleteDelivery(deliveryCommand.getDeliveryCode());
					deliveryDao.updateSellDelivery(orderCode, "N");
					}
				}
			}
			//판매내역에 따라 재고를 차감합니다
			for(int i = 0; i<inteCode.length; i++){
				for(int j = 0; j<headSellQuantity; j++){
					int result3 = deliveryDao.updateStock(inteCode[i]);
					if( result3 != 1 ){
						
					}
				}
				
			}
			
		}catch (Exception e){
			System.out.println("catch..");
			deliveryDao.deleteDelivery(deliveryCommand.getDeliveryCode());
			deliveryDao.updateSellDelivery(orderCode, "N");
		}
	}

	@Override
	//배송상태정보를 변경하는 메서드입니다
	public void updateStatusService(String[] checked, String status) {
		System.out.println("DeliveryServiceImpl의 requestDeliveryService메서드 호출");
		for(String deliveryCode : checked){
			System.out.println(deliveryCode+" <==== deliveryCode");
			
			DeliveryCommand deliveryCommand = new DeliveryCommand();
			deliveryCommand.setDeliveryCode(deliveryCode);
			deliveryCommand.setDeliveryStatus(status);
			deliveryDao.updateStatus(deliveryCommand);	
		}
		
	}

}
