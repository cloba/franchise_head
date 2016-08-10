package org.ksmart.franchise.head.sell.repository;

import java.util.List;

import org.ksmart.franchise.head.sell.model.ReceivedOrder;
import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.sell.model.SellSearch;
import org.ksmart.franchise.head.util.Search;

public interface SellDao {
	//판매내역 리스트를 불러오는 메서드입니다
	List<Sell> viewSellList(SellSearch search);
	//판매내역 하나의 상세를 불러오는 메서드입니다
	Sell getSellDetail(String headSellCode);
	//본사가 받은 주문 리스트를 불러오는 메서드입니다
	List<ReceivedOrder> viewReceivedOrder(Search search);
	//본사가 주문을 승인하는 메서드입니다
	int confirmOrder(String code);
	//본사가 승인을 취소하는 메서드입니다
	int cancelConfirm(String code);
	//승인한 주문 내용을 판매내역에 추가합니다
	int addSell();
}
