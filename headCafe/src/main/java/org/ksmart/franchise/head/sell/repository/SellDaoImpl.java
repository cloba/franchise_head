package org.ksmart.franchise.head.sell.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDaoImpl implements SellDao {
	
	private final String NS = "org.ksmart.franchise.head.sell.repository.SellMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionSell;

	@Override
	// 본사의 판매 내역 리스트를 불러오는 메서드입니다
	public List<Sell> viewSellList(Search search) {
		System.out.println("SellDaoImpl의 viewSellList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionSell.selectList(NS+".selectSell", map);
	}

	@Override
	// 본사의 판매내역 하나의 상세내역을 불러오는 메서드입니다
	public Sell getSellDetail(String headSellCode) {
		System.out.println("SellDaoImpl의 getSellDetail 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headSellCode", headSellCode);
		
		return sqlSessionSell.selectOne(NS+".selectOneSell", map);
	}

}
