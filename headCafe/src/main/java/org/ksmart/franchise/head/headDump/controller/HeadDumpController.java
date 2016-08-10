package org.ksmart.franchise.head.headDump.controller;


import java.util.List;


import org.ksmart.franchise.head.headDump.model.HeadDump;
import org.ksmart.franchise.head.headDump.service.HeadDumpService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HeadDumpController {
	@Autowired
	private HeadDumpService headDumpService;
	
	
	// 폐기 상품 리스트 조회 메서드
		@RequestMapping(value="/viewHeadDumpList", method=RequestMethod.GET)
		public String viewHeadDumpList(Model model, HeadDump headDump, Search search) {
			  System.out.println("HeadDumpController의 viewHeadDumpList메서드 ");
			  
			  //폐기 상품 리스트 조회 메서드  
			  List<HeadDump> headDumpList = headDumpService.viewHeadDumpService(headDump, search);
			  
			  model.addAttribute("headDumpList", headDumpList);

		      return "/headDump/viewHeadDumpList";
	    }
}
