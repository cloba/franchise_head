package org.ksmart.franchise.head.stock.repository;

import java.util.List;


import org.ksmart.franchise.head.stock.model.Stock;
import org.ksmart.franchise.head.util.Search;

public interface StockDao {
	//재고 리스트 조회 메서드
	List<Stock> viweHeadStrockList(Search search);

	Stock viewHeadStrockDetail(Stock stock);

}
