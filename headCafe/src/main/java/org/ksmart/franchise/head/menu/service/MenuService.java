package org.ksmart.franchise.head.menu.service;

import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuSearch;

public interface MenuService {
	//menu리스트를 봅니다
	public List<Menu> viewMenuListService(MenuSearch menuSearch);
	//menu 한개의 상세 정보와 재료정보를 봅니다
	public Map<String, Object> getMenuDetailService(String menuCode);
}
