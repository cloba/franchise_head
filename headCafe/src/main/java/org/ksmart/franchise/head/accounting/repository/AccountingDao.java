package org.ksmart.franchise.head.accounting.repository;

import java.util.List;

import org.ksmart.franchise.head.accounting.model.Accounting;
import org.ksmart.franchise.head.util.Search;

public interface AccountingDao {
	
	//본사통합회계 리스트를 조회하는 메서드
	List<Accounting> HeadAccountingList(Search search);
}
