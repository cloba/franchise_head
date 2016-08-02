package org.ksmart.franchise.head.sell.service;

import java.util.List;

import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.util.Search;
import org.springframework.stereotype.Service;

@Service
public interface SellService {
	// 본사의 판매 리스트를 보여줍니다
	public List<Sell> viewSellListService(Search search);
}
