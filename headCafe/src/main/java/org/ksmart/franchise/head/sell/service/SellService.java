package org.ksmart.franchise.head.sell.service;

import java.util.List;

import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.sell.model.SellSearch;

public interface SellService {
	// 본사의 판매 리스트를 보여줍니다
	public List<Sell> viewSellListService(SellSearch search);
	// 본사 판매내역의 상세를 보여줍니다
	public Sell getSellDetailService(String headSellCode);
}
