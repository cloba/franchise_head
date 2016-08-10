package org.ksmart.franchise.head.royaltyOverdue.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.royalty.model.RoyaltyOverdueAdd;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoyaltyOverdueDaoImpl implements RoyaltyOverdueDao{

	private final String NS = "org.ksmart.franchise.head.royaltyOverdue.repository.RoyaltyOverdueMapper"; 
	private final String S = "org.ksmart.franchise.head.royalty.repository.RoyaltyMapper";
	@Autowired
	private SqlSessionTemplate sqlSessionRoyaltyOverdue;
	
	@Autowired
	private SqlSessionTemplate sqlSessionRoyalty;
	
	//로얄티 연체 리스트 조회 메서드
	@Override
	public List<RoyaltyOverdue> royaltyOverdueList(Search search, List<RoyaltyOverdueAdd> list) {
		System.out.println("RoyaltyOverdueDaoImpl의 royaltyOverdueList메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		for(int i=0; i<list.size(); i++){
			System.out.println("list22:"+list.get(i));
			sqlSessionRoyaltyOverdue.selectList(NS+".selectRoyaltyOverdueList", map);
		}
		
		return null;
	
	 
	}
	//로얄티 연체 추가할 부분이 있는지  확인
	@Override
	public List<RoyaltyOverdueAdd> royaltyOverdueIdentify(RoyaltyOverdue royaltyOverdue) {
		System.out.println("RoyaltyOverdueDaoImpl의 royaltyOverdueIdentify메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("royaltyOverdue", royaltyOverdue);
				
		return sqlSessionRoyalty.selectList(S+".selectRoyaltyOverdueIdentify", map);
	}
	
	//로얄티연체 추가하는 메서드
	@Override
	public int royaltyOverdueAdd(List<RoyaltyOverdueAdd> list) {
		System.out.println("RoyaltyOverdueDaoImpl의 royaltyOverdueAdd메서드");
		for(int i=0; i<list.size(); i++){
			System.out.println("list22:"+list.get(i));
			System.out.println("royaltyCode :"+list.get(0).getRoyaltyCode());
			sqlSessionRoyaltyOverdue.insert(NS+".insertRoyaltyOverdue", list.get(i));
		}
		
		
		return 0;
	}
}
