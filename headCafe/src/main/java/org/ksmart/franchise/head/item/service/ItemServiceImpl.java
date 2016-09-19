package org.ksmart.franchise.head.item.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.item.repository.ItemDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl  implements ItemService {
	
	@Autowired
	private ItemDao itemDao;
	Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public void addItemService(ItemCommand itemCommand) {
		log.debug("ItemServiceImpl의 addItemService메서드 호출");
		
		itemDao.addItem(itemCommand);
	}

	@Override
	public Item getItemDetailService(String hItemCode) {
		log.debug("ItemServiceImpl의 getItemDetailService메서드 호출");
		
		return itemDao.getItemDetail(hItemCode);
	}

	@Override
	public int headModifyItemService(ItemCommand itemCommand) {
		log.debug("ItemServiceImpl의 headModifyItemService메서드 호출");
		
		return itemDao.headModifyItem(itemCommand);
	}

	@Override
	public List<Item> viewItemListService(Search search) {
		log.debug("ItemServiceImpl의 viewItemListService메서드 호출");
		
		return itemDao.viewItemList(search);
	}

	@Override
	public int checkItemService(String hItemCode) {
		log.debug("ItemServiceImpl의 checkItemService메서드 호출");
		
		return itemDao.checkItem(hItemCode);
	}

}
