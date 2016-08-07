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

	private final String NS = "org.ksmart.franchise.head.royalty.repository.RoyaltyMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionRoyalty;
	
	//로얄티 리스트 구하는 메서드
	@Override
	public List<Royalty> royaltyList(Royalty royalty, Search search) {
		System.out.println("RoyaltyDaoImpl의 RoyaltyList메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("royalty", royalty);
		
		return sqlSessionRoyalty.selectList(NS+".selectRoyaltyList", map);
	}

	//가장 최근에 로얄티를 지불한 월 구하는 메서드
	@Override
	public String currentlypaiedMonth(String contractCode) {
		System.out.println("RoyaltyDaoImpl의 currentlypaiedMonth메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contractCode", contractCode);
		
	//	System.out.println("String resultType확인: "+sqlSessionRoyalty.selectList(NS+".selectCurrentlypaiedMonth", map));
		
		return sqlSessionRoyalty.selectOne(NS+".selectCurrentlypaiedMonth", map);
	}

	//본사와 가맹의 계약돼 있는 계약 건수 구하는 메서드 
	@Override
	public String getContractCount() {
		return sqlSessionRoyalty.selectOne(NS+".selectContractCount");
	}

	//지난달 지불할 로얄티가 입력하는 메서드
	@Override
	public int insertRoyalty(Royalty royalty) {
		System.out.println("RoyaltyDaoImpl의 insertRoyalty");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("royalty", royalty);
		return sqlSessionRoyalty.insert(NS+".insertRoyalty", map);
				
		
	}

	@Override
	public Royalty royaltyDetail(Royalty royalty) {
		System.out.println("RoyaltyDaoImpl의 royaltyDetail");
		System.out.println("RoyaltyCode :"+royalty.getRoyaltyCode());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("royalty", royalty);
		return sqlSessionRoyalty.selectOne(NS+".selectRoyaltyDetail", map);
	}

}
