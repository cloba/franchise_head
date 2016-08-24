package org.ksmart.franchise.head.sell.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.sell.model.ReceivedOrder;
import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sellDao")
public class SellDaoImpl implements SellDao {
	
	private final String NS = "org.ksmart.franchise.head.sell.repository.SellMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionSell;
	Logger log = Logger.getLogger(this.getClass());

	@Override
	//본사의 판매 내역 리스트를 불러오는 메서드입니다
	public List<Sell> viewSellList(Search search) {
		log.debug("SellDaoImpl의 viewSellList 메서드 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionSell.selectList(NS+".selectSell", map);
	}

	@Override
	//본사의 판매내역 하나의 상세내역을 불러오는 메서드입니다
	public Sell getSellDetail(String headSellCode) {
		log.debug("SellDaoImpl의 getSellDetail 메서드 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headSellCode", headSellCode);
		
		return sqlSessionSell.selectOne(NS+".selectOneSell", map);
	}

	@Override
	//본사가 받은 주문 리스트를 불러오는 메서드입니다
	public List<ReceivedOrder> viewReceivedOrder(Search search) {
		log.debug("SellDaoImpl의 viewReceivedOrder 메서드 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionSell.selectList(NS+".selectReceivedOrder", map);
	}

	@Override
	//본사가 주문을 승인하는 메서드입니다
	public int confirmOrder(Sell sell) {
		log.debug("SellDaoImpl의 confirmOrder 메서드 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sell", sell);
		int result = sqlSessionSell.update(NS+".confirmOrder", map);
		
		return result;
	}

	@Override
	//주문승인을 취소하는 메서드입니다
	public int cancelConfirm(Sell sell) {
		log.debug("SellDaoImpl의 cancelConfirm 메서드 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sell", sell);
		int result = sqlSessionSell.update(NS+".cancelConfirm", map);
//		log.debug("cancelConfirm의 리턴: "+result);
		
		return result;
	}

	@Override
	//승인한 주문건을 판매내역에 추가하는 메서드입니다
	public int addSell(Sell sell) {
		log.debug("SellDaoImpl의 addSell 메서드 호출");
		int result = sqlSessionSell.insert(NS+".addSell", sell);
	//	log.debug("addSell의 리턴: "+result);
		
		return result;
	}

	@Override
	//판매내역 추가를 취소합니다
	public void cancelSell(String code) {
		log.debug("SellDaoImpl의 deleteSell 메서드 호출");
		sqlSessionSell.delete(NS+".cancelSell", code);
	}

	//새로 들어온 주문 개수를 불러옵니다
	@Override
	public int getNewOrderCount() {
		log.debug("SellDaoImpl의 getNewOrderCount 메서드 호출");
		int result = sqlSessionSell.selectOne(NS+".getCount");
		return result;
	}

}
