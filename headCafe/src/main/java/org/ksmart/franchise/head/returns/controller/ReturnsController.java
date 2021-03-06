package org.ksmart.franchise.head.returns.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.returns.model.Returns;
import org.ksmart.franchise.head.returns.model.ReturnsProcess;
import org.ksmart.franchise.head.returns.service.ReturnsService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReturnsController {

	@Autowired
	private ReturnsService returnsService;
	Logger log = Logger.getLogger(this.getClass());

	//반품 상품 리스트 조회 메서드
	@RequestMapping(value="/viewReturnsList.do")
	public String viewReturnsList(Model model, Returns returns, Search search) {
		log.debug("ReturnsController의 viewReturnsList메서드 ");
		List<Returns> returnsList = returnsService.viewReturnsListService(returns, search);
		model.addAttribute("returnsList", returnsList);
		model.addAttribute("search", search);
		
		return "/returns/viewReturnsList";
    }
	
	//반품 상품  상세정보 조회 메서드
	@RequestMapping(value="/viewReturnsDetail.do", method=RequestMethod.GET)
	public String viewReturnsDetail(Model model, Returns returns) {
		log.debug("ReturnsController의 viewReturnsDetail메서드 ");
		  returns =  returnsService.viewReturnsDetailService(returns);			 
		  model.addAttribute("returns", returns);
		  
	      return "/returns/viewReturnsDetail";
    }
		
	//본사 반품 내용 확인 및 수락 메서드	
    @RequestMapping(value="/modifyReturnsApproval.do", method=RequestMethod.GET)
	public String modifyReturnsApproval(Model model, ReturnsProcess returnsProcess){
    	log.debug("ReturnsController의 modifyReturnsApproval post메서드 ");
    	returnsService.addHeadDumpService(returnsProcess);    		
 
    	return "redirect:/viewReturnsList.do";
  }
}
