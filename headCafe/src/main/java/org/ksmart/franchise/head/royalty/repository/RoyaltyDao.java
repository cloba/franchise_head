package org.ksmart.franchise.head.royalty.repository;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.Royalty;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyDao {

	//로얄티 리스트를 조회하는 메서드
	List<Royalty> royaltyList(Royalty Royalty, Search search);

	//최근에 로얄티를 지불한 월을 구하는 메서드
	String currentlypaiedMonth(String contractCode);
	
	//본사와 계약돼 있는 가맹 수를 조회하는 메서드
	String getContractCount();

	//지난달 대한 로얄티 추가하는 메서드
	int insertRoyalty(Royalty royalty);

	//한개의 가맹에 대한 로얄티 상세정보를 조회하는 메서드
	Royalty royaltyDetail(String royaltyCode);

	//로얄티 대금 지불하는 메서드
	int modifyRoyaltyPay(Royalty royalty);

}
