package org.ksmart.franchise.head.royalty.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.royalty.model.Royalty;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoyaltyDaoImpl implements RoyaltyDao{

	private final String NS = "org.ksmart.franchise.head.stock.repository.StockMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionRoyalty;
	
	
	@Override
	public List<Royalty> RoyaltyList(Royalty Royalty, Search search) {
		System.out.println("RoyaltyDaoImpl의 RoyaltyList메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("Royalty", Royalty);
		return sqlSessionRoyalty.selectList(NS+".selectRoyaltyList", map);
	}

}
