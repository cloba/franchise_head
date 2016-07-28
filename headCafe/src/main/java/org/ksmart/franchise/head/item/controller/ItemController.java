package org.ksmart.franchise.head.item.controller;

import java.util.List;

import org.ksmart.franchise.head.item.model.HeadLogin;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.item.model.ItemSearch;
import org.ksmart.franchise.head.item.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	@Autowired
	private Item item;
	
	// 상품을 추가하는 form으로 이동합니다
	@RequestMapping(value="/headAddItem", method=RequestMethod.GET)
	public String addItemForm(){
		System.out.println("ItemController의 addItemForm메서드 호출");
		
		return "/item/headAddItem";
	}
	
	// 상품을 추가하는 head_item form을 제출합니다
	@RequestMapping(value="/headAddItem", method=RequestMethod.POST)
	public String addItem(ItemCommand itemCommand, HeadLogin headLogin){
		System.out.println("ItemController의 addItem 메서드 호출");

		itemService.addItemService(itemCommand, headLogin);
		
		return "redirect:/viewItemList";
	}
	
	// 상품 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewItemList")
	public String viewItemList(ItemSearch itemSearch, Model model){
		System.out.println("ItemController의 viewItemList 메서드 호출");

		List<Item> itemList = itemService.viewItemListService(itemSearch);
		model.addAttribute(itemList);
		model.addAttribute(itemSearch);
		
		return "/item/viewItemList";
	}
	
	// 상품을 수정하는 수정 form으로 이동합니다
	@RequestMapping(value="/headModifyItem", method=RequestMethod.GET)
	public String modifyItemForm(@RequestParam("hItemCode") String hItemCode, Model model){
		System.out.println("ItemController의 modifyItemForm 메서드 호출");
		
		item = itemService.headModifyItemFormService(hItemCode);
		model.addAttribute(item);
		
		return "/item/headModifyItem";
	}
	
	// 상품을 수정합니다
	@RequestMapping(value="/headModifyItem", method=RequestMethod.POST)
	public String modifyItem(ItemCommand itemCommand, HeadLogin headLogin){
		System.out.println("ItemController의 modifyItem 메서드 호출");
		
		int result = itemService.headModifyItemService(itemCommand, headLogin);
		//System.out.println("update 결과: "+result);
		
		return "/item/empty";
	}
	
}
