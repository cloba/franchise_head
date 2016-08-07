package org.ksmart.franchise.head.royalty.repository;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.Royalty;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyDao {

	List<Royalty> royaltyList(Royalty Royalty, Search search);

	String currentlypaiedMonth(String contractCode);
	
	String getContractCount();

	int insertRoyalty(Royalty royalty);

	Royalty royaltyDetail(Royalty royalty);

}
