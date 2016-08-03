package org.ksmart.franchise.head.accounting.service;

import java.util.List;

import org.ksmart.franchise.head.accounting.model.Accounting;
import org.ksmart.franchise.head.accounting.repository.AccountingDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.stereotype.Service;

@Service
public class AccountingServiceImpl implements AccountingService{

	private AccountingDao accountingDao;
	
	@Override
	public List<Accounting> headAccountingListService(Search search) {
		// TODO Auto-generated method stub
		return accountingDao.HeadAccountingList(search);
	}

}
