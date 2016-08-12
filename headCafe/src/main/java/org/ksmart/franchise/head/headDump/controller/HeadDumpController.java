package org.ksmart.franchise.head.headDump.controller;


import java.util.List;

import org.ksmart.franchise.head.headDump.model.HeadDump;
import org.ksmart.franchise.head.headDump.model.HeadDumpCommand;
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
		//거래처 추가 폼 보여주는 메서드
		@RequestMapping(value="/addHeadDump", method=RequestMethod.GET)
		public String addHeadDump(){
			System.out.println("HeadDumpController의 addHeadDump get메서드");
			return "/headDump/addHeadDumpForm";
		}
			
		// 거래처등록 form에서 넘어오는 데이터를 받아서 처리하는 메서드
		@RequestMapping(value="/addHeadDump", method=RequestMethod.POST)
		public String addHeadDump(HeadDumpCommand headDumpCommand, Model model){
			System.out.println("HeadDumpController의 addHeadDump post메서드");
			headDumpService.addHeadDumpService(headDumpCommand);

			return "redirect:/viewHeadDumpList";
		}	
}
