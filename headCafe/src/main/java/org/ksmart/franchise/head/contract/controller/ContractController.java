package org.ksmart.franchise.head.contract.controller;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.contract.model.ContractCommand;
import org.ksmart.franchise.head.contract.service.ContractService;
import org.ksmart.franchise.head.item.model.HeadLogin;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.log4j.Logger;

@Controller
public class ContractController {
	
	@Autowired
	private ContractService contractService;
	
	Logger log = Logger.getLogger(this.getClass());
	
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
	
	//계약등록 form으로 이동합니다
	@RequestMapping(value="/addContractForm", method=RequestMethod.GET)
	public String addContractForm(){
		System.out.println("PaymentController의 addContractForm 메서드 호출");

		return "/contract/addContract";
	}
	
	//계약을 등록합니다
	@RequestMapping(value="/addContract", method=RequestMethod.POST)
	public String addContract(ContractCommand contractCommand, HeadLogin headStaffLogin){
		System.out.println("PaymentController의 addContract 메서드 호출");
		contractService.addContractService(contractCommand);
		String contractCode = contractCommand.getContractCode();
	//	System.out.println(contractCode+" <====== contractCode");
		
		return "redirect:/viewContractDetail?contractCode="+contractCode;
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
	
	//계약을 수정하는 form으로 이동합니다
	@RequestMapping(value="/modifyContract", method=RequestMethod.GET)
	public String modifyContractForm(String contractCode, Model model){
		System.out.println("ContractController의 modifyContractForm 메서드 호출");
		Contract contract = contractService.getContractDetailService(contractCode);
		model.addAttribute("contract", contract);
		
		return "/contract/modifyContract";
	}
	
	//계약을 수정합니다
	@RequestMapping(value="/modifyContract", method=RequestMethod.POST)
	public String modifyContract(Contract contract){
		System.out.println("ContractController의 modifyContract 메서드 호출");
		contractService.modifyContractService(contract);
		
		return "redirect:/viewContractDetail?contractCode="+contract.getContractCode();
	}
}
