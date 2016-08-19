package org.ksmart.franchise.head.royaltyOverdue.service;

import java.util.List;

import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverduePayAdd;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyOverdueService {

	List<RoyaltyOverdue> royaltyOverdueListService(Search search, RoyaltyOverdue royaltyOverdue);

	RoyaltyOverdue royaltyOverdueDetailService(String royaltyOverdueCode);
	
	int royaltyOverduePadyAddService(RoyaltyOverduePayAdd royaltyOverduePayAdd);

}
