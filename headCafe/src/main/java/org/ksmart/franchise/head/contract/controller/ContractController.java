package org.ksmart.franchise.head.contract.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.contract.model.ContractCommand;
import org.ksmart.franchise.head.contract.service.ContractService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

@Controller
public class ContractController {
	
	@Autowired
	private ContractService contractService;
	Logger log = Logger.getLogger(this.getClass());
	
	//계약 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewContractList.do")
	public String viewContractList(Search contractSearch, Model model){
		log.debug("ContractController의 viewContractList 메서드 호출");
		List<Contract> contractList = contractService.viewContractListService(contractSearch);
		model.addAttribute("contractList", contractList);
		model.addAttribute("conSearch", contractSearch);
		
		return "/contract/viewContractList";
	}
	
	//계약 하나의 상세내용를 보여줍니다
	@RequestMapping(value="/viewContractDetail.do")
	public String viewContractDetail(String contractCode, Model model){
		log.debug("ContractController의 viewContractDetail 메서드 호출");
		Contract contract = contractService.getContractDetailService(contractCode);
		model.addAttribute("contract", contract);
	//	log.debug("확인==> "+contract.getContractFileOriginalName());
	//	log.debug("확인==> "+contract.getContractFileSize());
		return "/contract/viewContractDetail";
	}
	
	//계약서를 다운로드 합니다
	@RequestMapping(value="/downloadContractFile.do", method=RequestMethod.POST)
	public void downloadFile(String contractCode, HttpServletResponse response){
		log.debug("contractCode== > "+contractCode);
		
		//첨부파일의 정보를 가져옵니다
		Contract contract = contractService.getFileInfoService(contractCode);
		String storedFileName =	contract.getContractFileStoredName();
	    String originalFileName = contract.getContractFileOriginalName();
	//    log.debug("storedFileName== > "+storedFileName);
	//    log.debug("originalFileName== > "+originalFileName);
	    
	    try{
	    //실제 파일이 저장된 위치에서 해당 첨부파일을 읽어서 byte형태로 변환시킵니다
	    byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\franchise\\contracts\\"+storedFileName));
	 //   log.debug("fileByteArr===> "+fileByte.toString());
	     
	    //읽어들인 정보를 화면에서 다운로드 할 수 있도록 변환합니다
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	    }catch (Exception e){
	    	log.debug("첨부파일 부분 catch 던짐..");
	    }
	}
	
	//계약등록 form으로 이동합니다
	@RequestMapping(value="/addContractForm.do", method=RequestMethod.GET)
	public String addContractForm(){
		log.debug("PaymentController의 addContractForm 메서드 호출");

		return "/contract/addContract";
	}
	
	//계약을 등록합니다  
	@RequestMapping(value="/addContract.do", method=RequestMethod.POST) //HttpServletRequest에 파일정보를 담아옵니다
	public String addContract(ContractCommand contractCommand, HttpServletRequest request){
		log.debug("ContractController addContract 메서드 호출");
	//	log.debug("contractCommand!!!====> "+contractCommand);
		try {
			contractService.addContractService(contractCommand, request);
		} catch (Exception e) {
			log.debug("fileUpload 예외 발생..", e);
			e.printStackTrace();
		}
		String contractCode = contractCommand.getContractCode();
		
		return "redirect:/viewContractDetail.do?contractCode="+contractCode;
	}
	
	//계약파기 사유를 기입하는 form으로 이동합니다
	@RequestMapping(value="/expireContract.do", method=RequestMethod.GET)
	public String expireContractForm(String contractCode, Model model){
		System.out.println("ContractController의 expireContractForm 메서드 호출");
		model.addAttribute("code", contractCode);
		
		return "/contract/expireContract";
	}
	
	//계약을 파기합니다
	@RequestMapping(value="/expireContract.do")
	public String expireContract(Contract contract){
		log.debug("ContractController의 expireContract 메서드 호출");
		contractService.expireContractService(contract);
		
		return "redirect:/viewContractDetail.do?contractCode="+contract.getContractCode();
	}
	
	//계약을 수정하는 form으로 이동합니다
	@RequestMapping(value="/modifyContract.do", method=RequestMethod.GET)
	public String modifyContractForm(String contractCode, Model model){
		log.debug("ContractController의 modifyContractForm 메서드 호출");
		Contract contract = contractService.getContractDetailService(contractCode);
		model.addAttribute("contract", contract);
		
		return "/contract/modifyContract.do";
	}
	
	//계약을 수정합니다 
	@RequestMapping(value="/modifyContract.do", method=RequestMethod.POST)
	public String modifyContract(ContractCommand contractCommand, HttpServletRequest request){
		log.debug("ContractController의 modifyContract 메서드 호출");
		log.debug("contractCommand====> "+contractCommand);
		try {
			contractService.modifyContractService(contractCommand, request);
		} catch (Exception e) {
			log.debug("modifyContract 예외발생", e);
			e.printStackTrace();
		}
		return "redirect:/viewContractDetail.do?contractCode="+contractCommand.getContractCode();
	}
}
