package org.ksmart.franchise.head.menu.service;

import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuDomain;
import org.ksmart.franchise.head.util.Search;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface MenuService {
	//menu리스트를 봅니다
	public List<Menu> viewMenuListService(Search menuSearch);
	//menu 한개의 상세 정보와 재료정보를 봅니다
	public Map<String, Object> getMenuDetailService(String menuCode);
	//menu를 추가합니다
	public int addMenuService(MenuDomain menu) throws Exception;
	//재료를 검색합니다
	public List<Item> searchIngreService(String ingreName);
}
