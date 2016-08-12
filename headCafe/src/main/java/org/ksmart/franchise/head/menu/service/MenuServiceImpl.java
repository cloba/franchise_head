package org.ksmart.franchise.head.menu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.item.model.Item;
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
	public int addMenuService(MenuDomain menu) throws Exception{
		System.out.println("MenuServiceImpl의 addMenuService메서드 호출");
		
		//사용하는 DB가 InnoDB를 지원하지 않아서 transaction 대신 쿼리실행 결과를 리턴받아 실행함
		//실패 : 2, 성공: 1
		//1. 메뉴를 추가합니다.
		String menuCode = null;
		try{
			menuCode = menuDao.addMenu(menu);
			System.out.println("result1: "+menuCode);
			if (menuCode.equals(null)){
				System.out.println("1 메서드 실패");
				return 2;
			}
		}catch (Exception e) {
			System.out.println("1 메서드 실패");
			throw e;
		}
		// 2. 추가된 메뉴에 따른 재료를 추가합니다. 실패시 2를 리턴하고 추가된 메뉴를 삭제합니다.
		try{
			menu.setMenuCode(menuCode);
			int result2 = menuDao.addIngre(menu);
			System.out.println("result2: "+result2);
			if (result2 != 1){
				menuDao.deleteMenu(menuCode);
				System.out.println("2 메서드 실패1");
				return 2;
			}
		}catch (Exception e) {
			System.out.println("2 메서드 실패2");
			menuDao.deleteMenu(menuCode);
			throw e;
		}
		// 3. 추가된 재료에 따라 메뉴의 재료가격을 변경합니다. 실패시 2를 리턴하고 추가된 메뉴와 재료를 삭제합니다.
		try{
			int result3 = menuDao.updateMenuIngrePrice(menuCode);
			System.out.println("result3: "+result3);
			if (result3 != 1){
				System.out.println("3 메서드 실패");
				menuDao.deleteMenu(menuCode);
				menuDao.deleteIngre(menuCode);
				return 2;
			}
		}catch (Exception e) {
			System.out.println("3 메서드 실패");
			menuDao.deleteMenu(menuCode);
			menuDao.deleteIngre(menuCode);
			throw e;
		}
		return 1;
	}

	@Override
	//재료를 검색합니다
	public List<Item> searchIngreService(String ingreName) {
		System.out.println("MenuServiceImpl의 searchIngreService메서드 호출");		
		
		return menuDao.searchIngre(ingreName);
	}

	@Override
	public int recipeCountService(String menuCode) {
		System.out.println("MenuServiceImpl의 recipecount메서드 호출");	
		return menuDao.recipeCount(menuCode);
	}
	
}
