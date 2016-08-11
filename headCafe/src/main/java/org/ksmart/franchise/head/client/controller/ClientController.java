package org.ksmart.franchise.head.client.controller;

import java.util.List;

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
	public String viewHeadClientDetail(Model model, String headClientCode){
		System.out.println("ClientController의 viewHeadClientDetail메서드 ");
		
		Client client = clientService.headClientDetailService(headClientCode);
		model.addAttribute("client", client);
		
		return "/client/viewHeadClientDetail";
		
	}
	
	//거래처 추가 폼 보여주는 메서드ㄴ
	@RequestMapping(value="/addHeadClient", method=RequestMethod.GET)
	public String AddHeadClient(){
		System.out.println("ClientController의 AddHeadClient get메서드");
		return "/client/addHeadClientForm";
	}
		
	// 거래처등록 form에서 넘어오는 데이터를 받아서 처리하는 메서드
	@RequestMapping(value="/addHeadClient", method=RequestMethod.POST)
	public String addHeadClient(ClientCommand clientCommand, Model model){
		System.out.println("ClientController의 addHeadClient post메서드");
		System.out.println("getHeadClientParcleAddr :"+clientCommand.getHeadClientParcleAddr()); 
		clientService.addHeadClient(clientCommand);

		return "redirect:/viewHeadClientList";
	}	
	
	
}
