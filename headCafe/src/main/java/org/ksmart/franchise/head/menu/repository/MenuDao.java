package org.ksmart.franchise.head.menu.repository;

import java.util.List;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.Search;

public interface MenuDao {
	// menu의 리스트를 불러오는 메서드입니다
	public List<Menu> viewMenuList(Search search);
}
