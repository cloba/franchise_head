package org.ksmart.franchise.head.accounting.controller;

import java.util.List;

import org.apache.log4j.Logger;
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
	Logger log = Logger.getLogger(this.getClass());
	
	//본사통합회계 리스트 조회
	@RequestMapping(value="/viewHeadAccountingList.do", method=RequestMethod.GET)
	public String viewHeadAccountingList(Model model, Search search){
		log.debug("AccountingController의 viewHeadAccountingList메서드");
		
		List<Accounting> list = accountingService.headAccountingListService(search);
		model.addAttribute("list", list);
		return "/accounting/viewHeadAccountingList";
	}
}
