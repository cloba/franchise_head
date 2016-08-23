package org.ksmart.franchise.head.item.service;

import java.util.List;

import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.util.Search;

public interface ItemService {

	public void addItemService(ItemCommand itemCommand);
	
	public List<Item> viewItemListService(Search search);
	
	public Item getItemDetailService(String hItemCode);
	
	public int headModifyItemService(ItemCommand itemCommand);
	
}
