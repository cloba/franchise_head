package org.ksmart.franchise.head.royaltyOverdue.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.royalty.model.RoyaltyOverdueAdd;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverduePayAdd;
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
	public List<RoyaltyOverdue> royaltyOverdueList(Search search) {
		System.out.println("RoyaltyOverdueDaoImpl의 royaltyOverdueList메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionRoyaltyOverdue.selectList(NS+".selectRoyaltyOverdueList", map);
	
	 
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
	public void royaltyOverdueAdd(List<RoyaltyOverdueAdd> list) {
		System.out.println("RoyaltyOverdueDaoImpl의 royaltyOverdueAdd메서드");
		String OverdueIdentify= null;
		for(int i=0; i<list.size(); i++){
			System.out.println("list22:"+list.get(i));
			System.out.println("royaltyCode :"+list.get(0).getRoyaltyCode());
			
			//메서드가 몇 번 실행됐는지 확인하는 변수
			int queryIdentify = sqlSessionRoyaltyOverdue.insert(NS+".insertRoyaltyOverdue", list.get(i));
			
			//메서드가 한 번 이상 실행 됐다면 
			if(queryIdentify != 0){
				// 메서드를 실행한 RoyaltyCode를 가져온다.
				OverdueIdentify = list.get(i).getRoyaltyCode();
				//RoyaltyCode의 royalty_overdue_identify를 'y'로 바꿔주는 메서드
				sqlSessionRoyalty.update(S+".updateRoyaltyOverdueIdentify", OverdueIdentify);
			}
		}	
	}
	
	//로얄티 연체 상세정보 조회 메서드
	@Override
	public RoyaltyOverdue royaltyOverDetatil(String royaltyOverdueCode) {
		System.out.println("RoyaltyOverdueDaoImpl의 royaltyOverDetatil메서드");
		return sqlSessionRoyaltyOverdue.selectOne(NS+".selectRoyaltyOverdueDetail", royaltyOverdueCode);
	}
	
	//로얄티 납부 추가 메서드
	@Override
	public int royaltyOverduePadyAdd(RoyaltyOverduePayAdd royaltyOverduePayAdd) {
		System.out.println("RoyaltyOverdueDaoImpl의 royaltyOverDetatil메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("royaltyOverduePayAdd", royaltyOverduePayAdd);
		return sqlSessionRoyaltyOverdue.update(NS+".updateRoyaltyOverduePadyAdd", map);
	}
}
