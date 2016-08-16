package org.ksmart.franchise.head.accounting.service;

import java.util.List;

import org.ksmart.franchise.head.accounting.model.Accounting;
import org.ksmart.franchise.head.accounting.repository.AccountingDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountingServiceImpl implements AccountingService{

	@Autowired
	private AccountingDao accountingDao;
	
	//본사 통합 회계 리스트 조회
	@Override
	public List<Accounting> headAccountingListService(Search search) {
		return accountingDao.HeadAccountingList(search);
	}

}
