package org.ksmart.franchise.head.contract.controller;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.contract.service.ContractService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContractController {
	
	@Autowired
	private ContractService contractService;
	
	// 계약 리스트를 보여줍니다 (검색포함)
		@RequestMapping(value="/viewContractList")
		public String viewContractList(Search contractSearch, Model model){
			System.out.println("ContractController의 viewContractList 메서드 호출");

			List<Contract> contractList = contractService.viewContractListService(contractSearch);
			model.addAttribute("contractList", contractList);
			model.addAttribute("conSearch", contractSearch);
			
			return "/contract/viewContractList";
		}
}
