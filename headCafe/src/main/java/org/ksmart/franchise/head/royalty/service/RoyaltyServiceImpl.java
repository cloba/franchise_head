package org.ksmart.franchise.head.royalty.service;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.Royalty;
import org.ksmart.franchise.head.royalty.repository.RoyaltyDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoyaltyServiceImpl implements RoyaltyService {

	@Autowired
	private RoyaltyDao RoyaltyDao;
	
	//지불에정 리스트 메서드
	@Override
	public List<Royalty> royaltyListService(Royalty Royalty, Search search) {
		System.out.println("RoyaltyServiceImpl의 RoyaltyListService ");
		
		return RoyaltyDao.RoyaltyList(Royalty, search);
	}

}
