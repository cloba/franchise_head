package org.ksmart.franchise.head.client.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.client.model.Client;
import org.ksmart.franchise.head.client.model.ClientCommand;
import org.ksmart.franchise.head.client.service.ClientService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ClientController {
	
	@Autowired
	private ClientService clientService;
	
	Logger log = Logger.getLogger(this.getClass());

	//거래처 리스트 조회
	@RequestMapping(value="/viewHeadClientList.do", method=RequestMethod.GET)
	public String viewHeadClientList(Model model, Search search){
		System.out.println("ClientController의 headViewHeadClientList메서드 ");
		
		
		List<Client> list = clientService.HeadClientListService(search);
		
		model.addAttribute("list", list);
		
		return "/client/viewHeadClientList";
		
		
	}
	//거래처 상세 정보 보는 메서드
	@RequestMapping(value="/viewHeadClientDetail.do", method=RequestMethod.GET)
	public String viewHeadClientDetail(Model model, String headClientCode){
		System.out.println("ClientController의 viewHeadClientDetail메서드 ");
		
		Client client = clientService.headClientDetailService(headClientCode);
		model.addAttribute("client", client);
		
		return "/client/viewHeadClientDetail";
		
	}
	
	//거래처 추가 폼 보여주는 메서드
	@RequestMapping(value="/addHeadClient.do", method=RequestMethod.GET)
	public String AddHeadClient(){
		System.out.println("ClientController의 AddHeadClient get메서드");
		return "/client/addHeadClientForm";
	}
		
	// 거래처등록 form에서 넘어오는 데이터를 받아서 처리하는 메서드
	@RequestMapping(value="/addHeadClient.do", method=RequestMethod.POST)
	public String addHeadClient(ClientCommand clientCommand, Model model){
		System.out.println("ClientController의 addHeadClient post메서드");
		System.out.println("getHeadClientParcleAddr :"+clientCommand.getHeadClientParcleAddr()); 
		clientService.addHeadClientService(clientCommand);

		return "redirect:/viewHeadClientList.do";
	}	
	
	//거래처 정보 수정 form 보여주는 메서드
	  @RequestMapping(value="/modifyClient.do", method=RequestMethod.GET)
	  public String modifyClient(Model model, String headClientCode){
		  System.out.println("ClientController의 modifyClient get메서드 ");
		  Client client =clientService.headClientDetailService(headClientCode); 

		  model.addAttribute("client", client);
		
		return "/client/viewHeadClientModifyForm";
		  
	  }
	  
	  //거래처 정보 처리하는 메서드
	  @RequestMapping(value="/modifyClient.do", method=RequestMethod.POST)
	  public String modifyClient(Model model, Client client){
		  System.out.println("ClientController의 modifyClient post메서드 ");
		  clientService.modifyHeadClientService(client);
		  System.out.println("getHeadClientCode"+client.getHeadClientCode());
		  //수정된 정보의 pk를 가져와 수정된 내역을 보여주는 페이지로 이동(디테일페이지)
		  String headClientCode= client.getHeadClientCode();
		 return "redirect:/viewHeadClientDetail.do?headClientCode="+headClientCode;
	  }
	
	
}
