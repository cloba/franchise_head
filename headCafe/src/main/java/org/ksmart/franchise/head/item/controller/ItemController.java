package org.ksmart.franchise.head.item.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.item.service.ItemService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	Logger log = Logger.getLogger(this.getClass());
	
	// 상품을 추가하는 form으로 이동합니다
	@RequestMapping(value="/headAddItem.do", method=RequestMethod.GET)
	public String addItemForm(){
		log.debug("ItemController의 addItemForm메서드 호출");
		return "/item/headAddItem";
	}
	
	// 상품을 추가하는 head_item form을 제출합니다
	@RequestMapping(value="/headAddItem.do", method=RequestMethod.POST)
	public String addItem(ItemCommand itemCommand){
		log.debug("ItemController의 addItem 메서드 호출");
		itemService.addItemService(itemCommand);
		return "redirect:/viewItemList.do";
	}
	
	// 상품 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewItemList.do")
	public String viewItemList(Search search, Model model){
		log.debug("ItemController의 viewItemList 메서드 호출!!!!");
		List<Item> itemList = itemService.viewItemListService(search);
		model.addAttribute(itemList);
		model.addAttribute(search);
		
		return "/item/viewItemList";
	}
	
	// 상품 상세를 보여줍니다
	@RequestMapping(value="/viewItemDetail.do")
	public String viewItemDetail(@RequestParam("hItemCode") String hItemCode, Model model){
		log.debug("ItemController의 viewItemDetail 메서드 호출");
		Item item = new Item();
		item = itemService.getItemDetailService(hItemCode);
		model.addAttribute(item);
		
		return "/item/viewItemDetail";
	}
	
	// 상품을 수정하는 수정 form으로 이동합니다
	@RequestMapping(value="/headModifyItem", method=RequestMethod.GET)
	public String modifyItemForm(@RequestParam("hItemCode") String hItemCode, Model model){
		log.debug("ItemController의 modifyItemForm 메서드 호출");
		Item item = new Item();
		item = itemService.getItemDetailService(hItemCode);
		model.addAttribute(item);
		
		return "/item/headModifyItem";
	}
	
	// 상품을 수정합니다
	@RequestMapping(value="/headModifyItem.do", method=RequestMethod.POST)
	public String modifyItem(ItemCommand itemCommand){
		log.debug("ItemController의 modifyItem 메서드 호출");
		
		int result = itemService.headModifyItemService(itemCommand);
		//log.debug("update 결과: "+result);
		
		return "redirect:/viewItemDetail.do?hItemCode="+itemCommand.gethItemCode();
	}
	
	//상품을 검색하여 검색어와 일치하는 상품이 있는지 확인합니다
	@RequestMapping(value="/searchItemForMenu.do", method=RequestMethod.GET)
	@ResponseBody
	public Integer checkItem(String hItemCode) {
		log.debug("ItemController의 checkItem 메서드 호출");
		int result = itemService.checkItemService(hItemCode);
	//	log.debug("result===========> "+result );
		return result;
	}
}
