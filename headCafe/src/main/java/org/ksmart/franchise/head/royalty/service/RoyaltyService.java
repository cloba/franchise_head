package org.ksmart.franchise.head.royalty.service;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.Royalty;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyService {

	List<Royalty> royaltyListService(Royalty Royalty, Search search);

}
