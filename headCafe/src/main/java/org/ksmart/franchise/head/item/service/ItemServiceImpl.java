package org.ksmart.franchise.head.item.service;

import java.util.List;

import org.ksmart.franchise.head.item.model.HeadLogin;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.item.model.ItemSearch;
import org.ksmart.franchise.head.item.repository.ItemDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl  implements ItemService {
	
	@Autowired
	private ItemDao itemDao;

	@Override
	public void addItemService(ItemCommand itemCommand, HeadLogin headLogin) {
		System.out.println("ItemServiceImpl의 addItemService메서드 호출");
		
		itemDao.addItem(itemCommand, headLogin);
	}

	@Override
	public List<Item> viewItemListService(ItemSearch itemSearch) {
		System.out.println("ItemServiceImpl의 viewItemListService메서드 호출");
		
		return itemDao.viewItemList(itemSearch);
	}

	@Override
	public Item headModifyItemFormService(String hItemCode) {
		System.out.println("ItemServiceImpl의 viewItemListService메서드 호출");
		
		return itemDao.headModifyItemForm(hItemCode);
	}

	@Override
	public int headModifyItemService(ItemCommand itemCommand, HeadLogin headLogin) {
		System.out.println("ItemServiceImpl의 headModifyItemService메서드 호출");
		
		return itemDao.headModifyItem(itemCommand, headLogin);
	}


}
