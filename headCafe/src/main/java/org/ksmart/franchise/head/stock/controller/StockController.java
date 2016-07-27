package org.ksmart.franchise.head.stock.controller;

import java.util.List;

import org.ksmart.franchise.head.stock.model.Stock;
import org.ksmart.franchise.head.stock.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StockController {
	
	@Autowired
	private StockService stockService;
	
	@RequestMapping(value="/viweHeadStrockList", method=RequestMethod.GET)
	public String viweHeadStrockList(Model model){
		System.out.println("StockController의 viweHeadStrockList 메서드");
		List<Stock> list = stockService.viweHeadStrockList();
		System.out.println("list size :"+list.size());
		model.addAttribute("list", list);
		
		return "stock/viweHeadStockList";
	}
	
}
