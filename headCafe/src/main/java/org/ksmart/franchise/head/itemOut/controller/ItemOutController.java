package org.ksmart.franchise.head.itemOut.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.itemOut.model.ItemOut;
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
	
	Logger log = Logger.getLogger(this.getClass());
	
	// 상품 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewItemOutList.do")
	public String viewItemOutList(Search search, Model model){
		log.debug("ItemOutController의 viewItemOutList 메서드 호출");
		log.debug(search.toString());
		List<ItemOut> outList = itemOutService.viewItemOutListService(search);
		model.addAttribute("outList", outList);
		model.addAttribute("search", search);
		
		return "/itemOut/viewItemOutList";
	}
	
	// 상품 상세를 보여줍니다
	@RequestMapping(value="/viewItemOutDetail.do")
	public String viewItemOutDetail(String headOutCode, Model model){
		log.debug("ItemOutController의 viewItemOutDetail 메서드 호출");
		ItemOut itemOut = itemOutService.getItemOutDetailService(headOutCode);
		model.addAttribute("itemOut", itemOut);
		
		return "/itemOut/viewItemOutDetail";
	}
}
