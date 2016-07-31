package org.ksmart.franchise.head.stock.service;

import java.util.List;

import org.ksmart.franchise.head.stock.model.Stock;
import org.ksmart.franchise.head.util.Search;

public interface StockService {

	List<Stock> viweHeadStrockList(Search search);

	Stock viewHeadStrockDetailService(Stock stock);
}
