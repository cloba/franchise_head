package org.ksmart.franchise.head.sell.controller;

import java.util.List;

import org.ksmart.franchise.head.sell.model.Sell;
import org.ksmart.franchise.head.sell.service.SellService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SellController {
	
	@Autowired
	private SellService sellService;
	@Autowired
	private Sell sell;
	
	// 결제방식 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewSellList")
	public String viewSellList(Search search, Model model){
		System.out.println("SellController의 viewSellList 메서드 호출");

		List<Sell> sellList = sellService.viewSellListService(search);
		model.addAttribute("sellList", sellList);
		model.addAttribute("search", search);
		
		return "/sell/viewSellList";
	}
	
	// 상품 상세를 보여줍니다
	@RequestMapping(value="/viewSellDetail")
	public String viewSellDetail(@RequestParam("headSellCode") String headSellCode, Model model){
		System.out.println("SellController의 viewSellDetail 메서드 호출");

		sell = sellService.getSellDetailService(headSellCode);
		model.addAttribute(sell);
		
		return "/sell/viewSellDetail";
	}

}
