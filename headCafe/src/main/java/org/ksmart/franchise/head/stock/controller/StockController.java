package org.ksmart.franchise.head.stock.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.stock.model.Stock;
import org.ksmart.franchise.head.stock.service.StockService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StockController {
	
	@Autowired
	private StockService stockService;
	Logger log = Logger.getLogger(this.getClass());
	
	//재고리스트 조회 메서드
	@RequestMapping(value="/viweHeadStockList.do")
	public String viweHeadStrockList(Model model, Search search){
		log.debug("StockController의 viweHeadStrockList 메서드");
		//재고리스트 받아옴
		List<Stock> list = stockService.viweHeadStrockList(search);
	//	log.debug("list size :"+list.size());
		model.addAttribute("list", list);
		
		//리스트 폼으로 이동
		return "/stock/viweHeadStockList";
	}
	
	//단일 재고의 자세한 정보를 보는 메서드
	@RequestMapping(value="/viewHeadStrockDetail.do", method=RequestMethod.GET)
	public String viewHeadStrockDetail(Model model, Stock stock){
		log.debug("StockController의 viewHeadStrockDetail 메서드");
	//	log.debug("getSpecificItemCode"+stock.getSpecificItemCode());
		stock = stockService.viewHeadStrockDetailService(stock);
		model.addAttribute("stock", stock);

		return "/stock/viewHeadStockDetail";
	}
	
	
	
}
