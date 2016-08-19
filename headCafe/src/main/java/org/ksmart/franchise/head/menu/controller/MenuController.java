package org.ksmart.franchise.head.menu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.item.model.Item;
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

	Logger log = Logger.getLogger(this.getClass());
	
	// 메뉴 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewMenuList.do")
	public String viewMenuList(Search menuSearch, Model model){
		log.debug("MenuController의 viewMenuList 메서드 호출");
		List<Menu> menuList = menuService.viewMenuListService(menuSearch);
		model.addAttribute("menuList", menuList);
		model.addAttribute("menuSearch", menuSearch);
		
		return "/menu/viewMenuList";
	}
	
	// 메뉴 상세를 보여줍니다
	@RequestMapping(value="/viewMenuDetail.do")
	public String viewMenuDetail(String menuCode, Model model){
		log.debug("MenuController의 viewMenuDetail 메서드 호출");
	
		// 1. service 메서드의 리턴 데이터를 Map으로 받습니다
		Map<String, Object> inteMap = new HashMap<String, Object>();
		inteMap = menuService.getMenuDetailService(menuCode);
		
		// 2.
		Menu menu = new Menu();
		menu = (Menu) inteMap.get("menuDetail");
		
		// 3.
		List<MenuIngre> ingreList = new ArrayList<MenuIngre>();
		ingreList = (List<MenuIngre>) inteMap.get("ingreList");
	//	log.debug("List확인: "+ingreList.toString());
		
		// 5.레시피가 있는지 확인합니다.
		menu.setRecipeIdentify(menuService.recipeCountService(menuCode));
	
		model.addAttribute("menu",menu);
		model.addAttribute("ingreList",ingreList);

		return "/menu/viewMenuDetail";
	}
	 
	// 메뉴를 추가하는 form으로 이동합니다            
	@RequestMapping(value="/headAddMenu.do", method=RequestMethod.GET)
	public String addMenuForm(){
		log.debug("MenuController의 addMenuForm메서드 호출");
		
		return "/menu/headAddMenu";
	}
	
	//메뉴를 추가합니다         
	@RequestMapping(value="/headAddMenu.do", method=RequestMethod.POST)
	public String addMenu(MenuDomain menu){
		log.debug("MenuController의 addMenu 메서드 호출");
		
		try {
			int result = menuService.addMenuService(menu);
			log.debug("controller의 result: "+result);
			if(result == 2){
				return "/error/error";
			}
		} catch (Exception e) {
			log.debug("addMenu Exception 실행");
			return "/error/error";
		}
		
		return "redirect:/viewMenuList.do";
	}
	
	//메뉴를 수정하는 form으로 이동합니다
	@RequestMapping(value="/headModifyMenu.do", method=RequestMethod.GET)
	public String modifyMenuForm(String menuCode, Model model){
		log.debug("MenuController의 modifyMenuForm 메서드 호출");
		
		// 1. service 메서드의 리턴 데이터를 Map으로 받습니다
		Map<String, Object> inteMap = new HashMap<String, Object>();
		inteMap = menuService.getMenuDetailService(menuCode);
		
		// 2.
		Menu menu = new Menu();
		menu = (Menu) inteMap.get("menuDetail");
		
		// 3.
		List<MenuIngre> ingreList = new ArrayList<MenuIngre>();
		ingreList = (List<MenuIngre>) inteMap.get("ingreList");
	//	log.debug("List확인: "+ingreList.toString());
		
		// 5.레시피가 있는지 확인합니다.
		menu.setRecipeIdentify(menuService.recipeCountService(menuCode));
	
		model.addAttribute("menu",menu);
		model.addAttribute("ingreList",ingreList);

		return "/menu/headModifyMenu";
	}
	
	//메뉴를 수정합니다
	@RequestMapping(value="/headModifyMenu.do", method=RequestMethod.POST)
	public String modifyMenu(MenuDomain menu){
		log.debug("MenuController의 modifyMenu 메서드 호출");
		
	//	log.debug("menu domain===> "+menu.toString());
		return "";
	}
	
	//재료를 검색합니다
	@RequestMapping(value="/searchIngre.do")
	public @ResponseBody List<Item> searchIngre(String ingreName) {
		log.debug("MenuController의 searchIngre 메서드 호출");
		List<Item> Item = menuService.searchIngreService(ingreName);
		
		return Item;
	}
	
}
