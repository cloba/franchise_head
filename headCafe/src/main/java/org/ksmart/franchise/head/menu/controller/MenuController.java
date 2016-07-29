package org.ksmart.franchise.head.menu.controller;

import java.util.List;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.Search;
import org.ksmart.franchise.head.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService menuService;

	// 상품 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewMenuList")
	public String viewMenuList(Search search, Model model){
		System.out.println("ItemController의 viewItemList 메서드 호출");

		List<Menu> menuList = menuService.viewMenuListService(search);
		model.addAttribute(menuList);
		model.addAttribute(search);
		
		return "/menu/viewMenuList";
	}
	
}
