package org.ksmart.franchise.head.itemOut.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.itemOut.model.ItemOut;
import org.ksmart.franchise.head.itemOut.model.ItemOutSearch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ItemOutDao")
public class ItemOutDaoImpl implements ItemOutDao {
	
	private final String NS = "org.ksmart.franchise.head.itemOut.repository.ItemOutMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionItemOut;

	@Override
	public List<ItemOut> viewItemOutList(ItemOutSearch search) {
		System.out.println("ItemOutDaoImpl의 viewItemOutList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionItemOut.selectList(NS+".selectItemOut", map);
	}

	@Override
	public ItemOut getItemOutDetail(String headOutCode) {
		System.out.println("ItemOutDaoImpl의 getItemOutDetail 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headOutCode", headOutCode);
		
		return sqlSessionItemOut.selectOne(NS+".selectOneItemOut", map);
	}

}
