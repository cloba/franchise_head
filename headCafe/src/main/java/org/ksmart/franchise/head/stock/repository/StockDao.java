package org.ksmart.franchise.head.stock.repository;

import java.util.List;


import org.ksmart.franchise.head.stock.model.Stock;
import org.ksmart.franchise.head.util.Search;

public interface StockDao {
	//재고 리스트 조회 메서드
	List<Stock> viweHeadStrockList(Search search);
	//본사 재고 상세정보 조회 메서드
	Stock viewHeadStrockDetail(Stock stock);
	//특정 아이템 재고량 조회 메서드
	int getStockCount(String hItemCode);

}
