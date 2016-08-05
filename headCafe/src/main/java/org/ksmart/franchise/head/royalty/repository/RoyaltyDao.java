package org.ksmart.franchise.head.royalty.repository;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.Royalty;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyDao {

	List<Royalty> RoyaltyList(Royalty Royalty, Search search);

	Royalty currentlypaiedMonth();
	
	

}
