package org.ksmart.franchise.head.menu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuSearch;
import org.ksmart.franchise.head.menu.repository.MenuDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	
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
		
		Map<String, Object> menuMap = new HashMap<String, Object>();
		
		menuMap.put("menuDetail", menuDao.getMenuDetail(menuCode));
		menuMap.put("menuIngre", menuDao.getIngre(menuCode));
		
		return menuMap;
	}
	
}
