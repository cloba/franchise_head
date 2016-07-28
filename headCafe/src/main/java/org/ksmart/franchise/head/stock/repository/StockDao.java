package org.ksmart.franchise.head.stock.repository;

import java.util.List;

import org.ksmart.franchise.head.stock.model.Stock;

public interface StockDao {
	//재고 리스트 조회 메서드
	List<Stock> viweHeadStrockList();
}
