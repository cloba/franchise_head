package org.ksmart.franchise.head.menu.service;

import java.util.List;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.Search;
import org.ksmart.franchise.head.menu.repository.MenuDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	
	@Override
	public List<Menu> viewMenuListService(Search search) {
		System.out.println("MenuServiceImpl의 viewMenuListService메서드 호출");
		
		return menuDao.viewMenuList(search);
	}
	
}
