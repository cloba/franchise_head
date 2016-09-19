package org.ksmart.franchise.head.item.repository;

import java.util.List;

import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.util.Search;

public interface ItemDao {
	// head_item을 추가하는 메서드입니다
	void addItem(ItemCommand itemCommand);
	// head_item의 리스트를 불러오는 메서드입니다
	List<Item> viewItemList(Search search);
	// head_item의 기존 데이터를 불러오는 메서드입니다
	Item getItemDetail(String hItemCode);
	// head_item을 수정하는 메서드입니다
	int headModifyItem(ItemCommand itemCommand);
	// head_item에 등록된 상품의 개수를 가져오는 메서드입니다
	int getItemCount();
	// head_item의 적정 재고량을 가져오는 메서드입니다
	int getOptimumStorage(String hItemCode);
	// head_item의 아이템명을 가져오는 메서드입니다
	String getItemName(String hItemCode);
	// head_item에 등록된 데이터 중 입력값에 해당하는 데이터의 개수를 가져오는 메서드입니다
	int checkItem(String hItemCode);
}
