package org.ksmart.franchise.head.sell.service;

import java.util.List;

import org.ksmart.franchise.head.sell.model.ReceivedOrder;
import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.sell.model.SellSearch;
import org.ksmart.franchise.head.util.Search;

public interface SellService {
	//본사의 판매 리스트를 보여줍니다
	List<Sell> viewSellListService(SellSearch search);
	//본사 판매내역의 상세를 보여줍니다
	Sell getSellDetailService(String headSellCode);
	//본사가 받은 주문 리스트를 보여줍니다
	List<ReceivedOrder> viewReceivedOrderService(Search search);
	//본사가 들어온 주문을 승인하고 판매 내역에 추가합니다
	void confirmOrderService(String code);
}
