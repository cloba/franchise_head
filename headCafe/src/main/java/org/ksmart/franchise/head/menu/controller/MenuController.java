package org.ksmart.franchise.head.menu.controller;

import java.util.List;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuSearch;
import org.ksmart.franchise.head.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private Menu menu;

	// 상품 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewMenuList")
	public String viewMenuList(MenuSearch menuSearch, Model model){
		System.out.println("MenuController의 viewMenuList 메서드 호출");

		List<Menu> menuList = menuService.viewMenuListService(menuSearch);
		
		model.addAttribute(menuList);
		model.addAttribute(menuSearch);
		
		return "/menu/viewMenuList";
	}
	
	// 상품 상세를 보여줍니다
	@RequestMapping(value="/viewMenuDetail")
	public String viewMenuDetail(@RequestParam("menuCode") String menuCode, Model model){
		System.out.println("MenuController의 viewMenuDetail 메서드 호출");
	
		menu = menuService.getMenuDetailService(menuCode);
		model.addAttribute(menu);
		
		return "/menu/viewMenuDetail";
	}
	
}
