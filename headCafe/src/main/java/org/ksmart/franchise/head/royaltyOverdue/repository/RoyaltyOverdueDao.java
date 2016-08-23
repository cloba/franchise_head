package org.ksmart.franchise.head.royaltyOverdue.repository;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.RoyaltyOverdueAdd;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverduePayAdd;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyOverdueDao {
	
	//로얄티 연체리스트를 조회합니다.
	List<RoyaltyOverdue> royaltyOverdueList(Search search);
	
	//로얄티 연체에 추가할 로우가 있는지 확인하는 메서드
	List<RoyaltyOverdueAdd> royaltyOverdueIdentify(RoyaltyOverdue royaltyOverdue);

	//로얄티 연체에 추가하는 메서드
	void royaltyOverdueAdd(List<RoyaltyOverdueAdd> list);
	
	//본사 로얄티 연체의 상세 정보를 조회 하는 메서드
	RoyaltyOverdue royaltyOverDetatil(String royaltyOverdueCode);

	//로얄티 연체 금액 납부를 하는 메서드
	int royaltyOverduePadyAdd(RoyaltyOverduePayAdd royaltyOverduePayAdd);


}

