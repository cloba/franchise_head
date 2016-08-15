package org.ksmart.franchise.head.royalty.service;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.Royalty;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyService {

//	List<Royalty> royaltyListService(Royalty Royalty, Search search);

	List<Royalty> currentlypaiedMonthService(Royalty royalty, Search search);

	Royalty royaltyDetailService(String royaltyCode);

	int modifyRoyaltyPayService(Royalty royalty);




}
