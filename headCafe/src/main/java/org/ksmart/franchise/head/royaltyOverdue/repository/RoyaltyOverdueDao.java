package org.ksmart.franchise.head.royaltyOverdue.repository;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.RoyaltyOverdueAdd;
import org.ksmart.franchise.head.royaltyOverdue.model.RoyaltyOverdue;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyOverdueDao {

	List<RoyaltyOverdue> royaltyOverdueList(Search search, List<RoyaltyOverdueAdd> list);

	List<RoyaltyOverdueAdd> royaltyOverdueIdentify(RoyaltyOverdue royaltyOverdue);

	void royaltyOverdueAdd(List<RoyaltyOverdueAdd> list);

	void royaltyIdentifyUpdate();


}
