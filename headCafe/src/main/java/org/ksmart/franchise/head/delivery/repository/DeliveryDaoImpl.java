package org.ksmart.franchise.head.delivery.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.delivery.model.Delivery;
import org.ksmart.franchise.head.delivery.model.DeliveryCommand;
import org.ksmart.franchise.head.delivery.model.Deliverysearch;
import org.ksmart.franchise.head.stock.model.Stock;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("DeliveryDao")
public class DeliveryDaoImpl implements DeliveryDao {

	private final String NS = "org.ksmart.franchise.head.delivery.repository.DeliveryMapper";
	private final String NSSell = "org.ksmart.franchise.head.sell.repository.SellMapper";
	private final String NSStock = "org.ksmart.franchise.head.stock.repository.StockMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionDelivery;
	@Autowired
	private SqlSessionTemplate sqlSessionSell;
	@Autowired
	private SqlSessionTemplate sqlSessionStock;
	
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

	@Override
	//배송을 요청하는 메서드입니다 (배송 테이블에 insert)
	public int requestDelivery(DeliveryCommand deliveryCommand) {
		System.out.println("DeliveryDaoImpl의 requestDelivery 메서드 호출");
		return sqlSessionDelivery.insert(NS+".addDelivery", deliveryCommand);
	}

	@Override
	//배송 상태를 변경하는 메서드입니다
	public void updateStatus(DeliveryCommand deliveryCommand) {
		System.out.println("DeliveryDaoImpl의 updateStatus 메서드 호출");
		sqlSessionDelivery.update(NS+".updateStatus", deliveryCommand);		
	}

	@Override
	//판매테이블의 배송여부를 변경하는 메서드입니다
	public int updateSellDelivery(String headSellCode, String status) {
		System.out.println("DeliveryDaoImpl의 updateSellDelivery 메서드 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headSellCode", headSellCode);
		map.put("status", status);
		System.out.println("headSellCode ===> "+headSellCode);
		System.out.println("status ===> "+status);
		System.out.println("map ===> "+map);
		return sqlSessionSell.update(NSSell+".updateSellDelivery", map);				
	}

	@Override
	//요청한 배송을 취소합니다 (배송테이블에 insert된 row삭제)
	public void deleteDelivery(String deliveryCode) {
		System.out.println("DeliveryDaoImpl의 deleteDelivery 메서드 호출");
		sqlSessionDelivery.delete(NS+".deleteDelivery", deliveryCode);		
	}
	
	@Override
	//재고 테이블에서 임의의 PK값을 뽑습니다
	public String randomPKFromStock(String inteCode){
		System.out.println("DeliveryDaoImpl의 randomPKFromStock 메서드 호출");
		System.out.println("randonPK DAO의 inteCode ======> "+inteCode);
		Stock stock = sqlSessionDelivery.selectOne(NSStock+".randomStockPK", inteCode);	
		String stockPK = stock.getSpecificItemCode();
		System.out.println("randonPK DAO의 stockPK ======> "+stockPK);
		return stockPK;
	}

	@Override
	//배송된 상품만큼 재고에서 차감하는 메서드입니다
	public int updateStock(String stockPK) {
		System.out.println("DeliveryDaoImpl의 updateStock 메서드 호출");
		return sqlSessionStock.update(NSStock+".updateStock", stockPK);			
	}

	@Override
	//재고차감을 취소합니다
	public void cancelUpdateStock(String stockPK) {
		System.out.println("DeliveryDaoImpl의 cancelUpdateStock 메서드 호출");
		sqlSessionStock.update(NSStock+".cancelUpdateStock", stockPK);			
	}
	
	
	
	

}
