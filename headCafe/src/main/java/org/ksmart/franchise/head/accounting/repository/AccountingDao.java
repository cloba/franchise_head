package org.ksmart.franchise.head.accounting.repository;

import java.util.List;

import org.ksmart.franchise.head.accounting.model.Accounting;
import org.ksmart.franchise.head.util.Search;

public interface AccountingDao {

	List<Accounting> HeadAccountingList(Search search);

}
