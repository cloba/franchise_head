package org.ksmart.franchise.head.royaltyExpected.repository;

import java.util.List;

import org.ksmart.franchise.head.royaltyExpected.model.RoyaltyExpected;
import org.ksmart.franchise.head.util.Search;

public interface RoyaltyExpectedDao {

	List<RoyaltyExpected> royaltyExpectedList(RoyaltyExpected royaltyExpected, Search search);

}
