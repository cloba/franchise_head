package org.ksmart.franchise.head.royaltyExpected.service;

import java.util.List;

import org.ksmart.franchise.head.royaltyExpected.model.RoyaltyExpected;
import org.ksmart.franchise.head.royaltyExpected.repository.RoyaltyExpectedDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoyaltyExpectedServiceImpl implements RoyaltyExpectedService {

	@Autowired
	private RoyaltyExpectedDao royaltyExpectedDao;
	
	//지불에정 리스트 메서드
	@Override
	public List<RoyaltyExpected> royaltyExpectedListService(RoyaltyExpected royaltyExpected, Search search) {
		System.out.println("RoyaltyExpectedServiceImpl의 royaltyExpectedListService ");
		
		return royaltyExpectedDao.royaltyExpectedList(royaltyExpected, search);
	}

}
