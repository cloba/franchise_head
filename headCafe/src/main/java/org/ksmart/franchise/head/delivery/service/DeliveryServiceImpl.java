package org.ksmart.franchise.head.delivery.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.accounting.model.AccountingCommand;
import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.DeliveryCommand;
import org.ksmart.franchise.head.delivery.repository.DeliveryDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("deliveryService")
public class DeliveryServiceImpl implements DeliveryService {
	
	@Autowired
	private DeliveryDao deliveryDao;
	Logger log = Logger.getLogger(this.getClass());

	@Override
	public List<Delivery> viewDeliveryListService(Search search) {
		log.debug("DeliveryServiceImpl의 viewDeliveryListService메서드 호출");
		return deliveryDao.viewDeliveryList(search);
	}

	@Override
	public Delivery getDeliveryDetailService(String deliveryCode) {
		log.debug("DeliveryServiceImpl의 getDeliveryDetailService메서드 호출");
		return deliveryDao.getDeliveryDetail(deliveryCode);	
	}

	@Override
	//배송을 요청하는 메서드입니다
	public void requestDeliveryService(String[] checkedOrders, String[] inteCode, int[] headSellQuantity, String headStaffId) throws Exception{
		log.debug("DeliveryServiceImpl의 requestDeliveryService메서드 호출");
		DeliveryCommand deliveryCommand = new DeliveryCommand();
		String orderCode = null;
		String stockPK = null;
		
		try{
			for(int i = 0; i<checkedOrders.length; i++){
				orderCode = checkedOrders[i];
			//	System.out.println(orderCode+" <==== orderCode");
				deliveryCommand.setReceivedOrderCode(orderCode);
				
				//1.상품 배송정보를 추가합니다
				deliveryCommand.setHeadStaffId(headStaffId);
				int result1 = deliveryDao.requestDelivery(deliveryCommand);	
				log.debug("result1 ===> "+result1);
				if( result1 != 1 ){
					log.debug("result1 예외처리됨 ===> "+result1);
					Exception e = new Exception();
					throw e; 
				}else{
					//2.배송 추가에 따른 해당 판매 내역의 배송여부 컬럼을 Y로 수정합니다
					int result2 = deliveryDao.updateSellDelivery(orderCode, "Y");
					if( result2 != 1 ){
						log.debug("result2 예외처리됨 ===> "+result2);
						Exception e = new Exception();
						throw e; 
					}
				}
			}
			
			//3.판매한 내역을 회계에 추가합니다
			for(int i = 0; i<inteCode.length; i++){
				int sum = deliveryDao.getSum(inteCode[i], headSellQuantity[i]);
				AccountingCommand accountingCommand = new AccountingCommand();
				accountingCommand.setHeadAccountSum(sum);
				int result3 = deliveryDao.insertAccountBySell(accountingCommand);
				log.debug(result3+" <===== result3");
				String headAccountCode = accountingCommand.getHeadAccountCode();
				if( result3 != 1 ){
					log.debug("result3 예외처리됨 ===> "+result3);
					deliveryDao.cancelAccountBySell(headAccountCode);
					Exception e = new Exception();
					throw e; 
				}
			}
			
			//4.판매내역에 따라 재고를 차감합니다
			//inteCode: 상품번호 , headSellQuantity: 요청수량
			for(int i = 0; i<inteCode.length; i++){
			//	log.debug("for1문 돌아감");
				
				//요청 수량만큼 재고에서 해당상품 상태를 출고로 변경합니다
				for(int j = 0; j<headSellQuantity[i]; j++){
					
					//해당상품 중 재고가 있는 상품의 stock일련번호를 임의로 받습니다
					stockPK = deliveryDao.randomPKFromStock(inteCode[i]);
				//	log.debug("inteCode["+i+"] =====> "+inteCode[i]);
				//	log.debug("stockPK =================> "+stockPK);
					
					//재고에서 해당 상품의 out여부를 N->Y으로 변경합니다
					int result4 = deliveryDao.updateStock(stockPK);
				//	log.debug(result4+" <=================result4");
					
					//실패시 Y->N으로 되돌리고 예외를 던집니다
					if( result4 != 1 ){
						log.debug("result4 예외처리됨 ===> "+result4);
						deliveryDao.cancelUpdateStock(stockPK);
						Exception e = new Exception();
						throw e; 
					}
				}
			}
			
		}catch (Exception e){
			log.debug("catch..");
			for(int i = 0; i<checkedOrders.length; i++){
				orderCode = checkedOrders[i];
				deliveryCommand.setReceivedOrderCode(orderCode);
				deliveryDao.deleteDelivery(deliveryCommand.getDeliveryCode());
				deliveryDao.updateSellDelivery(orderCode, "N");
				throw e;
			}
		}
	}

	@Override
	//배송상태정보를 변경하는 메서드입니다
	public void updateStatusService(String[] checked, String deliveryStatus, String headStaffId) {
		log.debug("DeliveryServiceImpl의 requestDeliveryService메서드 호출");
		for(String deliveryCode : checked){
		//	log.debug(deliveryCode+" <==== deliveryCode");
			
			DeliveryCommand deliveryCommand = new DeliveryCommand();
			deliveryCommand.setDeliveryCode(deliveryCode);
			deliveryCommand.setDeliveryStatus(deliveryStatus);
			deliveryCommand.setHeadStaffId(headStaffId);
			deliveryDao.updateStatus(deliveryCommand);	
		}
	}
}