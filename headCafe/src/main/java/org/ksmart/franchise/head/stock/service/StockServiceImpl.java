package org.ksmart.franchise.head.stock.service;

import java.util.List;

import org.ksmart.franchise.head.stock.model.Stock;
import org.ksmart.franchise.head.stock.repository.StockDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockServiceImpl implements StockService{
	
	@Autowired
	private StockDao stockDao;
	
	//재고 리스트 조회 메서드
	public List<Stock> viweHeadStrockListService(Search search){
		System.out.println("StockServiceImpl의 viweHeadStrockList메서드 ");
		return stockDao.viweHeadStrockList(search);
		
	}
	
	//단일 재고의 상세 정보를 보여주는 메서드 
	@Override
	public Stock viewHeadStrockDetailService(Stock stock) {
		System.out.println("StockServiceImpl의 viewHeadStrockDetailService메서드 ");
		return stockDao.viewHeadStrockDetail(stock);
	}
}
