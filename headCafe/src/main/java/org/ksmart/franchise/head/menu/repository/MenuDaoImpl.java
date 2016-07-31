package org.ksmart.franchise.head.menu.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuSearch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDaoImpl implements MenuDao {
	
	private final String NS = "org.ksmart.franchise.head.menu.repository.MenuMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionMenu;

	@Override
	// menu의 정보를 보여주는 메서드입니다
	public List<Menu> viewMenuList(MenuSearch menuSearch) {
		System.out.println("MenuDaoImpl의 viewItemList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menuSearch", menuSearch);
		
		return sqlSessionMenu.selectList(NS+".selectMenu", map);
	}

	@Override
	// menu의 기존 값을 불러오는 메서드입니다
	public Menu getMenuDetail(String menuCode) {
		System.out.println("MenuDaoImpl의 getMenuDetail 메서드 호출");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("menuCode", menuCode);
		
		return sqlSessionMenu.selectOne(NS+".selectOneMenu", map);
	}

}
