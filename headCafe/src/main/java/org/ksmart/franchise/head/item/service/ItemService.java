package org.ksmart.franchise.head.item.service;

import java.util.List;

import org.ksmart.franchise.head.item.model.HeadLogin;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.item.model.ItemSearch;

public interface ItemService {

	public void addItemService(ItemCommand itemCommand, HeadLogin headLogin);
	
	public List<Item> viewItemListService(ItemSearch itemSearch);
	
	public Item headModifyItemFormService(String hItemCode);
	
	public int headModifyItemService(ItemCommand itemCommand, HeadLogin headLogin);
	
}
