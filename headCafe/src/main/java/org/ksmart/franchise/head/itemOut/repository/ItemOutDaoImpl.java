package org.ksmart.franchise.head.itemOut.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.itemOut.model.ItemOut;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ItemOutDao")
public class ItemOutDaoImpl implements ItemOutDao {
	
	private final String NS = "org.ksmart.franchise.head.itemOut.repository.ItemOutMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionItemOut;
	Logger log = Logger.getLogger(this.getClass());


	@Override
	public List<ItemOut> viewItemOutList(Search search) {
		log.debug("ItemOutDaoImpl의 viewItemOutList 메서드 호출");
		log.debug("test::: "+search.toString());
		return sqlSessionItemOut.selectList(NS+".selectItemOut", search);
	}

	@Override
	public ItemOut getItemOutDetail(String headOutCode) {
		log.debug("ItemOutDaoImpl의 getItemOutDetail 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headOutCode", headOutCode);
		
		return sqlSessionItemOut.selectOne(NS+".selectOneItemOut", map);
	}

}
