package org.ksmart.franchise.head.headDump.controller;


import java.util.List;

import org.apache.log4j.Logger;
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
	
	Logger log = Logger.getLogger(this.getClass());
	
	// 판매 불가 상품 리스트 조회 메서드
	@RequestMapping(value="/viewHeadDumpList", method=RequestMethod.GET)
	public String viewHeadDumpList(Model model, HeadDump headDump, Search search) {
		System.out.println("HeadDumpController의 viewHeadDumpList메서드 ");
		  
		//폐기 상품 리스트 조회 메서드  
		List<HeadDump> headDumpList = headDumpService.viewHeadDumpService(headDump, search);
		  
		model.addAttribute("headDumpList", headDumpList);
		
		return "/headDump/viewHeadDumpList";
    }
	//판매 불가 상품 추가 폼 보여주는 메서드
	@RequestMapping(value="/addHeadDump", method=RequestMethod.GET)
	public String addHeadDump(){
		System.out.println("HeadDumpController의 addHeadDump get메서드");
		return "/headDump/addHeadDumpForm";
	}
		
	// 판매불가상품 등록 form에서 넘어오는 데이터를 받아서 처리하는 메서드
	@RequestMapping(value="/addHeadDump", method=RequestMethod.POST)
	public String addHeadDump(HeadDumpCommand headDumpCommand, Model model){
		System.out.println("HeadDumpController의 addHeadDump post메서드");
		headDumpService.addHeadDumpService(headDumpCommand);

		return "redirect:/viewHeadDumpList";
	}	
		
	//판매불가상품 상세 정보 보는 메서드
	@RequestMapping(value="/viewHeadDumpDetail", method=RequestMethod.GET)
	public String viewHeadDumpDetail(Model model, String headDumpCode){
		System.out.println("HeadDumpController의 viewHeadDumpDetail메서드 ");
		
		HeadDump headDump = headDumpService.viewHeadDumpDetailService(headDumpCode);
		model.addAttribute("headDump", headDump);
		
		return "/headDump/viewHeadDumpDetail";
		
	}
		
 	//판매 불가 상품 수정 form 보여주는 메서드
	  @RequestMapping(value="/modifyHeadDump", method=RequestMethod.GET)
	  public String modifyHeadDump(Model model, String headDumpCode){
		  System.out.println("HeadDumpController의 modifyHeadDump get메서드 ");
		  log.debug("headDumpCode ::"+headDumpCode);
		  HeadDump headDump =headDumpService.viewHeadDumpDetailService(headDumpCode); 
		  
		  log.debug("getHeadDumpCode"+headDump.getHeadDumpCode());
		  model.addAttribute("headDump", headDump);
		
		return "/headDump/viewHeadDumpModifyForm";
		  
	  }
	  
	  //판매 불가 상품 수정 처리하는 메서드
	  @RequestMapping(value="/modifyHeadDump", method=RequestMethod.POST)
	  public String modifyHeadDump(Model model, HeadDump headDump){
		  System.out.println("HeadDumpController의 modifyHeadDump post메서드 ");
		  headDumpService.modifyHeadDumpService(headDump);
		  
		  
		  //수정된 정보의 pk를 가져와 수정된 내역을 보여주는 페이지로 이동(디테일페이지)
		 return "redirect:/viewHeadDumpDetail?headDumpCode="+headDump.getHeadDumpCode();
	  }
		
		
}
