package org.ksmart.franchise.head.sub.controller;

import java.util.List;

import org.ksmart.franchise.head.sub.model.Sub;
import org.ksmart.franchise.head.sub.service.SubService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubController {
	
	@Autowired
	private SubService subService;
	
	// 상품 리스트를 보여줍니다 (검색포함)
		@RequestMapping(value="/viewSubList")
		public String viewSubList(Search subSearch, Model model){
			System.out.println("SubController의 viewSubList 메서드 호출");

			List<Sub> subList = subService.viewSubListService(subSearch);
			model.addAttribute("subList",subList);
			model.addAttribute("subSearch",subSearch);
			
			return "/sub/viewSubList";
		}
}
