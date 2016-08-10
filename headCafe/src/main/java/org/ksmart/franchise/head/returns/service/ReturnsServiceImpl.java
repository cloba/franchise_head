package org.ksmart.franchise.head.returns.service;

import java.util.List;

import org.ksmart.franchise.head.returns.model.Returns;
import org.ksmart.franchise.head.returns.repository.ReturnsDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReturnsServiceImpl implements ReturnsService{

	@Autowired
	private ReturnsDao returnsDao;
	
	@Override
	public List<Returns> viewReturnsListService(Returns returns, Search search) {
		
		return returnsDao.viewReturnsList(returns, search);
	}

	@Override
	public Returns viewReturnsDetailService(Returns returns) {
		
		return returnsDao.viewReturnsDetail(returns);
	}

}
