package org.ksmart.franchise.head.stock.service;

import java.util.List;

import org.ksmart.franchise.head.stock.model.Stock;
import org.ksmart.franchise.head.util.Search;

public interface StockService {
	
	//재고 리스트 조회 메서드
	List<Stock> viweHeadStrockListService(Search search);

	//단일 재고의 상세 정보를 보여주는 메서드
	Stock viewHeadStrockDetailService(Stock stock);

	//getHItemCode구해오는 메서드
	Stock getHItemCodeService(String specificItemCode);
}
