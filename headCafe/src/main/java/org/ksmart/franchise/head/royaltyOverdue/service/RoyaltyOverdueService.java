package org.ksmart.franchise.head.royaltyOverdue.service;

import java.util.List;

import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverduePayAdd;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyOverdueService {

	//로얄티 연체 추가할 내역이 있으면 추가해 리스트 조회하는 메서드
	List<RoyaltyOverdue> royaltyOverdueListService(Search search, RoyaltyOverdue royaltyOverdue);

	//로얄티 상세정보 조회하는 메서드
	RoyaltyOverdue royaltyOverdueDetailService(String royaltyOverdueCode);
	
	//로얄티 연체금액 납부하는 메서드
	int royaltyOverduePadyAddService(RoyaltyOverduePayAdd royaltyOverduePayAdd);

}
