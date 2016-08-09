package org.ksmart.franchise.head.contract.controller;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.contract.service.ContractService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContractController {
	
	@Autowired
	private ContractService contractService;
	
	//계약 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewContractList")
	public String viewContractList(Search contractSearch, Model model){
		System.out.println("ContractController의 viewContractList 메서드 호출");

		List<Contract> contractList = contractService.viewContractListService(contractSearch);
		model.addAttribute("contractList", contractList);
		model.addAttribute("conSearch", contractSearch);
		
		return "/contract/viewContractList";
	}
	
	//계약 하나의 상세내용를 보여줍니다
	@RequestMapping(value="/viewContractDetail")
	public String viewContractDetail(String contractCode, Model model){
		System.out.println("ContractController의 viewContractDetail 메서드 호출");

		Contract contract = contractService.getContractDetailService(contractCode);
		model.addAttribute("contract", contract);
		
		return "/contract/viewContractDetail";
	}
	
	//계약파기 사유를 기입하는 form으로 이동합니다
	@RequestMapping(value="/expireContract", method=RequestMethod.GET)
	public String expireContractForm(String contractCode, Model model){
		System.out.println("ContractController의 expireContractForm 메서드 호출");
		
		model.addAttribute("code", contractCode);
		
		return "/contract/expireContract";
	}
	
	//계약을 파기합니다
	@RequestMapping(value="/expireContract", method=RequestMethod.POST)
	public String expireContract(Contract contract){
		System.out.println("ContractController의 expireContract 메서드 호출");
		
		contractService.modifyContractService(contract);
		
		return "redirect:/viewContractDetail?contractCode="+contract.getContractCode();
	}
}
