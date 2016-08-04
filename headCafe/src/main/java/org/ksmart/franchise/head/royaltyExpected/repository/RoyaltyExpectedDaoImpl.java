package org.ksmart.franchise.head.royaltyExpected.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.royaltyExpected.model.RoyaltyExpected;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoyaltyExpectedDaoImpl implements RoyaltyExpectedDao{

	private final String NS = "org.ksmart.franchise.head.stock.repository.StockMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionRoyaltyExpected;
	
	
	@Override
	public List<RoyaltyExpected> royaltyExpectedList(RoyaltyExpected royaltyExpected, Search search) {
		System.out.println("RoyaltyExpectedDaoImpl의 royaltyExpectedList메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("royaltyExpected", royaltyExpected);
		return sqlSessionRoyaltyExpected.selectList(NS+".selectRoyaltyExpectedList", map);
	}

}
