package org.ksmart.franchise.head.royaltyExpected.service;

import java.util.List;

import org.ksmart.franchise.head.royaltyExpected.model.RoyaltyExpected;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyExpectedService {

	List<RoyaltyExpected> royaltyExpectedListService(RoyaltyExpected royaltyExpected, Search search);

}
