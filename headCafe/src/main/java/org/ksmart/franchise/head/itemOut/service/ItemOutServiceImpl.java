package org.ksmart.franchise.head.itemOut.service;

import java.util.List;

import org.ksmart.franchise.head.itemOut.model.ItemOut;
import org.ksmart.franchise.head.itemOut.model.ItemOutSearch;
import org.ksmart.franchise.head.itemOut.repository.ItemOutDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("itemOutService")
public class ItemOutServiceImpl implements ItemOutService {
	
	@Autowired
	private ItemOutDao itemOutDao;

	@Override
	public List<ItemOut> viewItemOutListService(ItemOutSearch search) {
		System.out.println("ItemOutServiceImpl의 viewItemOutListService메서드 호출");
		
		return itemOutDao.viewItemOutList(search);
	}

	@Override
	public ItemOut getItemOutDetailService(String headOutCode) {
		System.out.println("ItemOutServiceImpl의 getItemOutDetailService메서드 호출");
		
		return itemOutDao.getItemOutDetail(headOutCode);
	}

}
