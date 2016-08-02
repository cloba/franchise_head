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
	public List<Sell> viewSellList(Search search) {
		System.out.println("SellDaoImpl의 viewSellList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionSell.selectList(NS+".selectSell", map);
	}

}
