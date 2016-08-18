package org.ksmart.franchise.head.royaltyOverdue.service;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.RoyaltyOverdueAdd;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverduePayAdd;
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
		//로얄티 연체에 추가할 로우가 있는지 확인하는 메서드
		List<RoyaltyOverdueAdd> list = royaltyOverdueDao.royaltyOverdueIdentify(royaltyOverdue);
		
		//로얄티 연체를 추가하는 메서드
		royaltyOverdueDao.royaltyOverdueAdd(list);
		
		return royaltyOverdueDao.royaltyOverdueList(search);
	}
	
	//로얄티 연체 상세 정보 조회 메서드 
	@Override
	public RoyaltyOverdue royaltyOverdueDetailService(String royaltyOverdueCode) {
		System.out.println("RoyaltyOverdueServiceImpl의 royaltyOverdueDetailService메서드");
		
		return royaltyOverdueDao.royaltyOverDetatil(royaltyOverdueCode);
	}
	
	//로얄티 연체 납부 메서드
	@Override
	public int royaltyOverduePadyAddService(RoyaltyOverduePayAdd royaltyOverduePayAdd) {
		System.out.println("RoyaltyOverdueServiceImpl의 royaltyOverduePadyAddService메서드");
		return royaltyOverdueDao.royaltyOverduePadyAdd(royaltyOverduePayAdd);
	}
}