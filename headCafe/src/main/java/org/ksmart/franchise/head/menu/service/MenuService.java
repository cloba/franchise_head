package org.ksmart.franchise.head.menu.service;

import java.util.List;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.Search;

public interface MenuService {
	public List<Menu> viewMenuListService(Search search);
}
