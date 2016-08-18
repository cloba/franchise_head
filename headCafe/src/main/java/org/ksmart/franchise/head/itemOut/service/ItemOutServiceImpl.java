package org.ksmart.franchise.head.itemOut.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.itemOut.model.ItemOut;
import org.ksmart.franchise.head.itemOut.repository.ItemOutDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("itemOutService")
public class ItemOutServiceImpl implements ItemOutService {
	
	@Autowired
	private ItemOutDao itemOutDao;
	Logger log = Logger.getLogger(this.getClass());

	@Override
	public List<ItemOut> viewItemOutListService(Search search) {
		log.debug("ItemOutServiceImpl의 viewItemOutListService메서드 호출");
		
		return itemOutDao.viewItemOutList(search);
	}

	@Override
	public ItemOut getItemOutDetailService(String headOutCode) {
		log.debug("ItemOutServiceImpl의 getItemOutDetailService메서드 호출");
		
		return itemOutDao.getItemOutDetail(headOutCode);
	}

}
