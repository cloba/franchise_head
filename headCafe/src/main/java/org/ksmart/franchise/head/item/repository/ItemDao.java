package org.ksmart.franchise.head.item.repository;

import java.util.List;

import org.ksmart.franchise.head.item.model.HeadLogin;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.util.Search;

public interface ItemDao {
	// head_item을 추가하는 메서드입니다
	public void addItem(ItemCommand itemCommand, HeadLogin headLogin);
	// head_item의 리스트를 불러오는 메서드입니다
	public List<Item> viewItemList(Search search);
	// head_item의 기존 데이터를 불러오는 메서드입니다
	public Item getItemDetail(String hItemCode);
	// head_item을 수정하는 메서드입니다
	public int headModifyItem(ItemCommand itemCommand, HeadLogin headLogin);
}
