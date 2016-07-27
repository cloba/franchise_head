package org.ksmart.franchise.head.stock.service;

import java.util.List;

import org.ksmart.franchise.head.stock.model.Stock;
import org.ksmart.franchise.head.stock.repository.StockDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockServiceImpl implements StockService{
	
	@Autowired
	private StockDao stockDao;
	
	public List<Stock> viweHeadStrockList(){
		return stockDao.viweHeadStrockList();
		
	}
}
