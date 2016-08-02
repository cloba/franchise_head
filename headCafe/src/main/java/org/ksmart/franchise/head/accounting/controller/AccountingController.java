package org.ksmart.franchise.head.accounting.controller;

import java.util.List;

import org.ksmart.franchise.head.accounting.model.Accounting;
import org.ksmart.franchise.head.accounting.service.AccountingService;

import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountingController {
	
	@Autowired
	private AccountingService accountingService;

	//본사통합회계 리스트 조회
	@RequestMapping(value="viewHeadAccountingList", method=RequestMethod.GET)
	public String viewHeadAccountingList(Model model, Search search){
		System.out.println("AccountingController의 viewHeadAccountingList메서드");
		
		List<Accounting> list = accountingService.headAccountingListService(search);
		model.addAttribute("list", list);
		
		return null;
		
	}
	
	
	
	
	
	
	
	
/*	
  //거래처 리스트 조회
	@RequestMapping(value="/viewHeadClientList", method=RequestMethod.GET)
	public String viewHeadClientList(Model model, Search search){
		System.out.println("ClientController의 headViewHeadClientList메서드 ");
		
		
		List<Client> list = clientService.HeadClientListService(search);
		
		model.addAttribute("list", list);
		
		return "/client/viewHeadClientList";
		
		
	}
	//거래처 상세 정보 보는 메서드
	@RequestMapping(value="/viewHeadClientDetail", method=RequestMethod.GET)
	public String HeadClientDetail(Model model, String headClientCode){
		
		Client client = clientService.headClientDetailService(headClientCode);
		model.addAttribute("client", client);
		
		return "/client/viewHeadClientDetail";
		
	}
	*/

}
