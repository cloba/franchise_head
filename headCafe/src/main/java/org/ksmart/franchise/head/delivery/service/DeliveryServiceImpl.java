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
	public void requestDeliveryService(String[] checkedOrders, String[] inteCode, int headSellQuantity){
		System.out.println("DeliveryServiceImpl의 requestDeliveryService메서드 호출");
		DeliveryCommand deliveryCommand = new DeliveryCommand();
		String orderCode = null;
		String stockPK = null;
		
		try{
			for(int i = 0; i<checkedOrders.length; i++){
				orderCode = checkedOrders[i];
			//	System.out.println(orderCode+" <==== orderCode");
				deliveryCommand.setReceivedOrderCode(orderCode);
				//1.상품 배송정보를 추가합니다
				int result1 = deliveryDao.requestDelivery(deliveryCommand);	
				System.out.println("result1 ===> "+result1);
				if( result1 != 1 ){
					System.out.println("result1 예외처리됨 ===> "+result1);
					Exception e = new Exception();
					throw e; 
				}else{
					//2.배송 추가에 따른 해당 판매 내역의 배송여부 컬럼을 Y로 수정합니다
					int result2 = deliveryDao.updateSellDelivery(orderCode, "Y");
					if( result2 != 1 ){
						System.out.println("result2 예외처리됨 ===> "+result2);
						Exception e = new Exception();
						throw e; 
					}
				}
			}
			
			//3.판매내역에 따라 재고를 차감합니다
			for(int i = 0; i<inteCode.length; i++){
				System.out.println("for1무 돌아감");
				for(int j = 0; j<headSellQuantity; j++){
					System.out.println("for2문 돌아감");
					stockPK = deliveryDao.randomPKFromStock(inteCode[i]);
					System.out.println("inteCode["+i+"] =====> "+inteCode[i]);
					int result3 = deliveryDao.updateStock(stockPK);
					if( result3 != 1 ){
						System.out.println("result3 예외처리됨 ===> "+result3);
						deliveryDao.cancelUpdateStock(stockPK);
						Exception e = new Exception();
						throw e; 
					}
				}
			}
			
		}catch (Exception e){
			System.out.println("catch..");
			deliveryDao.deleteDelivery(deliveryCommand.getDeliveryCode());
			deliveryDao.updateSellDelivery(orderCode, "N");
			deliveryDao.cancelUpdateStock(stockPK);
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
