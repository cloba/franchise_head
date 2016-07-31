package org.ksmart.franchise.head.menu.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuIngre;
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
	// menu의 상세정보를 불러오는 메서드입니다
	public Menu getMenuDetail(String menuCode) {
		System.out.println("MenuDaoImpl의 getMenuDetail 메서드 호출");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("menuCode", menuCode);
		
		return sqlSessionMenu.selectOne(NS+".selectOneMenu", map);
	}

	@Override
	// 한 menu의 재료 정보를 불러오는 메서드 입니다
	public List<MenuIngre> getIngre(String menuCode) {
		System.out.println("MenuDaoImpl의 getIngre 메서드 호출");
		
		//Mapper로 보낼 menuCode를 map에 담습니다
		Map<String, String> map = new HashMap<String, String>();
		map.put("menuCode", menuCode);
		
		//Mapper의 쿼리 실행 결과를 List에 담습니다
		List<MenuIngre> ingreList = sqlSessionMenu.selectList(NS+".selectIngre", map);
		
		return ingreList;
	}

}
