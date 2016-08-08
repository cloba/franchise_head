package org.ksmart.franchise.head.royaltyOverdue.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoyaltyOverdueDaoImpl implements RoyaltyOverdueDao{

	private final String NS = "org.ksmart.franchise.head.royaltyOverdue.repository.RoyaltyOverdueMapper"; 
	@Autowired
	private SqlSessionTemplate sqlSessionRoyaltyOverdue;
	
	//로얄티 연체 리스트 조회 메서드
	@Override
	public List<RoyaltyOverdue> royaltyOverdueList(Search search) {
		System.out.println("RoyaltyOverdueDaoImpl의 royaltyOverdueList메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		return sqlSessionRoyaltyOverdue.selectList(NS+".selectRoyaltyOverdueList", map);
	
	 
	}
}
