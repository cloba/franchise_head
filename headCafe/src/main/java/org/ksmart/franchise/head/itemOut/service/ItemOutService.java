package org.ksmart.franchise.head.itemOut.service;

import java.util.List;

import org.ksmart.franchise.head.itemOut.model.ItemOut;
import org.ksmart.franchise.head.itemOut.model.ItemOutSearch;
import org.ksmart.franchise.head.util.Search;

public interface ItemOutService {

	public List<ItemOut> viewItemOutListService(Search search);
	
	public ItemOut getItemOutDetailService(String headOutCode);
}

