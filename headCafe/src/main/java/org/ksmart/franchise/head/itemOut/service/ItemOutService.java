package org.ksmart.franchise.head.itemOut.service;

import java.util.List;

import org.ksmart.franchise.head.itemOut.model.ItemOut;
import org.ksmart.franchise.head.util.Search;

public interface ItemOutService {
	// 출고 리스트를 불러오는 메서드입니다
	public List<ItemOut> viewItemOutListService(Search search);
	// 출고상세 데이터를 불러오는 메서드입니다
	public ItemOut getItemOutDetailService(String headOutCode);
}

