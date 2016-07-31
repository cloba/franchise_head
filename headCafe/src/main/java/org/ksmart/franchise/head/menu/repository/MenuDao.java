package org.ksmart.franchise.head.menu.repository;

import java.util.List;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuIngre;
import org.ksmart.franchise.head.menu.model.MenuSearch;

public interface MenuDao {
	// menu의 리스트를 불러오는 메서드입니다
	public List<Menu> viewMenuList(MenuSearch menuSearch);
	// menu의 기존 데이터를 불러오는 메서드 입니다
	public Menu getMenuDetail(String menuCode);
	// 한 menu의 재료 정보를 불러오는 메서드 입니다
	public List<MenuIngre> getIngre(String menuCode);
}
