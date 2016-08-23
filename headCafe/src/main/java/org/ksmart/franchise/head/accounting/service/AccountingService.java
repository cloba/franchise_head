package org.ksmart.franchise.head.accounting.service;

import java.util.List;

import org.ksmart.franchise.head.accounting.model.Accounting;
import org.ksmart.franchise.head.util.Search;

public interface AccountingService {
	
	//본사통합회계 리스트를 조회하는 메서드
	List<Accounting> headAccountingListService(Search search);

}
