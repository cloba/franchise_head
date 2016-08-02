package org.ksmart.franchise.head.menu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuIngre;
import org.ksmart.franchise.head.menu.model.MenuSearch;
import org.ksmart.franchise.head.menu.repository.MenuDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	@Autowired
	private Menu menu;
	
	@Override
	//menu리스트를 봅니다
	public List<Menu> viewMenuListService(MenuSearch menuSearch) {
		System.out.println("MenuServiceImpl의 viewMenuListService메서드 호출");
		
		return menuDao.viewMenuList(menuSearch);
	}

	@Override
	//menu 한개의 상세 정보와 재료정보를 봅니다
	public Map<String, Object> getMenuDetailService(String menuCode) {
		System.out.println("MenuServiceImpl의 getMenuDetailService메서드 호출");
		
		//getMenuDetail메서드의 리턴 데이터를 받습니다		
		menu = menuDao.getMenuDetail(menuCode);
		
		
		// getIngre메서드의 리턴데이터인 List를 받습니다
		List<MenuIngre> ingreList = new ArrayList<MenuIngre>();
		ingreList = menuDao.getIngre(menuCode);
		
		/*List<MenuIngre> ingreList = menuDao.getIngre(menuCode);
		for( Map<String, Object > menuMap : ingreList ){
			for( Map.Entry<String, Object> entry : menuMap.entrySet()){
				String key = entry.getKey();
				Object value = entry.getValue();
				menuMap.put(key,value);
			}
		}*/
		
		
		//menu객체와 List를 새로운 Map에 담습니다
		Map<String, Object> inteMap = new HashMap<String, Object>();
		inteMap.put("menuDetail", menu);
		inteMap.put("ingreList", ingreList);
	
		return inteMap;
	}
	
}
