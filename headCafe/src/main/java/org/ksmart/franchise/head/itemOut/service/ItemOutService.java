package org.ksmart.franchise.head.itemOut.service;

import java.util.List;

import org.ksmart.franchise.head.itemOut.model.ItemOut;
import org.ksmart.franchise.head.itemOut.model.ItemOutSearch;

public interface ItemOutService {

	public List<ItemOut> viewItemOutListService(ItemOutSearch search);
	
	public ItemOut getItemOutDetailService(String headOutCode);
}

