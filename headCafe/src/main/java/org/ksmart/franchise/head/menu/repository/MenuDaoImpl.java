package org.ksmart.franchise.head.menu.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDaoImpl implements MenuDao {
	
	private final String NS = "org.ksmart.franchise.head.menu.repository.MenuMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionMenu;

	@Override
	// menu의 목록을 보여주는 메서드입니다
	public List<Menu> viewMenuList(Search search) {
		System.out.println("MenuDaoImpl의 viewItemList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Search", search);
		
		return sqlSessionMenu.selectList(NS+".selectMenu", map);
	}

}
