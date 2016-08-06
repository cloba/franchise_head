package org.ksmart.franchise.head.menu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuDomain;
import org.ksmart.franchise.head.menu.model.MenuIngre;
import org.ksmart.franchise.head.menu.repository.MenuDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Autowired MenuDao menuDao;
	
	@Override
	//menu리스트를 봅니다
	public List<Menu> viewMenuListService(Search menuSearch) {
		System.out.println("MenuServiceImpl의 viewMenuListService메서드 호출");
		
		return menuDao.viewMenuList(menuSearch);
	}

	@Override
	//menu 한개의 상세 정보와 재료정보를 봅니다
	public Map<String, Object> getMenuDetailService(String menuCode) {
		System.out.println("MenuServiceImpl의 getMenuDetailService메서드 호출");
		
		//getMenuDetail메서드의 리턴 데이터를 받습니다		
		Menu menu = new Menu();
		menu = menuDao.getMenuDetail(menuCode);
		
		
		// getIngre메서드의 리턴데이터인 List를 받습니다
		List<MenuIngre> ingreList = new ArrayList<MenuIngre>();
		ingreList = menuDao.getIngre(menuCode);
		
		//menu객체와 List를 새로운 Map에 담습니다
		Map<String, Object> inteMap = new HashMap<String, Object>();
		inteMap.put("menuDetail", menu);
		inteMap.put("ingreList", ingreList);
	
		return inteMap;
	}

	@Override
	//menu를 추가합니다
	public void addMenuService(MenuDomain menu) {
		System.out.println("MenuServiceImpl의 addMenuService메서드 호출");
		
		//1. menu테이블에 menu를 추가합니다
		String menuCode = menuDao.addMenu(menu);
		
		//2. ingre_price테이블에 해당 메뉴에 필요한 재료와 재료량을 입력합니다
		menuDao.addIngre(menu, menuCode);
		
		
	}

	@Override
	public List<MenuIngre> searchIngreService(String ingreName) {
		System.out.println("MenuServiceImpl의 searchIngreService메서드 호출");		
		
		return menuDao.searchIngre(ingreName);
	}
	
}
