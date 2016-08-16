package org.ksmart.franchise.head.itemOut.controller;

import java.util.List;

import org.ksmart.franchise.head.itemOut.model.ItemOut;
import org.ksmart.franchise.head.itemOut.model.ItemOutSearch;
import org.ksmart.franchise.head.itemOut.service.ItemOutService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemOutController {
	
	@Autowired
	private ItemOutService itemOutService;
	
	// 상품 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewItemOutList")
	public String viewItemOutList(Search search, Model model){
		System.out.println("ItemOutController의 viewItemOutList 메서드 호출");

		List<ItemOut> outList = itemOutService.viewItemOutListService(search);
		model.addAttribute("outList", outList);
		model.addAttribute("search", search);
		
		return "/itemOut/viewItemOutList";
	}
	
	// 상품 상세를 보여줍니다
	@RequestMapping(value="/viewItemOutDetail")
	public String viewItemOutDetail(String headOutCode, Model model){
		System.out.println("ItemOutController의 viewItemOutDetail 메서드 호출");

		ItemOut itemOut = itemOutService.getItemOutDetailService(headOutCode);
		model.addAttribute("itemOut", itemOut);
		
		return "/itemOut/viewItemOutDetail";
	}
}
