package org.ksmart.franchise.head.sell.service;

import java.util.List;

import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.sell.repository.SellDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellServiceImpl implements SellService {
	
	@Autowired
	private SellDao sellDao;

	@Override
	public List<Sell> viewSellListService(Search search) {
		System.out.println("SellServiceImpl의 viewSellListService메서드 호출");
		
		return sellDao.viewSellList(search);
	}

}
