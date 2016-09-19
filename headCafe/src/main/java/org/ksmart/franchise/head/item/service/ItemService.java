package org.ksmart.franchise.head.item.service;

import java.util.List;

import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.util.Search;

public interface ItemService {

	void addItemService(ItemCommand itemCommand);
	
	List<Item> viewItemListService(Search search);
	
	Item getItemDetailService(String hItemCode);
	
	int headModifyItemService(ItemCommand itemCommand);
	
	int checkItemService(String hItemCode);
	
}
