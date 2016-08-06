package org.ksmart.franchise.head.menu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.menu.model.Menu;
import org.ksmart.franchise.head.menu.model.MenuDomain;
import org.ksmart.franchise.head.menu.model.MenuIngre;
import org.ksmart.franchise.head.menu.service.MenuService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MenuController {
	
	@Autowired 
	private MenuService menuService;

	// 메뉴 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewMenuList")
	public String viewMenuList(Search menuSearch, Model model){
		System.out.println("MenuController의 viewMenuList 메서드 호출");

		List<Menu> menuList = menuService.viewMenuListService(menuSearch);
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("menuSearch", menuSearch);
		
		return "/menu/viewMenuList";
	}
	
	// 메뉴 상세를 보여줍니다
	@RequestMapping(value="/viewMenuDetail")
	public String viewMenuDetail(String menuCode, Model model){
		System.out.println("MenuController의 viewMenuDetail 메서드 호출");
	
		// 1. service 메서드의 리턴 데이터를 Map으로 받습니다
		Map<String, Object> inteMap = new HashMap<String, Object>();
		inteMap = menuService.getMenuDetailService(menuCode);
		
		// 2.
		Menu menu = new Menu();
		menu = (Menu) inteMap.get("menuDetail");
		
		// 3.
		List<MenuIngre> ingreList = new ArrayList<MenuIngre>();
		ingreList = (List<MenuIngre>) inteMap.get("ingreList");
		System.out.println("List확인: "+ingreList.toString());
		
		// 4. List를 Map으로 변환합니다
		Map<String, Object> ingreMap = new HashMap<String, Object>();
		ingreMap.put("ingreList", ingreList);
	
		// 4.
		model.addAttribute("menu",menu);
		model.addAttribute("ingreList",ingreList);

		return "/menu/viewMenuDetail";
	}
	
	// 메뉴를 추가하는 form으로 이동합니다
	@RequestMapping(value="/headAddMenu", method=RequestMethod.GET)
	public String addMenuForm(){
		System.out.println("MenuController의 addMenuForm메서드 호출");
		
		return "/menu/headAddMenu";
	}
	
	// 메뉴를 추가하는 프로그램을 실행합니다
	@RequestMapping(value="/headAddMenu", method=RequestMethod.POST)
	public String addMenu(MenuDomain menu){
		System.out.println("MenuController의 addMenu 메서드 호출");

		menuService.addMenuService(menu);
		
		return "redirect:/viewMenuList";
	}
	
	//재료를 검색합니다
	@RequestMapping(value="/searchIngre")
	public @ResponseBody List<MenuIngre> searchIngre(String ingreName) {
		System.out.println("MenuController의 searchIngre 메서드 호출");
		
		List<MenuIngre> menuIngre = menuService.searchIngreService(ingreName);
		
		return menuIngre;
	}
	
}
