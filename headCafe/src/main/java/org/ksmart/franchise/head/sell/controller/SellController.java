package org.ksmart.franchise.head.sell.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.sell.model.ReceivedOrder;
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
	
	Logger log = Logger.getLogger(this.getClass());
	
	//판매 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewSellList.do")
	public String viewSellList(Search search, Model model){
		log.debug("SellController의 viewSellList 메서드 호출");
		List<Sell> sellList = sellService.viewSellListService(search);
		model.addAttribute("sellList", sellList);
		model.addAttribute("search", search);
		
		return "/sell/viewSellList";
	}
	
	//판매 상세를 보여줍니다
	@RequestMapping(value="/viewSellDetail.do")
	public String viewSellDetail(@RequestParam("headSellCode") String headSellCode, Model model){
		log.debug("SellController의 viewSellDetail 메서드 호출");
		Sell sell = sellService.getSellDetailService(headSellCode);
		model.addAttribute("sell",sell);
		
		return "/sell/viewSellDetail";
	}
	
	//본사가 주문받은 내역을 보여줍니다
	@RequestMapping(value="/viewReceivedOrder.do")
	public String viewReceivedOrder(Search search, Model model){
		log.debug("SellController의 viewReceivedOrder 메서드 호출");
		List<ReceivedOrder> order = sellService.viewReceivedOrderService(search);
		model.addAttribute("list", order);
		model.addAttribute("search", search);
		
		return "/receivedOrder/viewReceivedOrder";
	}
	
	//들어온 주문을 승인합니다
	@RequestMapping(value="/confirmOrder.do")
	public String confirmOrder(Sell sell){
		log.debug("SellController의 confirmOrder 메서드 호출");
		sellService.confirmOrderService(sell);
		
		return "redirect:/viewReceivedOrder.do";
	}

}
