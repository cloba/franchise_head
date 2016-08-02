package org.ksmart.franchise.head.sell.repository;

import java.util.List;

import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.util.Search;
import org.springframework.stereotype.Repository;

@Repository
public interface SellDao {
	// 결제방식 리스트를 불러오는 메서드입니다
		public List<Sell> viewSellList(Search search);
}
