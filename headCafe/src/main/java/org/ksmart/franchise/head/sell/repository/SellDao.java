package org.ksmart.franchise.head.sell.repository;

import java.util.List;

import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.sell.model.SellSearch;

public interface SellDao {
	// 결제방식 리스트를 불러오는 메서드입니다
	public List<Sell> viewSellList(SellSearch search);
	// 판매내역 하나의 상세를 불러오는 메서드입니다
	public Sell getSellDetail(String headSellCode);
}
