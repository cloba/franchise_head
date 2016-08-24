package org.ksmart.franchise.head.item.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDaoImpl implements ItemDao{

	private final String NS = "org.ksmart.franchise.head.item.repository.ItemMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionItem;
	Logger log = Logger.getLogger(this.getClass());
	
	@Override
	// head_item을 추가하는 메서드입니다
	public void addItem(ItemCommand itemCommand) {
		log.debug("ItemDaoImpl의 addItem 메서드 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemCommand", itemCommand);
		
		sqlSessionItem.insert(NS+".insertItem", map);
	}

	@Override
	// head_item의 목록을 보여주는 메서드입니다
	public List<Item> viewItemList(Search search) {
		log.debug("ItemDaoImpl의 viewItemList 메서드 호출");
		return sqlSessionItem.selectList(NS+".selectItem", search);
	}
	
	@Override
	// head_item의 기존 값을 불러오는 메서드입니다
	public Item getItemDetail(String hItemCode) {
		log.debug("ItemDaoImpl의 getItemDetail 메서드 호출");
		//map을 안써도 되지만 통일성을 위해 씀 (여기는 팀원들에게 물어 볼 것)
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hItemCode", hItemCode);
		
		return sqlSessionItem.selectOne(NS+".selectOneItem", map);
	}

	@Override
	// head_item을 수정하는 메서드입니다
	public int headModifyItem(ItemCommand itemCommand) {
		log.debug("ItemDaoImpl의 headModifyItem 메서드 호출");
	//	log.debug("itemCommand확인 :"+itemCommand.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemCommand", itemCommand);
		
		return sqlSessionItem.update(NS+".updateItem", map);
	}

	@Override
	//head_item에 등록된 상품의 개수를 가져오는 메서드입니다
	public int getItemCount() {
		log.debug("ItemDaoImpl의 getItemCount 메서드 호출");		
		int result = sqlSessionItem.selectOne(NS+".getItemCount");
		return result;
	}

	@Override
	// head_item의 적정 재고량을 가져오는 메서드입니다
	public int getOptimumStorage(String hItemCode) {
		log.debug("ItemDaoImpl의 getOptimumStorage 메서드 호출");		
		int result = sqlSessionItem.selectOne(NS+".getOptimumStorage", hItemCode);
		return result;
	}

	@Override
	// head_item의 아이템명을 가져오는 메서드입니다
	public String getItemName(String hItemCode) {
		log.debug("ItemDaoImpl의 getItemName 호출");		
		String result = sqlSessionItem.selectOne(NS+".getItemName", hItemCode);
		return result;
	}
	
}
