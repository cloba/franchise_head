package org.ksmart.franchise.head.royaltyOverdue.service;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.RoyaltyOverdueAdd;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.royaltyOverdue.repository.RoyaltyOverdueDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoyaltyOverdueServiceImpl implements RoyaltyOverdueService {

	@Autowired
	private RoyaltyOverdueDao royaltyOverdueDao;
	
	//로얄티 연체 리스트 조회 메서드
	public List<RoyaltyOverdue> royaltyOverdueListService(Search search, RoyaltyOverdue royaltyOverdue) {
		System.out.println("RoyaltyOverdueServiceImpl의 royaltyOverdueListService메서드");
		
		List<RoyaltyOverdueAdd> list = royaltyOverdueDao.royaltyOverdueIdentify(royaltyOverdue);
		System.out.println("getRoyaltyCode :"+list.get(0).getRoyaltyCode());
		System.out.println(list.get(0));
		if(list!=null){
	  
			royaltyOverdueDao.royaltyOverdueAdd(list);
			
		}
		
		return royaltyOverdueDao.royaltyOverdueList(search, list);
	}

}
