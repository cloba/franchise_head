package org.ksmart.franchise.head.menu.repository;

import java.util.List;

import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuDomain;
import org.ksmart.franchise.head.menu.model.MenuIngre;
import org.ksmart.franchise.head.util.Search;

public interface MenuDao {
	// menu의 리스트를 불러오는 메서드입니다
	public List<Menu> viewMenuList(Search menuSearch);
	// menu의 기존 데이터를 불러오는 메서드 입니다
	public Menu getMenuDetail(String menuCode);
	// 한 menu의 재료 정보를 불러오는 메서드 입니다
	public List<MenuIngre> getIngre(String menuCode);
	// menu를 추가하는 메서드입니다
	public String addMenu(MenuDomain menu);
	// menu에 따른 재료를 추가하는 메서드입니다
	public int addIngre(MenuDomain menu);
	//재료를 검색합니다
	public List<Item> searchIngre(String ingreName);
	// menu에 따른 재료의 재료값을 업데이트 하는 메서드입니다
	public int updateMenuIngrePrice(String menuCode);
	// 추가된 메뉴를 삭제하는 메서드입니다
	public void deleteMenu(String menuCode);
	// 추가된 재료를 삭제하는 메서드입니다
	public void deleteIngre(String menuCode);
}
