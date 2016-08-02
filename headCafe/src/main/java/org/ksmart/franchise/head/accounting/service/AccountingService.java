package org.ksmart.franchise.head.accounting.service;

import java.util.List;

import org.ksmart.franchise.head.accounting.model.Accounting;
import org.ksmart.franchise.head.util.Search;

public interface AccountingService {

	List<Accounting> headAccountingListService(Search search);

}
