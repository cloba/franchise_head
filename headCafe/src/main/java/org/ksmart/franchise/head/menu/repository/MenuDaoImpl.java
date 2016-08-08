package org.ksmart.franchise.head.menu.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuDomain;
import org.ksmart.franchise.head.menu.model.MenuIngre;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("menuDao")
public class MenuDaoImpl implements MenuDao {
	
	private final String NS = "org.ksmart.franchise.head.menu.repository.MenuMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionMenu;

	@Override
	// menu의 정보를 보여주는 메서드입니다
	public List<Menu> viewMenuList(Search menuSearch) {
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
		List<MenuIngre> ingreList = new ArrayList<MenuIngre>();
		ingreList = sqlSessionMenu.selectList(NS+".selectIngre", map);
		
		return ingreList;
	}

	@Override
	// menu를 추가하는 메서드입니다
	public String addMenu(MenuDomain menu) {
		System.out.println("MenuDaoImpl의 addMenu 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		
		sqlSessionMenu.insert(NS+".insertMenu", map);
		
		//menu에 추가된 데이터의 PK값을 받습니다
		String menuCode = (String) map.get("menuCode");
		
		return menuCode;
	}


	@Override
	//재료를 검색합니다
	public List<Item> searchIngre(String ingreName) {
		System.out.println("MenuDaoImpl의 searchIngre 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemName", ingreName);
		
		return sqlSessionMenu.selectList(NS+".selectIngreByName", map);
	}

	
	@Override
	// menu에 따른 재료를 추가하는 메서드입니다
	public void addIngre(MenuDomain menu) {
		System.out.println("MenuDaoImpl의 addIngre 메서드 호출");
		
		
		for(int i = 0; i<menu.gethItemCodeArr().length; i++){
			System.out.println("for문 돌아감");
			
			menu.sethItemCode(menu.gethItemCodeArr()[i]);
			menu.setIngreAmount(menu.getIngreAmountArr()[i]);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("menu", menu);
			
			sqlSessionMenu.insert(NS+".insertIngreWithMenu", map);
		}
		
		
		
		
		/*menu.setIngrePriceCode(sqlSessionMenu.selectOne(NS+".nextIngrePK"));
		System.out.println("PK: "+menu.getIngrePriceCode());*/
		
		
		
		
	}
}
